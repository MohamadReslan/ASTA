package fr.efrei2023.ASTA.model.sessionbean;

import fr.efrei2023.ASTA.model.entity.EvaluationEntity;
import fr.efrei2023.ASTA.model.entity.UserEntity;
import fr.efrei2023.ASTA.utils.EntityManagerFactoryUtil;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Query;

import java.util.List;

public class UserSessionBean {
    EntityManagerFactory entityManagerFactory = EntityManagerFactoryUtil.getEntityManagerFactory();
    EntityManager em = entityManagerFactory.createEntityManager();

    public List<UserEntity> getAllUsers(){
        Query q = em.createQuery("select u from UserEntity u");
        return  q.getResultList();
    }

    public UserEntity getUserById(int userId) {
        Query q = em.createQuery("SELECT u FROM UserEntity u WHERE u.id = :id").setParameter("id", userId);
        return (UserEntity) q.getSingleResult();
    }
}
