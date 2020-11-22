package com.lkc.lkc.services;

import com.lkc.lkc.models.UserLkc;
import com.lkc.lkc.repositories.UserRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AuthenticationService {
   @Autowired
   UserRepository userRepository;
   
   public boolean doSignUp(UserLkc user)
   {

       /* try
        {
            userRepository.findById(user.getEmail()).get();
        }
        catch(Exception e)
        {
            return false;
        }*/
        user=userRepository.save(user);
        if(user!=null)
        {
            return true;
        }
        else
        {
            return false;
        }
   }
}
