package com.hwinterview.ecommerce.data.repository;

import com.hwinterview.ecommerce.data.entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ProductRepository extends JpaRepository<Product, Long> {
    List<Product> findByProductCategoryId(Long id);
}
