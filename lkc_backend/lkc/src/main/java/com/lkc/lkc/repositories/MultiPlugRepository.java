package com.lkc.lkc.repositories;

import com.lkc.lkc.models.MultiPlug;

import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.repository.MongoRepository;

@Document(collection = "product")
public interface MultiPlugRepository extends MongoRepository<MultiPlug, String> {

}
