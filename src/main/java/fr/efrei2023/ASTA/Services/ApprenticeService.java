package fr.efrei2023.ASTA.Services;

import fr.efrei2023.ASTA.controller.ApprenticeController;

import javax.ws.rs.ApplicationPath;
import javax.ws.rs.core.Application;
import java.util.*;

@ApplicationPath("/api")
public class ApprenticeService  extends Application {
    private Set<Object> singletons = new HashSet<Object>();

    public ApprenticeService() {
        singletons.add(new ApprenticeController());
    }

    @Override
    public Set<Object> getSingletons() {
        return singletons;
    }
}
