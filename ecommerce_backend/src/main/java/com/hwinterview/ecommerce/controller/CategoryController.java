package com.hwinterview.ecommerce.controller;

import com.hwinterview.ecommerce.data.entity.ProductCategory;
import com.hwinterview.ecommerce.data.repository.ProductCategoryRepository;
import com.hwinterview.ecommerce.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/categories")
public class CategoryController {

    @Autowired
    private CategoryService categoryService;

    //Get Product categories List
    @GetMapping("/")
    public List<ProductCategory> getAllCategories(){
        return  categoryService.getAllCategories();
    }

}
