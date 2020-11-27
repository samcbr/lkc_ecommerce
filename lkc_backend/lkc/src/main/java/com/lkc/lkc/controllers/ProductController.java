package com.lkc.lkc.controllers;

import java.util.List;
import java.util.stream.Collectors;

import com.lkc.lkc.models.Banner;
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
        return new ResponseEntity<Object>(new Response("success",list),HttpStatus.OK);
    }

    @PostMapping("/extensionBoards/bulk")
    public ResponseEntity<Object> addExtensionBoardsInBulk(@RequestBody List<ExtensionBoard> list)
    {
        productService.addExtensionBoardsInBulk(list);
        return ResponseEntity.ok(new Response("success",null));
    }

    @GetMapping("/banners")
    public ResponseEntity<Object> getBanners(){
        List<String> list = productService.getBanners().stream().map((item)->item.url).collect(Collectors.toList());
        return ResponseEntity.ok(new Response("success",list));
    }

    @PostMapping("/banners")
    public ResponseEntity<Object> addBanners(@RequestBody List<String> list)
    {
        if(list.isEmpty())
        {
            return new ResponseEntity<Object>(new Response("fail","No banners provided in the list"),HttpStatus.BAD_REQUEST);
        }
        List<Banner> banners=list.stream().map((item)->new Banner(item)).collect(Collectors.toList());
        productService.addBanners(banners);
        return ResponseEntity.ok(new Response("success",null));
    }

}
