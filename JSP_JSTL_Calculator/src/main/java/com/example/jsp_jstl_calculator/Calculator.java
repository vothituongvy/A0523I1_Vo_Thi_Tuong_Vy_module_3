package com.example.jsp_jstl_calculator;

public class Calculator {
    public static float calculator(float number1, float number2, char number) {
        switch (number) {
            case '+':
                return number1 + number2;
            case '-':
                return number1 - number2;
            case '*':
                return number1 * number2;
            case '/':
                if (number2 != 0) {
                    return number1 / number2;
                } else {
                    throw new RuntimeException("Không thể chia với 0");
                }
            default:
                throw new RuntimeException("Không hơp lệ");
        }
    }
}
