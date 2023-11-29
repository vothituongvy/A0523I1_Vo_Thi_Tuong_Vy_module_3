package com.example.jsp_jstl_calculator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "CalculatorServlet", urlPatterns = "/calculator-servlet")
public class CalculatorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        float number1 = Integer.parseInt(request.getParameter("number1"));
        float number2 = Integer.parseInt(request.getParameter("number2"));
        char number = request.getParameter("number").charAt(0);
        PrintWriter writer = response.getWriter();
        writer.println("<html>");
        writer.println("<h3>Result:</h3>");
        try{
            float result = Calculator.calculator(number1,number2,number);
            writer.println(number1 + " " + number + " " + number2 + " = " + result);
        }catch (Exception ex){
            writer.println("Lỗi !");
        }
        writer.println("</html>");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}