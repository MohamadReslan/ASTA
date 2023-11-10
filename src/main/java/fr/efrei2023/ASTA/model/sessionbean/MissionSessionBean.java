package fr.efrei2023.ASTA.model.sessionbean;

import fr.efrei2023.ASTA.model.entity.MissionEntity;
import fr.efrei2023.ASTA.utils.EntityManagerFactoryUtil;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.NoResultException;
import jakarta.persistence.Query;

import java.util.List;

@Stateless
public class MissionSessionBean {
    EntityManagerFactory entityManagerFactory = EntityManagerFactoryUtil.getEntityManagerFactory();
    EntityManager em = entityManagerFactory.createEntityManager();

    public MissionEntity getMissionByUserId(int userId) {
        try{
            Query q = em.createQuery("SELECT m FROM MissionEntity m WHERE m.userId = :userId").setParameter("userId", userId);
            return (MissionEntity) q.getSingleResult();
        } catch(NoResultException e) {
            return null;
        }
    }
}
