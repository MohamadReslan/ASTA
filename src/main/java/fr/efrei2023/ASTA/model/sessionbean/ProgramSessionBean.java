package fr.efrei2023.ASTA.model.sessionbean;

import fr.efrei2023.ASTA.model.entity.ProgramEntity;
import fr.efrei2023.ASTA.utils.EntityManagerFactoryUtil;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Query;

import java.util.List;

public class ProgramSessionBean {
    EntityManagerFactory entityManagerFactory = EntityManagerFactoryUtil.getEntityManagerFactory();
    EntityManager em = entityManagerFactory.createEntityManager();

    public List<ProgramEntity> getAllPrograms(){
        Query q = em.createQuery("select p from ProgramEntity p");
        return  q.getResultList();
    }

    public ProgramEntity getProgramById(int programId) {
        Query q = em.createQuery("SELECT p FROM ProgramEntity p WHERE p.id = :id").setParameter("id", programId);
        return (ProgramEntity) q.getSingleResult();
    }
}
