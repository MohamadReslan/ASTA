package fr.efrei2023.ASTA.model.sessionbean;

import fr.efrei2023.ASTA.model.entity.EmployesEntity;
import fr.efrei2023.ASTA.utils.EntityManagerFactoryUtil;
import jakarta.ejb.Stateless;
import jakarta.persistence.*;
import jakarta.servlet.http.HttpServletRequest;

import java.util.List;

@Stateless
public class EmployesSessionBean {

    EntityManagerFactory entityManagerFactory = EntityManagerFactoryUtil.getEntityManagerFactory();
    EntityManager em = entityManagerFactory.createEntityManager();

    public List<EmployesEntity> getTousLesEmployes(){
        Query q = em.createQuery("select e from EmployesEntity e");
        return  q.getResultList();
    }

    public void deleteEmployeById(int employeId){
        EntityTransaction transaction = em.getTransaction();
        transaction.begin();

        EmployesEntity e = getEmployeBy(employeId);
        em.remove(e);

        transaction.commit();
    }

    public EmployesEntity getEmployeBy(int employeId) {
        Query q = em.createQuery("SELECT e FROM EmployesEntity e WHERE e.id = :id").setParameter("id", employeId);
        return (EmployesEntity) q.getSingleResult();
    }

    public void updateEmployeInfoBy(int employeId, HttpServletRequest request) {
        EntityTransaction transaction = em.getTransaction();
        transaction.begin();

        EmployesEntity newEmploye = getEmployeBy(employeId);
        settingNewDataOfEmploye(request, newEmploye);

        transaction.commit();
    }

    private static void settingNewDataOfEmploye(HttpServletRequest request, EmployesEntity newEmploye) {
        newEmploye.setNom(request.getParameter("newNom"));
        newEmploye.setAdresse(request.getParameter("newAdresse"));
        newEmploye.setTeldom(request.getParameter("newTelDom"));
        newEmploye.setPrenom(request.getParameter("newPrenom"));
        newEmploye.setTelport(request.getParameter("newTelPort"));
        newEmploye.setTelpro(request.getParameter("newTelPro"));
        newEmploye.setCodepostal(request.getParameter("newCodePostal"));
        newEmploye.setVille(request.getParameter("newVille"));
        newEmploye.setEmail(request.getParameter("newEmail"));
    }
}
