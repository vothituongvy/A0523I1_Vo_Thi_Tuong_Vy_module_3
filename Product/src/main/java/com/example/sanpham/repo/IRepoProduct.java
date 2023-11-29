package com.example.sanpham.repo;

import com.example.sanpham.model.Product;

import java.util.List;

public interface IRepoProduct {
    void add(Product product);
    void delete(int id);
    void update(int id,Product product);

    List<Product> findAll();

}
