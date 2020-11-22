package com.lkc.lkc.services;

import java.util.List;

import com.lkc.lkc.models.ExtensionBoard;
import com.lkc.lkc.repositories.ExtensionBoardRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductService {
    @Autowired
    ExtensionBoardRepository extensionBoardRepository;

    public List<ExtensionBoard> getExtensionBoards()
    {
        return extensionBoardRepository.findAll();
    }
    public void addExtensionBoardsInBulk(List<ExtensionBoard> list)
    {
        extensionBoardRepository.saveAll(list);
        
    }
}
