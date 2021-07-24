package com.attractor.exam.controller;

import com.attractor.exam.exception.StorageFileNotFoundException;
import com.attractor.exam.service.StorageService;
import lombok.AllArgsConstructor;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
@AllArgsConstructor
public class FileExampleController {
    private final StorageService storageService;

    @GetMapping("/files/{filename:.+}")
    public ResponseEntity<Resource> getFile(@PathVariable String filename){
        Resource file = storageService.loadAsResource(filename);
        return ResponseEntity.ok().header(
                HttpHeaders.CONTENT_DISPOSITION,
                "attachment; filename= \"" + file.getFilename() + "\"")
                .body(file);

    }

    @ExceptionHandler(StorageFileNotFoundException.class)
    public ResponseEntity<?> fileNotFound(StorageFileNotFoundException e){
        return ResponseEntity.notFound().build();
    }
}
