package com.hwinterview.ecommerce.controller;

import com.hwinterview.ecommerce.data.entity.Cart;
import com.hwinterview.ecommerce.data.entity.CartItem;
import com.hwinterview.ecommerce.data.entity.Product;
import com.hwinterview.ecommerce.request.AddToCartRequest;
import com.hwinterview.ecommerce.service.CartService;
import com.hwinterview.ecommerce.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
@RequestMapping("/cart")
public class CartController {

    @Autowired
    private CartService cartService;

    //Get Product categories List
    @GetMapping("/items")
    public List<CartItem> getCartItems(@RequestHeader("AppSession") String sessionId){
        return  cartService.getCartItems(sessionId);
    }

    @PostMapping("/")
    public CartItem addItem(@RequestHeader("AppSession") String sessionId, @RequestBody AddToCartRequest addToCartRequest){
        return cartService.addCartItem(sessionId, addToCartRequest);
    }

    @PostMapping("/submit/")
    public Cart submitCart(@RequestHeader("AppSession") String sessionId){
        return cartService.submitCart(sessionId);
    }


}
