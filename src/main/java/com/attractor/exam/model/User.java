package com.attractor.exam.model;

import lombok.Data;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.DBRef;
import org.springframework.data.mongodb.core.mapping.Document;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Document(collection = "users")
@Data
public class User {
    @Id
    private String id;
    private String name;
    private String surname;
    private String email;
    private String phoneNumber;
    @DBRef
    private List<Book> books = new ArrayList<>();

    public User(String name, String surname, String email, String phoneNumber) {
        this.id = UUID.randomUUID().toString();
        this.name = name;
        this.surname = surname;
        this.email = email;
        this.phoneNumber = phoneNumber;
    }
}
