package com.lkc.lkc.repositories;

import com.lkc.lkc.models.Banner;

import org.springframework.data.mongodb.repository.MongoRepository;

public interface BannerRepository extends MongoRepository<Banner,String> {
    
}
