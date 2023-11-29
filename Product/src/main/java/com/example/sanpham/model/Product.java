package com.example.sanpham.model;

public class Product {
    private int code;
    private String name;
    private int quantity;
    private String madeIn;

    public Product() {
    }

    public Product(int code, String name, int quantity, String madeIn) {
        this.code = code;
        this.name = name;
        this.quantity = quantity;
        this.madeIn = madeIn;
    }

    public Product(String name, int quantity, String madeIn) {
        this.name = name;
        this.quantity = quantity;
        this.madeIn = madeIn;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getMadeIn() {
        return madeIn;
    }

    public void setMadeIn(String madeIn) {
        this.madeIn = madeIn;
    }

    @Override
    public String toString() {
        return "Product{" +
                "code=" + code +
                ", name='" + name + '\'' +
                ", quantity=" + quantity +
                ", madeIn='" + madeIn + '\'' +
                '}';
    }
}
