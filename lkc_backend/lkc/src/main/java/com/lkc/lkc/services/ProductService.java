package com.lkc.lkc.services;

import java.util.List;
import java.util.Optional;

import javax.management.Query;

import com.lkc.lkc.models.Banner;
import com.lkc.lkc.models.ExtensionBoard;
import com.lkc.lkc.models.MultiPlug;
import com.lkc.lkc.models.Product;
import com.lkc.lkc.repositories.BannerRepository;
import com.lkc.lkc.repositories.ExtensionBoardRepository;
import com.lkc.lkc.repositories.MultiPlugRepository;
import com.lkc.lkc.repositories.ProductRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.stereotype.Service;

@Service
public class ProductService {
    @Autowired
    ExtensionBoardRepository extensionBoardRepository;

    @Autowired
    ProductRepository productRepository;

    @Autowired
    BannerRepository bannerRepository;

    @Autowired
    MultiPlugRepository multiPlugRepository;

    public List<ExtensionBoard> getExtensionBoards() {
        return extensionBoardRepository.findByType("extensionBoard");
    }

    public void addExtensionBoardsInBulk(List<ExtensionBoard> list) {
        extensionBoardRepository.saveAll(list);
    }

    public void addExtensionBoard(ExtensionBoard extensionBoard) {
        extensionBoardRepository.save(extensionBoard);
    }

    public ExtensionBoard getExtensionBoardById(String id) {
        Optional<ExtensionBoard> optional = extensionBoardRepository.findById(id);
        if (optional.isPresent()) {
            return optional.get();
        }
        else {
            return null;
        }
    }

    public List<Banner> getBanners() {
        return bannerRepository.findAll();
    }

    public void addBanners(List<Banner> list) {
        bannerRepository.saveAll(list);
    }

    public void addMultiPlugsInBulk(List<MultiPlug> list) {
        multiPlugRepository.saveAll(list);
        // productRepository.saveAll(list);
    }

}
