package fr.efrei2023.ASTA.model.sessionbean;

import fr.efrei2023.ASTA.model.entity.UserEntity;
import fr.efrei2023.ASTA.utils.EntityManagerFactoryUtil;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.NoResultException;
import jakarta.persistence.Query;

import java.util.List;

@Stateless
public class UserSessionBean {
    EntityManagerFactory entityManagerFactory = EntityManagerFactoryUtil.getEntityManagerFactory();
    EntityManager em = entityManagerFactory.createEntityManager();

    public List<UserEntity> getAllUsers(){
        Query q = em.createQuery("select u from UserEntity u");
        return  q.getResultList();
    }

    public UserEntity getLoggedUser(String lastName, String mdp){
        try{
            Query q = em.createQuery("SELECT u FROM UserEntity u WHERE u.mdp = :mdp AND u.lastName = :lastName").setParameter("mdp", mdp).setParameter("lastName", lastName);
            return (UserEntity) q.getSingleResult();
        }catch (NoResultException e){
            return null;
        }
    }

    public List<UserEntity> getAllRelatedUsersByUser(int userId) {
        Query q = em.createQuery("SELECT u FROM UserEntity u WHERE u.relatedUserId = :id").setParameter("id", userId);
        return  q.getResultList();
    }

    public List<UserEntity> getAllUser() {
        Query q = em.createQuery("SELECT u FROM UserEntity u WHERE u.lastName != 'Admin'");
        return  q.getResultList();
    }

    public UserEntity getUserById(int userId) {
        Query q = em.createQuery("SELECT u FROM UserEntity u WHERE u.id = :id").setParameter("id", userId);
        return (UserEntity) q.getSingleResult();
    }

    public void updateUserArchive(int userId) {
        em.getTransaction().begin();
        UserEntity user = em.find(UserEntity.class, (short) userId);
        if (user != null) {
            user.setArchive(true);
        }
        em.getTransaction().commit();
    }

    public List<UserEntity> getAllArchivedUsers() {
        Query q = em.createQuery("SELECT u FROM UserEntity u WHERE u.isArchive = true");
        return  q.getResultList();
    }
}
