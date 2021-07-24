package com.attractor.exam.model;

import lombok.Data;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import java.time.LocalDate;
import java.util.UUID;

@Document(collection = "books")
@Data
public class Book {
    @Id
    private String id;
    private String name;
    private String author;
    private String photo;
    private LocalDate yearOfIssue;
    private String description;
    private LocalDate addingDate;
    private String status;

    public Book(String name, String author, String photo, LocalDate yearOfIssue, String description) {
        this.id = UUID.randomUUID().toString();
        this.name = name;
        this.author = author;
        this.photo = photo;
        this.yearOfIssue = yearOfIssue;
        this.description = description;
        this.addingDate = LocalDate.now();
        this.status = "В наличии";
    }
}
