package fr.efrei2023.ASTA.controller;

import fr.efrei2023.ASTA.model.entity.CompanyEntity;
import fr.efrei2023.ASTA.model.entity.ProgramEntity;
import fr.efrei2023.ASTA.model.entity.UserEntity;
import fr.efrei2023.ASTA.model.sessionbean.CompanySessionBean;
import fr.efrei2023.ASTA.model.sessionbean.ProgramSessionBean;
import fr.efrei2023.ASTA.model.sessionbean.UserSessionBean;
import jakarta.ejb.EJB;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;
import java.util.Objects;

import static fr.efrei2023.ASTA.utils.UsersConstantes.*;

@WebServlet("user-controller")
public class UserController extends HttpServlet {
    @EJB
    private UserSessionBean userSessionBean;
    @EJB
    private CompanySessionBean companySessionBean;
    @EJB
    private ProgramSessionBean programSessionBean;
    private List<UserEntity> allUsers;
    private UserEntity userConnected;

    public UserController() {
    }

    public void processRequest(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String action = request.getParameter(ACTION);

        switch (action) {
            case ACTION_LOGIN:
                updatedUserConnected(request);
                moveToNextPage(request, response);
                break;
            case ACTION_ARCHIVER:
                userSessionBean.updateUserArchive(Integer.parseInt(request.getParameter("userId")));
                request.getSession().setAttribute("allUsers", userSessionBean.getAllRelatedUsersByUser(userConnected.getId()));
                request.getRequestDispatcher(PAGE_ALL_USERS).forward(request, response);
                break;
            case ACTION_APPRENTICE_ARCHIVER:
                request.getSession().setAttribute("userConnected", userConnected);
                request.getSession().setAttribute("allArchivedUsers", userSessionBean.getAllArchivedUsers());
                request.getRequestDispatcher(PAGE_ARCHIVED_USER).forward(request, response);
                break;
            case ACTION_AJOUTER:
                settingInfosOfAllCompaniesAndProgramsAndUserConnected(request);
                request.getRequestDispatcher(PAGE_ADD_USER).forward(request, response);
                break;
            case ACTION_AJOUTER_APPRENTI:
                if (!isAnotherUserUsingSameMail(request))
                    moveToPage(PAGE_ALL_USERS, request, response);
                else{
                    moveToPage(PAGE_ADD_USER, request, response);
                }
                break;
            default:
                request.getRequestDispatcher(PAGE_INDEX).forward(request, response);
        }
    }

    private void settingInfosOfAllCompaniesAndProgramsAndUserConnected(HttpServletRequest request) {
        request.getSession().setAttribute("allCompanies", companySessionBean.getAllCompanies());
        request.getSession().setAttribute("allPrograms", programSessionBean.getAllPrograms());
        request.getSession().setAttribute("userConnected", userConnected);
    }

    private void moveToPage(String page, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        switch (page) {
            case PAGE_ALL_USERS:
                userSessionBean.createNewUser(request, userConnected.getId());
                settingInfosOfAllUsersAndUserConnected(request);
                request.getRequestDispatcher(page).forward(request, response);
                break;
            case PAGE_ADD_USER:
                settingInfosOfAllCompaniesAndProgramsAndUserConnected(request);
                request.getSession().setAttribute("errorMessage", ERROR_MESSAGE_USER_DUPLICATED);
                request.getRequestDispatcher(page).forward(request, response);
                break;
            default:

        }
    }

    private void moveToNextPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (checkUserConnection()) {
            if (isAdmin()) {
                settingInfosOfAllUsersAndUserConnected(request);
                request.getRequestDispatcher(PAGE_ALL_USERS).forward(request, response);
            } else {
                request.getSession().setAttribute("utilisateur", userSessionBean.getUserById(userConnected.getId()));
                request.getRequestDispatcher("bienvenue.jsp").forward(request, response);
            }
        } else {
            request.getSession().setAttribute("errorMessage", ERROR_MESSAGE_CREDENTIALS_KO);
            request.getRequestDispatcher(PAGE_INDEX).forward(request, response);
        }
    }

    private void settingInfosOfAllUsersAndUserConnected(HttpServletRequest request) {
        request.getSession().setAttribute("userConnected", userConnected);
        request.getSession().setAttribute("allUsers", userSessionBean.getAllRelatedUsersByUser(userConnected.getId()));
    }

    private boolean isAnotherUserUsingSameMail(HttpServletRequest request) {
        for (UserEntity user : userSessionBean.getAllUsers()) {
            if (user.getMail().equalsIgnoreCase(request.getParameter(FIELD_MAIL)))
                return true;
        }
        return false;
    }

    private void updatedUserConnected(HttpServletRequest request) {
        userConnected = new UserEntity();
        userConnected.setMail(request.getParameter(FIELD_LOGIN));
        userConnected.setMdp(request.getParameter(FIELD_PWD));
        request.getSession().setAttribute("userConnected", userConnected);
    }

    private boolean isAdmin() {
        return userConnected.getType().equalsIgnoreCase(TYPE_ADMIN);
    }

    private boolean checkUserConnection() {
        userConnected = userSessionBean.getLoggedUser(userConnected.getMail(), userConnected.getMdp());
        return userConnected != null;
    }

    public void init() {
    }

    public void destroy() {
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.getRequestDispatcher(PAGE_INDEX).forward(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        processRequest(request, response);
    }
}
