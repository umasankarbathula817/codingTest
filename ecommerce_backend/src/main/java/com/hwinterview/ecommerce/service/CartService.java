package com.hwinterview.ecommerce.service;

import com.hwinterview.ecommerce.data.entity.Cart;
import com.hwinterview.ecommerce.data.entity.CartItem;
import com.hwinterview.ecommerce.data.entity.Product;
import com.hwinterview.ecommerce.data.model.CartStatus;
import com.hwinterview.ecommerce.data.repository.CartItemRepository;
import com.hwinterview.ecommerce.data.repository.CartRepository;
import com.hwinterview.ecommerce.data.repository.ProductRepository;
import com.hwinterview.ecommerce.request.AddToCartRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CartService {

    @Autowired
    private CartRepository cartRepository;

    @Autowired
    private CartItemRepository cartItemRepository;

    @Autowired
    private ProductRepository productRepository;

    public List<CartItem> getCartItems(String sessionId) {
        Cart cart = getCurrentCart(sessionId);
        return cart.getCartItems();
    }

    private Cart getCurrentCart(String sessionId) {
        Cart cart = cartRepository.findBySessionId(sessionId);
        if (cart == null) {
            cart = new Cart();
            cart.setSessionId(sessionId);
            cart.setCartStatus(CartStatus.CURRENT);
            cart.setTotalAmount(0d);
            cartRepository.save(cart);
        }
        return cart;
    }

    public CartItem addCartItem(String sessionId, AddToCartRequest addToCartRequest) {
        Cart cart = getCurrentCart(sessionId);
        CartItem cartItem = cartItemRepository.findByCartIdAndProductId(cart.getId(), addToCartRequest.getProductId());
        Product product = productRepository.findById(addToCartRequest.getProductId()).get();
        if (cartItem == null) {
            cartItem = new CartItem();
            cartItem.setCart(cart);
            cartItem.setProduct(product);
            cartItem.setQuantity(0l);
        }
        cartItem.setQuantity(addToCartRequest.getQuantity() + cartItem.getQuantity());
        cartItem.setAmount(product.getUnitPrice() * cartItem.getQuantity());
        return cartItemRepository.save(cartItem);
    }

    public Cart submitCart(String sessionId){
        Cart cart = getCurrentCart(sessionId);
        cart.setCartStatus(CartStatus.ORDERED);
        cart = cartRepository.save(cart);
        return cart;
    }
}
