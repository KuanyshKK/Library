package com.attractor.exam.repository;


import com.attractor.exam.model.User;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface UserRepository extends MongoRepository<User, String> {
    User getUserByEmail(String email);
}
