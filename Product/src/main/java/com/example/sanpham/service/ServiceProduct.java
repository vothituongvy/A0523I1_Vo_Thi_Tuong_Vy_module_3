package com.example.sanpham.service;

import com.example.sanpham.model.Product;
import com.example.sanpham.repo.IRepoProduct;
import com.example.sanpham.repo.RepoProduct;

import java.util.List;

public class ServiceProduct implements IService{
    private RepoProduct iRepoProduct=new RepoProduct();

    @Override
    public void save(Product product) {
        iRepoProduct.add(product);
    }

    @Override
    public boolean delete(int id) {
        if(iRepoProduct.findId(id)){
            iRepoProduct.delete(id);
            return true;
        }
        return false;
    }



    @Override
    public List<Product> findAll() {
        return iRepoProduct.findAll();
    }

    @Override
    public void update(int id, Product product) {
        iRepoProduct.update(id,product);
    }

    @Override
    public Product findObject(int id) {
        return iRepoProduct.findObject(id);
    }

}
