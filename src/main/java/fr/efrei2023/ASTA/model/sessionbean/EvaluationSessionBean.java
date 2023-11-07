package fr.efrei2023.ASTA.model.sessionbean;

import fr.efrei2023.ASTA.model.entity.EvaluationEntity;
import fr.efrei2023.ASTA.utils.EntityManagerFactoryUtil;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Query;

import java.util.List;

public class EvaluationSessionBean {
    EntityManagerFactory entityManagerFactory = EntityManagerFactoryUtil.getEntityManagerFactory();
    EntityManager em = entityManagerFactory.createEntityManager();

    public List<EvaluationEntity> getAllEvaluations(){
        Query q = em.createQuery("select e from EvaluationEntity e");
        return  q.getResultList();
    }

    public EvaluationEntity getEvaluationById(int evaluationId) {
        Query q = em.createQuery("SELECT e FROM EvaluationEntity e WHERE e.id = :id").setParameter("id", evaluationId);
        return (EvaluationEntity) q.getSingleResult();
    }
}
