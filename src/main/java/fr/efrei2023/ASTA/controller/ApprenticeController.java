package fr.efrei2023.ASTA.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import fr.efrei2023.ASTA.model.Model.UserInfoModel;
import fr.efrei2023.ASTA.model.sessionbean.UserSessionBean;
import jakarta.ejb.EJB;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/apprentices")
public class ApprenticeController extends HttpServlet {
    @EJB
    private UserSessionBean userSessionBean;
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String apprenticeId = (String) request.getSession().getAttribute("apprenticeSelected");
        UserInfoModel apprenticeSelected = userSessionBean.getUserInfo(Integer.parseInt(apprenticeId));
        String userJson = new ObjectMapper().writeValueAsString(apprenticeSelected);
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        out.print(userJson);
        out.flush();
        response.setStatus(HttpServletResponse.SC_OK);
    }
}
