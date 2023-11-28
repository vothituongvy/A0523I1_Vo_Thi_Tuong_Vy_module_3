package com.example.demo;

import java.io.*;
import java.util.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;


@WebServlet(name = "CustomerServlet", value = "/customer-servlet")
public class CustomerServlet extends HttpServlet {
    private static List<Customer> list;
    static {
        list = new ArrayList<>();
        list.add(new Customer(1,"Võ Thị Tường Vy","2004-12-10","Hà Nội"));
        list.add(new Customer(2,"Phan Nguyễn Anh Thư","2004-02-01","Quảng Nam"));
        list.add(new Customer(1,"Nguyễn Thái Hòa","2005-08-22","Nam Định"));
        list.add(new Customer(1,"Trần Đăng ","2006-08-17","Hà Tây"));
        list.add(new Customer(1,"Nguyễn Đình Thi","1983-08-19","Hà Nội"));
    }

    public void init() {
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.setAttribute("list",list);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("list.jsp");
        requestDispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    public void destroy() {
    }
}
