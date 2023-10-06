package fr.efrei2023.ASTA.utils;

import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class EntityManagerFactoryUtil {

    private static final String PERSISTENCE_UNIT_NAME = "TP2_PU"; // Nom de l'unité de persistance

    private static EntityManagerFactory entityManagerFactory;

    private EntityManagerFactoryUtil() {}

    public static EntityManagerFactory getEntityManagerFactory() {
        if (entityManagerFactory == null) {
            entityManagerFactory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT_NAME);
        }
        return entityManagerFactory;
    }

}
