package fr.efrei2023.ASTA.controller;

import fr.efrei2023.ASTA.model.bean.User;
import fr.efrei2023.ASTA.model.entity.UserEntity;
import fr.efrei2023.ASTA.model.sessionbean.UserSessionBean;
import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "UserController", value = "/user-controller")
public class UserController extends HttpServlet {
    @EJB
    private UserSessionBean userSessionBean;
    private final static String ERROR_MESSAGE = "Infos de connexion non valides. Merci de les saisir à nouveau.\n";

    public void processRequest(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String action = request.getParameter("action");

        switch(action){
            case "Login":
                if(checkUserConnection()){ // if good dispatch new page
                    // get info of all users
                    List<UserEntity> allUsers = userSessionBean.getAllUsers();
                    request.setAttribute("allUsers", allUsers);

                    // get info of connected user
                    UserEntity userConnected = userSessionBean.getUserById(1);
                    request.setAttribute("userConnected", userConnected);
                    request.getRequestDispatcher("users.jsp").forward(request, response);
                }//rajouter une condtion pour differencier etudiant et admin
                else{
                    request.setAttribute("errorMessage", ERROR_MESSAGE);
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                }
                break;
        }// completer par d'autre case pour tout ce qui touche au User (pas forcement dans la page login)
    }

    public boolean checkUserConnection(){ // ouais bastos c'est ton job
        return true;
    }

    public void init(){
    }

    public void destroy() {
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        processRequest(request, response);
    }

    public void doPost (HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        processRequest(request, response);
    }
}
