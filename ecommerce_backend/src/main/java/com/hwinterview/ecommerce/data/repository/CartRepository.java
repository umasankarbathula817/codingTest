package com.hwinterview.ecommerce.data.repository;

import com.hwinterview.ecommerce.data.entity.Cart;
import com.hwinterview.ecommerce.data.model.CartStatus;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.web.bind.annotation.RestController;

public interface CartRepository extends JpaRepository<Cart, Long> {
    Cart findBySessionId(String sessionId);

    Cart findBySessionIdAndCartStatus(String sessionId, CartStatus current);
}
