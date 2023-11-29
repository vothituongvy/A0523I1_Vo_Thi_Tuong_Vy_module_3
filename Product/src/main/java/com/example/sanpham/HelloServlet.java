package com.example.sanpham;

import com.example.sanpham.service.IService;
import com.example.sanpham.service.ServiceProduct;

import java.io.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "helloServlet", value = "/hello-servlet")
public class HelloServlet extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }
    private IService iService= new ServiceProduct();



    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html");
//        request.setAttribute("list",iService.findAll());
//        RequestDispatcher requestDispatcher=request.getRequestDispatcher("list.jsp");
//        requestDispatcher.forward(request,response);

        // Hello
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("<h1>" + message + "</h1>");
        out.println("</body></html>");
    }

    public void destroy() {
    }
}