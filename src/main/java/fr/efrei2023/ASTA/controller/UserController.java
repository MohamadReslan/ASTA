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
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@WebServlet("user-controller")
public class UserController extends HttpServlet {
    @EJB
    private UserSessionBean userSessionBean;

    private List<UserEntity> allUsers;
    private UserEntity connectedUser = null;
    private final static String ERROR_MESSAGE = "Infos de connexion non valides. Merci de les saisir à nouveau.\n";

    private final static String ERROR_MESSAGE_NO_USER_SELECT = "Veuillez séléctionnez un Apprenti.\n";

    public void processRequest(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String action = request.getParameter("action");

        switch(action){
            case "Login":
                if(checkUserConnection(request, response) && isAdmin()){ // if good and admin dispatch new page
                    // get info of all users
                    List<UserEntity> allUsers = userSessionBean.getAllRelatedUsersByUser(connectedUser.getId());
                    request.setAttribute("allUsers", allUsers);

                    // get info of connected user
                    request.setAttribute("userConnected", connectedUser);
                    request.setAttribute("errorMessage", "");
                    request.getRequestDispatcher("users.jsp").forward(request, response);
                }
                else if (checkUserConnection(request, response) && !isAdmin()) { // if good but no admin
                    UserEntity userConnected = userSessionBean.getUserById(connectedUser.getId());
                    request.setAttribute("errorMessage", "");
                    request.setAttribute("utilisateur", userConnected);
                    request.getRequestDispatcher("bienvenue.jsp").forward(request,response);
                } else{
                    request.setAttribute("errorMessage", ERROR_MESSAGE);
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                }
                break;
            case "Ajouter":
                request.getRequestDispatcher("userAdd.jsp").forward(request, response);
                break;
            case "Supprimer":
                String selectedUser = request.getParameter("idUser");
                if(selectedUser != null){
                    //userSessionBean.deleteApprentice(Integer.parseInt(selectedUser)); To delete User, change to archive a user
                    request.setAttribute("errorNoUserSelected", "Bien vu bg");
                    allUsers = userSessionBean.getAllRelatedUsersByUser(connectedUser.getId());
                    request.setAttribute("allUsers", allUsers);
                    request.getRequestDispatcher("users.jsp").forward(request, response);
                }
                else{
                    request.setAttribute("errorNoUserSelected", ERROR_MESSAGE_NO_USER_SELECT);
                    request.setAttribute("allUsers", allUsers);
                    request.getRequestDispatcher("users.jsp").forward(request, response);
                }
                break;
            default:
                request.setAttribute("errorMessage", "");
                request.getRequestDispatcher("index.jsp").forward(request, response);

        }// completer par d'autre case pour tout ce qui touche au User (pas forcement dans la page login)
    }

    public boolean isAdmin(){
        return Objects.equals(connectedUser.getType(), "tuteur");
    }
    public boolean checkUserConnection(HttpServletRequest request, HttpServletResponse response){
        String login = request.getParameter("champLogin"); // = lastname
        String mdp = request.getParameter("champMotDePasse");

        connectedUser = userSessionBean.getLoggedUser(login, mdp);
        allUsers = userSessionBean.getAllRelatedUsersByUser(connectedUser.getId());

        return connectedUser != null;
    }

    public void init(){
    }

    public void destroy() {
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    public void doPost (HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        processRequest(request, response);
    }
}
