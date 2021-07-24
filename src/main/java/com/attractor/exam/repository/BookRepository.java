package com.attractor.exam.repository;

import com.attractor.exam.model.Book;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface BookRepository extends MongoRepository<Book, String> {
    Page<Book> findAll(Pageable pageable);
}
