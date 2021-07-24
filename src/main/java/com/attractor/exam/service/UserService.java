package com.attractor.exam.service;

import com.attractor.exam.model.Book;
import com.attractor.exam.model.User;
import com.attractor.exam.repository.UserRepository;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

@Service
public class UserService {

    private final UserRepository userRepository;
    private final BookService bookService;

    public UserService(UserRepository userRepository, BookService bookService) {
        this.userRepository = userRepository;
        this.bookService = bookService;
    }

    public User getById(String id){
        return userRepository.findById(id).orElseThrow(() -> new ResponseStatusException(
                HttpStatus.NOT_FOUND,
                String.format("Пользователь с id %s не найден!" , id)
        ));
    }

//    public User addBookForUser(String bookId, String email){
//        Book book = bookService.getById(bookId);
//        User user = userRepository.getUserByEmail(email);
//        if(user.getBooks().size()<=3){
//
//        }
//    }
}
