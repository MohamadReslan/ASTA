package fr.efrei2023.ASTA.controller;

import fr.efrei2023.ASTA.model.bean.User;
import fr.efrei2023.ASTA.model.entity.UserEntity;
import fr.efrei2023.ASTA.model.sessionbean.UserSessionBean;

import javax.inject.Inject;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

@Path("/apprentice")
public class ApprenticeController {

    @Inject
    private UserSessionBean userSessionBean;

    @GET
    @Path("/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public UserEntity GetUserInfoById(@PathParam("id") int id) {
        return userSessionBean.getUserById(id);
    }
}
