package fr.efrei2023.ASTA.model.sessionbean;

import fr.efrei2023.ASTA.model.entity.CompanyEntity;
import fr.efrei2023.ASTA.utils.EntityManagerFactoryUtil;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Query;

import java.util.List;

public class CompanySessionBean {
    EntityManagerFactory entityManagerFactory = EntityManagerFactoryUtil.getEntityManagerFactory();
    EntityManager em = entityManagerFactory.createEntityManager();

    public List<CompanyEntity> getAllCompanies(){
        Query q = em.createQuery("select c from CompanyEntity c");
        return  q.getResultList();
    }

    public CompanyEntity getCompanyById(int companyId) {
        Query q = em.createQuery("SELECT c FROM CompanyEntity c WHERE c.id = :id").setParameter("id", companyId);
        return (CompanyEntity) q.getSingleResult();
    }
}
