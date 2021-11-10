package com.hwinterview.ecommerce.controller;

import com.hwinterview.ecommerce.data.entity.Product;
import com.hwinterview.ecommerce.data.entity.ProductCategory;
import com.hwinterview.ecommerce.service.CategoryService;
import com.hwinterview.ecommerce.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/products")
public class ProductController {

    @Autowired
    private ProductService productService;

    //Get Product categories List
    @GetMapping("/")
    public List<Product> getAllCategories(){
        return  productService.getAllProducts();
    }

    @GetMapping("/bycategory/{id}")
    public List<Product> getProductsByCategory(@PathVariable("id") Long id){
        return  productService.getProductsByCategory(id);
    }


}
