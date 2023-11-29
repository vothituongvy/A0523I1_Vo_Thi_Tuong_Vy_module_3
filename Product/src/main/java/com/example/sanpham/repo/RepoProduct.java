package com.example.sanpham.repo;

import com.example.sanpham.model.Product;

import java.util.ArrayList;
import java.util.List;

public class RepoProduct implements IRepoProduct {
    private static List<Product> list;

    static {
        list = new ArrayList<>();
        list.add(new Product(1, "Milk", 15, "VietNam"));
        list.add(new Product(2, "Coca", 10, "USA"));
        list.add(new Product(3, "Alcohol", 20, "ThaiLand"));
    }

    @Override
    public void add(Product product) {
        list.add(product);
    }

    public Product findObject(int id){
        Product product=new Product();
        for (int i = 0; i < list.size(); i++) {
            if (list.get(i).getCode() == id) {
                product=list.get(i);
            }
        }
        return product;
    }

    public boolean findId(int id) {
        for (int i = 0; i < list.size(); i++) {
            if (list.get(i).getCode() == id) {
                return true;
            }
        }
        return false;
    }

    @Override
    public void delete(int id) {
        for (int i = 0; i < list.size(); i++) {
            if (list.get(i).getCode() == id) {
                list.remove(i);
            }
        }

    }

    @Override
    public void update(int id, Product product) {
        for (int i = 0; i < list.size(); i++) {
            if (list.get(i).getCode() == id) {
                list.get(i).setName(product.getName());
                list.get(i).setMadeIn(product.getMadeIn());
                list.get(i).setQuantity(product.getQuantity());
                break;
            }
        }
    }





    @Override
    public List<Product> findAll() {
        return list;
    }


}
