package com.lkc.lkc.services;

import java.util.Optional;

import com.lkc.lkc.models.UserLkc;
import com.lkc.lkc.repositories.UserRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AuthenticationService {
    @Autowired
    UserRepository userRepository;

    public boolean doSignUp(UserLkc user) {

        try {
            userRepository.findById(user.getEmail()).orElseThrow();
            return false;
        } catch (Exception e) {

        }
        user = userRepository.save(user);
        if (user != null) {
            return true;
        } else {
            return false;
        }
    }
    public UserLkc getUserDetails(String id)
    {
        Optional<UserLkc> optional=userRepository.findById(id);
        if(optional.isPresent())
            return optional.get();

        else
            return null;
    }
}
