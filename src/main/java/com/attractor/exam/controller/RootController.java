package com.attractor.exam.controller;

import com.attractor.exam.model.Book;
import com.attractor.exam.repository.BookRepository;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
@AllArgsConstructor
public class RootController {

    private final BookRepository bookRepository;

    @GetMapping
    public String root(Model model){
        int page = 1;
        int pageSize = 8;
        int currentPage = page - 1;
        if(currentPage < 0)
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


}
