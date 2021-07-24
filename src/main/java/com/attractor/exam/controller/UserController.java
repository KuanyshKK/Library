package com.attractor.exam.controller;

import com.attractor.exam.model.Book;
import com.attractor.exam.model.User;
import com.attractor.exam.model.UserBook;
import com.attractor.exam.repository.BookRepository;
import com.attractor.exam.repository.UserRepository;
import com.attractor.exam.service.BookService;
import com.attractor.exam.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/users")
public class UserController {
    private final UserRepository userRepository;
    private final BookService bookService;
    private final BookRepository bookRepository;
    private final UserService userService;

    public UserController(UserRepository userRepository, BookService bookService, BookRepository bookRepository, UserService userService) {
        this.userRepository = userRepository;
        this.bookService = bookService;
        this.bookRepository = bookRepository;
        this.userService = userService;
    }

    @GetMapping("/register")
    public String getRegisterPage(){
        return "userRegister";
    }

    @PostMapping("/add")
    public String addUser(@RequestParam String name,
                          @RequestParam String surname,
                          @RequestParam String email,
                          @RequestParam String phoneNumber){
        User user = new User(name, surname, email, phoneNumber);
        userRepository.save(user);
        return "redirect:/";
    }

    @PostMapping("/takeBook")
    public String takeBook(@RequestParam String bookId,
                            @RequestParam String email,
                            Model model){
        List<String> errors = new ArrayList<>();
        Book book = bookService.getById(bookId);
        if(book==null){
            errors.add("Книги нету в библиотеке, невозможно ее взять!");
            model.addAttribute("errors", errors);
            return "result";
        }
        User user = userRepository.getUserByEmail(email);
        if(user==null){
            errors.add("Нету пользователя с таким еmail, нельзя выдать книгу!");
            model.addAttribute("errors", errors);
            return "result";
        }
        if(user.getBooks().size()<3){
            book.setStatus("В чтении");
            bookRepository.save(book);
            user.getBooks().add(book);
            userRepository.save(user);
            errors.add(String.format("Вы взяли на чтение книгу %s", book.getName()));
        }else {
            errors.add("Нельзя брать на чтение больше 3 книг!");
        }

        model.addAttribute("errors", errors);
        return "result";

    }

    @GetMapping("/login")
    public String getLoginPage(){
        return "userLogin";
    }

    @PostMapping("/login")
    public String loginUser(@RequestParam String email,
                            Model model){
        User user = userRepository.getUserByEmail(email);
        model.addAttribute("user",user);
        return "userBooks";
    }


    @GetMapping("/{id}/pass/{bookId}")
    public String getPassBookPage(@PathVariable String id,
                                  @PathVariable String bookId,
                                  Model model){
        User user = userService.getById(id);
        Book book = bookService.getById(bookId);
        UserBook userBook = new UserBook();
        userBook.setUserId(user.getId());
        userBook.setBookId(book.getId());
        model.addAttribute("userBook", userBook);
        return "bookPass";
    }

    @PostMapping("/{id}/pass/{bookId}")
    public String passBook(@PathVariable String id,
                           @PathVariable String bookId,
                           Model model){
        List<String> errors = new ArrayList<>();
        User user = userService.getById(id);
        Book book = bookService.getById(bookId);
        user.getBooks().removeIf(b->b.getId().equals(bookId));
        book.setStatus("В наличии");
        userRepository.save(user);
        bookRepository.save(book);
        errors.add(String.format("Вы сдали книгу - %s",book.getName()));
        model.addAttribute("errors",errors);
        return "bookPassResult";
    }

    @GetMapping("/takenBooks")
    public String getTakenBooks(Model model) {
        List<User> users = userRepository.findAll();
        var userBooks = users.stream().filter(user -> user.getBooks().size()>0).collect(Collectors.toList());
        model.addAttribute("userBooks", userBooks);
        return "takenBooks";
    }
}
