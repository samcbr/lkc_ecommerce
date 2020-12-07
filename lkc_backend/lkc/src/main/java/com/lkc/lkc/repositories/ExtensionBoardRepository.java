package com.lkc.lkc.repositories;

import java.util.List;

import com.lkc.lkc.models.ExtensionBoard;

import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.mongodb.repository.Query;

public interface ExtensionBoardRepository extends MongoRepository<ExtensionBoard, String> {
    List<ExtensionBoard> findByType(String type);
}
