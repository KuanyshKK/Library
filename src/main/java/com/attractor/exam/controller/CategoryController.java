package com.attractor.exam.controller;

import com.attractor.exam.model.Category;
import com.attractor.exam.repository.CategoryRepository;
import com.attractor.exam.service.CategoryService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/categories")
public class CategoryController {
    private final CategoryRepository categoryRepository;
    private final CategoryService service;

    public CategoryController(CategoryRepository categoryRepository, CategoryService service) {
        this.categoryRepository = categoryRepository;
        this.service = service;
    }


    @GetMapping
    public String getCategories(Model model){
        List<Category> categories = categoryRepository.findAll();
        model.addAttribute("categories", categories);
        return "categories";
    }

    @GetMapping("/add")
    public String getCategoryAddPage(){
        return "categoryAdd";
    }

    @PostMapping("/add")
    public String addCategory(@RequestParam String name,
                              @RequestParam String description){
        Category category = new Category(name, description);
        categoryRepository.save(category);
        return "redirect:/categories";
    }

    @GetMapping("/{id}")
    public String getCategory(Model model,
                              @PathVariable String id){
        Category category = service.getById(id);
        model.addAttribute("category", category);
        return "categoryInfo";
    }

    @GetMapping("/{id}/update")
    public String getUpdateCategory(Model model,
                                    @PathVariable String id){
        Category category = service.getById(id);
        model.addAttribute("category", category);
        return "categoryUpdate";
    }

    @PostMapping("/{id}/update")
    public String updateCategory(@PathVariable String id,
                                 @RequestParam String name,
                                 @RequestParam String description){
        Category category = service.getById(id);
        category.setName(name);
        category.setDescription(description);
        categoryRepository.save(category);
        return "redirect:/categories";
    }

    @GetMapping("/{id}/deletePage")
    public String getDeleteCategory(
            @PathVariable String id){
        return "categoryDelete";
    }

    @GetMapping("/{id}/delete")
    public String deleteCategory(
            @PathVariable String id){
        Category category = service.getById(id);
        categoryRepository.delete(category);
        return "redirect:/categories";
    }
}
