package fr.efrei2023.ASTA.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/apprentices")
public class ApprenticeController extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String  user = "USER";
        String userJson = new ObjectMapper().writeValueAsString(user);
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        out.print(userJson);
        out.flush();
        response.setStatus(HttpServletResponse.SC_OK);
    }
}
