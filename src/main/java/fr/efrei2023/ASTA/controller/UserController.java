package fr.efrei2023.ASTA.controller;

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
import java.util.Objects;

@WebServlet("user-controller")
public class UserController extends HttpServlet {
    @EJB
    private UserSessionBean userSessionBean;

    private List<UserEntity> allUsers;
    private UserEntity connectedUser = null;
    private UserEntity userConnected = null;
    private final static String ERROR_MESSAGE = "Infos de connexion non valides. Merci de les saisir à nouveau.\n";

    private final static String ERROR_MESSAGE_NO_USER_SELECT = "Veuillez séléctionnez un Apprenti.\n";

    public void processRequest(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String action = request.getParameter("action");

        switch(action){
            case "Login":
                if(checkUserConnection(request, response) && isAdmin()){ // if good and admin dispatch new page
                    // get info of all users
                    allUsers = userSessionBean.getAllUser();
                    request.setAttribute("allUsers", allUsers);

                    // get info of connected user
                    request.setAttribute("userConnected", userConnected);
                    request.setAttribute("errorMessage", "");
                    request.getRequestDispatcher("users.jsp").forward(request, response);
                }
                else if (checkUserConnection(request, response) && !isAdmin()) { // if good but no admin
                    userConnected = userSessionBean.getUserById(userConnected.getId());
                    request.setAttribute("errorMessage", "");
                    request.setAttribute("utilisateur", userConnected);
                    request.getRequestDispatcher("bienvenue.jsp").forward(request,response);
                } else{
                    request.setAttribute("errorMessage", ERROR_MESSAGE);
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                }
                break;
            case "Archiver":
                int userId = Integer.parseInt(request.getParameter("userId"));
                userSessionBean.updateUserArchive(userId);
                request.setAttribute("userConnected", connectedUser);
                request.setAttribute("allUsers", userSessionBean.getAllUsers());
                request.getRequestDispatcher("users.jsp").forward(request, response);
                break;
            case "Users Archiver":
                request.setAttribute("userConnected", connectedUser);
                request.setAttribute("allArchivedUsers", userSessionBean.getAllArchivedUsers());
                request.getRequestDispatcher("archivedUser.jsp").forward(request, response);
                break;
            case "Ajouter":
                request.getRequestDispatcher("userAdd.jsp").forward(request, response);
                break;
            case "Supprimer":
                String selectedUser = request.getParameter("idUser");
                if(selectedUser != null){
                    //userSessionBean.deleteApprentice(Integer.parseInt(selectedUser)); To delete User, need to change to archive a user
                    request.setAttribute("errorNoUserSelected", "");
                    allUsers = userSessionBean.getAllRelatedUsersByUser(userConnected.getId());
                    request.setAttribute("userConnected", userConnected);
                    request.setAttribute("allUsers", allUsers);
                    request.getRequestDispatcher("users.jsp").forward(request, response);
                }
                else{
                    request.setAttribute("errorNoUserSelected", ERROR_MESSAGE_NO_USER_SELECT);
                    request.setAttribute("allUsers", allUsers);
                    request.setAttribute("userConnected", userConnected);
                    request.getRequestDispatcher("users.jsp").forward(request, response);
                }
                break;
            default:
                request.setAttribute("errorMessage", "");
                request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }

    public boolean isAdmin(){
        return Objects.equals(connectedUser.getType(), "tuteur") &&
                Objects.equals(connectedUser.getLastName(), "Admin");
    }
    public boolean checkUserConnection(HttpServletRequest request, HttpServletResponse response){
        String login = request.getParameter("champLogin"); // = lastname
        String mdp = request.getParameter("champMotDePasse");

        userConnected = userSessionBean.getLoggedUser(login, mdp);
        if(userConnected != null){
            allUsers = userSessionBean.getAllRelatedUsersByUser(userConnected.getId());
        }

        return userConnected != null;
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
