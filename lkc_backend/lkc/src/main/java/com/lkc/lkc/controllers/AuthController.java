package com.lkc.lkc.controllers;

import java.util.HashMap;

import com.lkc.lkc.models.Login;
import com.lkc.lkc.models.Response;
import com.lkc.lkc.models.UserLkc;
import com.lkc.lkc.services.AuthenticationService;
import com.lkc.lkc.services.MyUserDetailService;
import com.lkc.lkc.utils.JwtUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class AuthController {

    @Autowired
    AuthenticationManager authenticationManager;

    @Autowired
    MyUserDetailService userDetailService;

    @Autowired
    JwtUtil jwtUtil;

    @Autowired
    AuthenticationService authenticationService;

    

    @PostMapping("/login")
    public ResponseEntity<Object> doLogin(@RequestBody Login user) throws Exception
    {
        HashMap<String,Object> map=new HashMap<String,Object>();
        try{
            authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(user.getUserName(), user.getPassword()));
        }
        catch(Exception e)
        {
            
            map.put("message","Incorrect username or password");
            return new ResponseEntity<Object>(new Response("fail",map), HttpStatus.BAD_REQUEST);
        }

        final UserDetails userDetails=userDetailService.loadUserByUsername(user.getUserName());

        String token=jwtUtil.generateToken(userDetails);
        map.put("authToken", token);
        return ResponseEntity.ok(new Response("success",map));
    }
    @PostMapping("/signUp")
    public ResponseEntity<Object> doSignUp(@RequestBody UserLkc user) throws Exception
    {
        HashMap<String,Object> map=new HashMap<String,Object>();
        boolean status=authenticationService.doSignUp(user);
        if(status)
        {
            map.put("user", user);
            return ResponseEntity.ok(new Response("success",map));
        }
        map.put("message","UserName already exists");
        return new ResponseEntity<Object>(new Response("fail",map),HttpStatus.BAD_REQUEST);
    }
}
