package fr.efrei2023.progav_lsi2_tp2.model;

import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.Query;

import java.util.List;

@Stateless
public class EmployesSessionBean {

    EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("TP2_PU");
    EntityManager em = entityManagerFactory.createEntityManager();

    public List<EmployesEntity> getTousLesEmployes(){
        Query q = em.createQuery("select e from EmployesEntity e");
        return  q.getResultList();
    }

}
