package com.lkc.lkc.controllers;

import java.util.List;

import com.lkc.lkc.models.ExtensionBoard;
import com.lkc.lkc.models.Response;
import com.lkc.lkc.services.ProductService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ProductController {

    @Autowired
    ProductService productService;

    @GetMapping("/extensionBoards")
    public ResponseEntity<Object> getProducts() {
        List<ExtensionBoard> list = productService.getExtensionBoards();
        return new ResponseEntity<Object>(new Response("success",list),HttpStatus.ACCEPTED);
    }

    @PostMapping("/extensionBoards/bulk")
    public ResponseEntity<Object> addExtensionBoardsInBulk(@RequestBody List<ExtensionBoard> list)
    {
        productService.addExtensionBoardsInBulk(list);
        return ResponseEntity.ok(new Response("success",null));
    }

}
