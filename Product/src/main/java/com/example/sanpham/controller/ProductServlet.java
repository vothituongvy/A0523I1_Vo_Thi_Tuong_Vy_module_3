package com.example.sanpham.controller;

import com.example.sanpham.model.Product;
import com.example.sanpham.repo.RepoProduct;
import com.example.sanpham.service.IService;
import com.example.sanpham.service.ServiceProduct;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ProductServlet", value = "/product-servlet")
public class ProductServlet extends HttpServlet {
    private IService serviceProduct= new ServiceProduct();
    private RepoProduct repoProduct=new RepoProduct();
    private void showList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("list",serviceProduct.findAll());
        RequestDispatcher requestDispatcher=request.getRequestDispatcher("list.jsp");
        requestDispatcher.forward(request,response);
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action=request.getParameter("action");
        if(action == null) {
            action = "";
        }
        switch (action){
            case "showFormCreate":
                showFormCreate(request,response);
                break;
            case "showFormDelete":
                showFormDelete(request,response);
                break;
            case "showFormUpdate":
                showFormUpdate(request,response);
                break;
            case "showFormView":
                showFormView(request,response);
                break;
            default:
                showList(request,response);
        }
    }

    private void showFormView(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id=Integer.parseInt(request.getParameter("id"));
        Product product=serviceProduct.findObject(id);
        request.setAttribute("product",product);
        RequestDispatcher requestDispatcher=request.getRequestDispatcher("view.jsp");
        requestDispatcher.forward(request,response);
    }

    private void showFormDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher=request.getRequestDispatcher("delete.jsp");
        requestDispatcher.forward(request,response);
    }

    private void showFormCreate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher=request.getRequestDispatcher("create.jsp");
        requestDispatcher.forward(request,response);
    }
    private void showFormUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id=Integer.parseInt(request.getParameter("id"));
        Product product= serviceProduct.findObject(id);
        request.setAttribute("product",product);
        RequestDispatcher requestDispatcher=request.getRequestDispatcher("update.jsp");
        requestDispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action=request.getParameter("action");
        if(action == null) {
            action = "";
        }
        switch (action){
            case "create":
                create(request,response);
                break;
            case "delete":
                delete(request,response);
            case "update":
                update(request,response);
                break;
        }

    }

    private void update(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int id=Integer.parseInt(request.getParameter("code"));
        String name=request.getParameter("name");
        int quantity=Integer.parseInt(request.getParameter("quantity"));
        String madeIn=request.getParameter("madeIn");
        Product product=serviceProduct.findObject(id);
        product.setName(name);
        product.setQuantity(quantity);
        product.setMadeIn(madeIn);
        serviceProduct.update(id,product);
        request.setAttribute("message","Product information was updated");
        request.setAttribute("list",serviceProduct.findAll());
        RequestDispatcher requestDispatcher=request.getRequestDispatcher("list.jsp");
        requestDispatcher.forward(request,response);


    }
    private void delete(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id=Integer.parseInt(request.getParameter("code"));
        String message1="da tim thay";
        String message2="Khong tim thay";

        if(serviceProduct.delete(id)){
            request.setAttribute("message",message1);
        } else{
            request.setAttribute("message",message2);
        }
        request.setAttribute("list",serviceProduct.findAll());
       RequestDispatcher requestDispatcher=request.getRequestDispatcher("list.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        }
    }

    private void create(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int code=Integer.parseInt(request.getParameter("code"));
        String name=request.getParameter("name");
        int quantity=Integer.parseInt(request.getParameter("quantity"));
        String madeIn=request.getParameter("madeIn");
        Product product=new Product(code,name,quantity,madeIn);
        serviceProduct.save(product);
        response.sendRedirect("/product-servlet");
    }
}
