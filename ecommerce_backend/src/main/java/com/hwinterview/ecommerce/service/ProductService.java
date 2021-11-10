package com.hwinterview.ecommerce.service;

import com.hwinterview.ecommerce.data.entity.Product;
import com.hwinterview.ecommerce.data.entity.ProductCategory;
import com.hwinterview.ecommerce.data.repository.ProductCategoryRepository;
import com.hwinterview.ecommerce.data.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductService {

    @Autowired
    private ProductRepository productRepository;

    public List<Product> getAllProducts(){

        return productRepository.findAll();

    }


    public List<Product> getProductsByCategory(Long id) {
        return productRepository.findByProductCategoryId(id);
    }
}
