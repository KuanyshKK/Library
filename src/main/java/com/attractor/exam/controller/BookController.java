package com.attractor.exam.controller;

import com.attractor.exam.model.Book;
import com.attractor.exam.model.Category;
import com.attractor.exam.repository.BookRepository;
import com.attractor.exam.repository.CategoryRepository;
import com.attractor.exam.service.BookService;
import com.attractor.exam.service.FileSystemStorageService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.server.ResponseStatusException;

import java.time.LocalDate;
import java.util.List;

@Controller
@RequestMapping("/books")
public class BookController {

    private final BookRepository bookRepository;
    private final BookService bookService;
    private final FileSystemStorageService storageService;
    private final CategoryRepository categoryRepository;

    public BookController(BookRepository bookRepository, BookService bookService, FileSystemStorageService storageService, CategoryRepository categoryRepository) {
        this.bookRepository = bookRepository;
        this.bookService = bookService;
        this.storageService = storageService;
        this.categoryRepository = categoryRepository;
    }

    @GetMapping
    public String getBooks(Model model, @RequestParam(defaultValue = "1", required = false) int page) {
        int pageSize = 8;
        int currentPage = page - 1;
        if (currentPage < 0)
            currentPage = 0;

        Pageable pageable = PageRequest.of(currentPage, pageSize, Sort.by(Sort.Order.desc("addingDate")));
        Page<Book> pageBooks = bookRepository.findAll(pageable);
        List<Book> books = pageBooks.toList();
        model.addAttribute("hasNext", pageBooks.hasNext());
        model.addAttribute("hasPrevious", pageBooks.hasPrevious());
        model.addAttribute("currentPage", ++currentPage);
        model.addAttribute("books", books);
        return "books";
    }

    @GetMapping("/add")
    public String getBookAddPage(Model model) {
        List<Category> categories = categoryRepository.findAll();
        model.addAttribute("categories", categories);
        return "bookAdd";
    }

    @PostMapping("/add")
    public String addBook(@RequestParam String name,
                          @RequestParam String author,
                          @RequestParam MultipartFile file,
                          @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate yearOfIssue,
                          @RequestParam String categoryId,
                          @RequestParam String description) {
        if (yearOfIssue == null)
            yearOfIssue = LocalDate.now();
        Category category = categoryRepository.findById(categoryId).orElseThrow(() -> new ResponseStatusException(
                HttpStatus.NOT_FOUND,
                String.format("Категория с id %s не найден", categoryId)
        ));
        Book book = new Book(name, author, file.getOriginalFilename(), yearOfIssue, description, category);
        storageService.store(file);
        bookRepository.save(book);
        return "redirect:/";
    }

    @GetMapping("/{id}")
    public String getBook(Model model,
                          @PathVariable String id) {
        Book book = bookService.getById(id);
        model.addAttribute("book", book);
        return "bookInfo";
    }

    @GetMapping("/{id}/update")
    public String getUpdateBook(Model model,
                                @PathVariable String id) {
        Book book = bookService.getById(id);
        model.addAttribute("book", book);
        return "bookUpdate";
    }

    @PostMapping("/{id}/update")
    public String updateCategory(@PathVariable String id,
                                 @RequestParam String name,
                                 @RequestParam String author,
                                 @RequestParam(required = false) MultipartFile file,
                                 @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate yearOfIssue,
                                 @RequestParam String description) {


        storageService.store(file);
        Book book = bookService.getById(id);
        book.setName(name);
        book.setAuthor(author);
        book.setPhoto(file.getOriginalFilename());
        book.setYearOfIssue(yearOfIssue);
        book.setDescription(description);
        bookRepository.save(book);
        return "redirect:/";
    }

    @GetMapping("/{id}/deletePage")
    public String getDeleteCategory(
            @PathVariable String id) {
        return "bookDelete";
    }

    @GetMapping("/{id}/delete")
    public String deleteBook(
            @PathVariable String id) {
        Book book = bookService.getById(id);
        bookRepository.delete(book);
        return "redirect:/";
    }


}
