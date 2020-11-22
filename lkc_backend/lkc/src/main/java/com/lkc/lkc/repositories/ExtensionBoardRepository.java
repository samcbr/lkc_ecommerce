package com.lkc.lkc.repositories;

import com.lkc.lkc.models.ExtensionBoard;

import org.springframework.data.mongodb.repository.MongoRepository;

public interface ExtensionBoardRepository extends MongoRepository<ExtensionBoard,String>{
    
}
