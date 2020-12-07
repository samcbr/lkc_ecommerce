package com.lkc.lkc.controllers;

import java.util.HashMap;

import com.lkc.lkc.models.Product;
import com.lkc.lkc.models.Response;
import com.lkc.lkc.services.CartService;
import com.lkc.lkc.utils.JwtUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class CartController {

    @Autowired
    CartService cartService;

    @Autowired
    JwtUtil jwtUtil;

    @PostMapping("/addToCart")
    public ResponseEntity<Object> addToCart(@RequestBody Product product,
            @RequestHeader("Authorization") String token) {
        HashMap<String, Object> map = new HashMap<String, Object>();
        String id = jwtUtil.extractUsername(token);
        boolean result = cartService.addToCart(product, id);
        if (result) {
            return ResponseEntity.ok(new Response("success", null));
        } else {
            map.put("message", "Product could not be added to cart");
            return new ResponseEntity<Object>(new Response("fail", map), HttpStatus.BAD_REQUEST);
        }
    }

    @GetMapping("/removeFromCart")
    public ResponseEntity<Object> removeFromCart(@RequestBody String productId,
            @RequestHeader("Authorization") String token) {
        HashMap<String, Object> map = new HashMap<String, Object>();
        String id = jwtUtil.extractUsername(token);
        boolean result = cartService.removeFromCart(productId, id);
        if (result) {
            return ResponseEntity.ok(new Response("success", map));
        } else {
            map.put("message", "Product could not be removed from cart");
            return new ResponseEntity<Object>(new Response("fail", map), HttpStatus.BAD_REQUEST);
        }
    }
}
