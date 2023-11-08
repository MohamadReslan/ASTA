package fr.efrei2023.ASTA.controller;

import fr.efrei2023.ASTA.model.bean.User;
import fr.efrei2023.ASTA.model.entity.UserEntity;
import fr.efrei2023.ASTA.model.sessionbean.UserSessionBean;

import javax.inject.Inject;
import javax.ws.rs.*;
import javax.ws.rs.core.Application;
import javax.ws.rs.core.MediaType;
import java.util.*;

@ApplicationPath("/apprentice")
public class ApprenticeController extends Application {

    private Map<Integer, UserEntity> users = new HashMap<Integer, UserEntity>();

    /*
    @Inject
    private UserSessionBean userSessionBean;*/

    @GET
    @Path("/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public UserEntity GetUserInfoById(@PathParam("id") int id) {
        return users.get(id);
    }
}
