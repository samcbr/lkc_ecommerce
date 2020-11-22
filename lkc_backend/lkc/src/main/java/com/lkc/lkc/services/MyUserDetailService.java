package com.lkc.lkc.services;

import java.util.ArrayList;
import java.util.Optional;

import com.lkc.lkc.models.UserLkc;
import com.lkc.lkc.repositories.UserRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class MyUserDetailService implements UserDetailsService {

    @Autowired
    UserRepository userRepository;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        // TODO connect to mongodb and call users collection to fetch user data by username
        
        
        Optional<UserLkc> optionalEntity =  userRepository.findById(username);
        if(optionalEntity!=null)
        {
            UserLkc user = optionalEntity.get();
            return new User(user.getEmail(),user.getPassword(),new ArrayList<>());
        }
        throw new UsernameNotFoundException(username);
        
    }

    @Bean
    public PasswordEncoder passwordEncoder()
    {
        return NoOpPasswordEncoder.getInstance();
    }
    
}
