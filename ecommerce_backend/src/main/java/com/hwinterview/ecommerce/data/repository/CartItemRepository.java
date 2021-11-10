package com.hwinterview.ecommerce.data.repository;

import com.hwinterview.ecommerce.data.entity.CartItem;
import com.hwinterview.ecommerce.data.model.CartStatus;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CartItemRepository extends JpaRepository<CartItem, Long> {
    CartItem findByCartIdAndProductId(Long id, Long productId);
}
