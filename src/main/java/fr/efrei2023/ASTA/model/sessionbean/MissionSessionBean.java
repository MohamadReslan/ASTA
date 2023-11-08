package fr.efrei2023.ASTA.model.sessionbean;

import fr.efrei2023.ASTA.model.entity.MissionEntity;
import fr.efrei2023.ASTA.utils.EntityManagerFactoryUtil;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Query;

import javax.ejb.EJB;
import java.util.List;

public class MissionSessionBean {
    EntityManagerFactory entityManagerFactory = EntityManagerFactoryUtil.getEntityManagerFactory();
    EntityManager em = entityManagerFactory.createEntityManager();

    public List<MissionEntity> getAllMissions(){
        Query q = em.createQuery("select m from MissionEntity m");
        return  q.getResultList();
    }

    public MissionEntity getMissionById(int missionId) {
        Query q = em.createQuery("SELECT m FROM MissionEntity m WHERE m.id = :id").setParameter("id", missionId);
        return (MissionEntity) q.getSingleResult();
    }
}
