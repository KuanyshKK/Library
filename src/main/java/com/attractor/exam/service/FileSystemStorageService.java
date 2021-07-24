package com.attractor.exam.service;

import com.attractor.exam.configuration.StorageProperties;
import com.attractor.exam.exception.StorageException;
import com.attractor.exam.exception.StorageFileNotFoundException;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

@Service
public class FileSystemStorageService implements StorageService {
    private final Path rootLocation;

    public FileSystemStorageService(StorageProperties properties) {
        this.rootLocation = Paths.get(properties.getLocation());
    }

    @Override
    public void init() {
        try{
            Files.createDirectories(rootLocation);
        }
        catch (IOException ex){
            throw new StorageException("Невозможно создать хранилище");
        }
    }

    @Override
    public void store(MultipartFile file) {
        try{
            if(file.isEmpty())
                throw new StorageException("Невозможно загрузить пустой файл");
            Path destinationFile = this.rootLocation.resolve(
                    Paths.get(file.getOriginalFilename()))
                    .normalize().toAbsolutePath();
            if(!destinationFile.getParent().equals(this.rootLocation.toAbsolutePath()))
                throw new StorageException("Нельзя хранить файл за пределами текущего каталога");

            try(InputStream stream = file.getInputStream()){
                Files.copy(stream, destinationFile, StandardCopyOption.REPLACE_EXISTING);
            }
        }
        catch (IOException e){
            throw new StorageException("Ошибка в сохранени файла");
        }

    }

    @Override
    public Path load(String filename) {
        return rootLocation.resolve(filename);
    }

    @Override
    public Resource loadAsResource(String filename) {
        try{
            Path file = load(filename);
            Resource resource = new UrlResource(file.toUri());
            if(resource.exists() || resource.isReadable())
                return resource;
            else
                throw new StorageFileNotFoundException("Невозможно считать файл" + filename);
        }
        catch (MalformedURLException e){
            throw new StorageFileNotFoundException("Невозможно считать файл" + filename);
        }
    }
}
