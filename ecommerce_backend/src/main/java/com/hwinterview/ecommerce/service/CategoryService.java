package com.hwinterview.ecommerce.service;

import com.hwinterview.ecommerce.data.entity.ProductCategory;
import com.hwinterview.ecommerce.data.repository.ProductCategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryService {

    @Autowired
    private ProductCategoryRepository productCategoryRepository;

    public List<ProductCategory> getAllCategories(){

        return productCategoryRepository.findAll();

    }


}
