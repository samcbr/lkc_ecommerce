package com.lkc.lkc.repositories;

import com.lkc.lkc.models.UserLkc;

import org.springframework.data.mongodb.repository.MongoRepository;

public interface UserRepository extends MongoRepository<UserLkc,String> {
    
}
