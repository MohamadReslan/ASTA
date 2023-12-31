package fr.efrei2023.ASTA.controller;

import fr.efrei2023.ASTA.model.Model.UserInfoModel;
import fr.efrei2023.ASTA.model.entity.UserEntity;
import fr.efrei2023.ASTA.model.sessionbean.CompanySessionBean;
import fr.efrei2023.ASTA.model.sessionbean.ProgramSessionBean;
import fr.efrei2023.ASTA.model.sessionbean.UserSessionBean;
import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

import static fr.efrei2023.ASTA.utils.UsersConstants.*;

@WebServlet("user-controller")
public class UserController extends HttpServlet {
    @EJB
    private UserSessionBean userSessionBean;
    @EJB
    private CompanySessionBean companySessionBean;
    @EJB
    private ProgramSessionBean programSessionBean;
    private UserEntity userConnected;
    private UserEntity apprentice;

    public UserController() {
    }

    public void processRequest(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String action = request.getParameter(ACTION);

        switch (action) {
            case ACTION_LOGIN:
                updatedUserConnected(request);
                moveToNextPage(request, response);
                break;
            case ACTION_ARCHIVE:
                userSessionBean.updateUserArchive(Integer.parseInt(request.getParameter(FIELD_USER_ID)),true);
                request.getSession().setAttribute("allUsers", userSessionBean.getAllRelatedUsersByUser(userConnected.getId()));
                request.getRequestDispatcher(PAGE_ALL_USERS).forward(request, response);
                break;
            case ACTION_DETAIL:
                request.getSession().setAttribute("apprenticeSelected", request.getParameter(FIELD_USER_ID));
                request.getRequestDispatcher("html/details.html").forward(request, response);
                break;
            case ACTION_APPRENTICE_ARCHIVE:
                request.getSession().setAttribute("userConnected", userConnected);
                request.getSession().setAttribute("allArchivedUsers", userSessionBean.getAllArchivedUsers());
                request.getRequestDispatcher(PAGE_ARCHIVED_USER).forward(request, response);
                break;
            case ACTION_HOME:
                settingInfosOfAllUsersAndUserConnected(request);
                request.getRequestDispatcher(PAGE_ALL_USERS).forward(request, response);
                break;
            case ACTION_ADD:
                settingInfosOfAllCompaniesAndPrograms(request);
                request.getSession().setAttribute("errorMessage", "");
                request.getRequestDispatcher(PAGE_ADD_USER).forward(request, response);
                break;
            case ACTION_ADD_APPRENTICE:
                if (!isAnotherUserUsingSameMail(request))
                    moveToPage(PAGE_ALL_USERS, request, response);
                else{
                    moveToPage(PAGE_ADD_USER, request, response);
                }
                break;

            case ACTION_MODIFICATION:
                UserEntity userEntity = getNewUserWithRequest(request);
                userEntity.setRelatedUserId((int) userConnected.getId());
                userSessionBean.modifierUSer(userEntity);
                request.setAttribute("allUsers", userSessionBean.getAllRelatedUsersByUser(userConnected.getId()));
                request.getRequestDispatcher(PAGE_ALL_USERS).forward(request, response);
                break;

            case ACTION_GO_TO_PAGE_MODIFY:

                apprentice = userSessionBean.getUserById(Integer.parseInt(request.getParameter(FIELD_USER_ID)));
                request.setAttribute("apprentice", apprentice);
                settingInfosOfAllCompaniesAndPrograms(request);
                request.getRequestDispatcher(PAGE_MODIFICATION_USER).forward(request, response);
                break;

            case ACTION_UNARCHIVE:
                userSessionBean.updateUserArchive(Integer.parseInt(request.getParameter(FIELD_USER_ID)),false);
                request.getSession().setAttribute("allUsers", userSessionBean.getAllRelatedUsersByUser(userConnected.getId()));
                request.getRequestDispatcher(PAGE_ALL_USERS).forward(request, response);
                break;

            default:
                request.getSession().setAttribute("errorMessage", "");
                request.getRequestDispatcher(PAGE_INDEX).forward(request, response);
        }
    }

    private void settingInfosOfAllCompaniesAndPrograms(HttpServletRequest request) {
        request.getSession().setAttribute("allCompanies", companySessionBean.getAllCompanies());
        request.getSession().setAttribute("allPrograms", programSessionBean.getAllPrograms());
    }

    private void moveToPage(String page, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        switch (page) {
            case PAGE_ALL_USERS:
                UserEntity userEntity = getNewUserWithRequest(request);
                userSessionBean.createNewUser(userEntity, userConnected.getId());
                settingInfosOfAllUsersAndUserConnected(request);
                request.getRequestDispatcher(page).forward(request, response);
                break;
            case PAGE_ADD_USER:
                settingInfosOfAllCompaniesAndPrograms(request);
                request.getSession().setAttribute("errorMessage", ERROR_MESSAGE_USER_DUPLICATED);
                request.getRequestDispatcher(page).forward(request, response);
                break;
            default:

        }
    }

    private UserEntity getNewUserWithRequest(HttpServletRequest request) {
        UserEntity userEntity = new UserEntity();
        userEntity.setType(TYPE_APPRENTICE);
        userEntity.setArchive(false);
        userEntity.setActive(true);
        userEntity.setLastName(request.getParameter(FIELD_LASTNAME));
        userEntity.setFirstName(request.getParameter(FIELD_FIRSTNAME));
        userEntity.setPhone(request.getParameter(FIELD_PHONE));
        userEntity.setManagerName(request.getParameter(FIELD_MANAGER_NAME));
        userEntity.setMail(request.getParameter(FIELD_EMAIL));
        userEntity.setProgramId(Integer.valueOf(request.getParameter(FIELD_PROGRAM)));
        userEntity.setCompanyId(Integer.valueOf(request.getParameter(FIELD_COMPANY)));
        String pwd = request.getParameter(FIELD_PWD);
        String userId = request.getParameter(FIELD_USER_ID);
        if (pwd != null)
            userEntity.setMdp(pwd);
        if (userId != null)
            userEntity.setId(Short.parseShort(userId));
        return userEntity;
    }

    private void moveToNextPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (checkUserConnection()) {
            if (isAdmin()) {
                settingInfosOfAllUsersAndUserConnected(request);
                request.getRequestDispatcher(PAGE_ALL_USERS).forward(request, response);
            } else {
                request.getSession().setAttribute("userInfo", userSessionBean.getUserInfo(userConnected.getId()));
                request.getRequestDispatcher(PAGE_USER_INFO).forward(request, response);
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
            if (user.getMail().equalsIgnoreCase(request.getParameter(FIELD_EMAIL)))
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
