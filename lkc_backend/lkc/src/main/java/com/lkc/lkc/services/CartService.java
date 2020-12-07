package com.lkc.lkc.services;

import java.util.Optional;

import com.lkc.lkc.models.Product;
import com.lkc.lkc.models.UserLkc;
import com.lkc.lkc.repositories.UserRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CartService {
    @Autowired
    UserRepository userRepository;

    public boolean addToCart(Product product, String id) {
        Optional<UserLkc> optional = userRepository.findById(id);
        UserLkc user = optional.isPresent() ? optional.get() : null;
        if (user == null)
            return false;
        else {
            if (user.getCart().add(product)) {
                userRepository.save(user);
                return true;
            }
            return false;
        }
    }

    public boolean removeFromCart(String productId, String id) {
        Optional<UserLkc> optional = userRepository.findById(id);
        UserLkc user = optional.isPresent() ? null : optional.get();
        if (user == null)
            return false;
        else {
            if (user.getCart().removeIf(product -> product.getId().equals(productId))) {
                userRepository.save(user);
                return true;
            } else {
                return false;
            }
        }
    }

}
