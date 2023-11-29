package com.example.sanpham.service;
import java.util.List;
import com.example.sanpham.model.Product;

public interface IService {
    void save(Product product);
    boolean delete(int id);
    List<Product> findAll();
    void update(int id,Product product);
    Product findObject(int id);
}
