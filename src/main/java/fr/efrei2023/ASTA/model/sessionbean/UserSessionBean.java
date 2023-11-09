package fr.efrei2023.ASTA.model.sessionbean;

import fr.efrei2023.ASTA.model.Model.UserInfoModel;
import fr.efrei2023.ASTA.model.entity.CompanyEntity;
import fr.efrei2023.ASTA.model.entity.ProgramEntity;
import fr.efrei2023.ASTA.model.entity.UserEntity;
import fr.efrei2023.ASTA.utils.EntityManagerFactoryUtil;
import jakarta.ejb.EJB;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.NoResultException;
import jakarta.persistence.Query;
import jakarta.servlet.http.HttpServletRequest;

import java.util.List;

import static fr.efrei2023.ASTA.utils.UsersConstants.FIELD_MAIL;

@Stateless
public class UserSessionBean {
    EntityManagerFactory entityManagerFactory = EntityManagerFactoryUtil.getEntityManagerFactory();
    EntityManager em = entityManagerFactory.createEntityManager();

    @EJB
    private CompanySessionBean companySessionBean;

    @EJB
    private ProgramSessionBean programSessionBean;

    public List<UserEntity> getAllUsers() {
        return em.createQuery("SELECT u from UserEntity u").getResultList();
    }

    public UserEntity getLoggedUser(String mail, String mdp) {
        try {
            Query q = em.createQuery("SELECT u FROM UserEntity u WHERE u.mdp = :mdp AND u.mail = :mail").setParameter("mdp", mdp).setParameter("mail", mail);
            return (UserEntity) q.getSingleResult();
        } catch (NoResultException e) {
            return null;
        }
    }

    public List<UserEntity> getAllRelatedUsersByUser(int userId) {
        Query q = em.createQuery("SELECT u FROM UserEntity u WHERE u.relatedUserId = :id").setParameter("id", userId);
        return q.getResultList();
    }

    public UserEntity getUserById(int userId) {
        Query q = em.createQuery("SELECT u FROM UserEntity u WHERE u.id = :id").setParameter("id", userId);
        return (UserEntity) q.getSingleResult();
    }

    public UserInfoModel getUserInfo(int userId) {
        UserEntity user = getUserById(userId);
        CompanyEntity company = companySessionBean.getCompanyById(user.getCompanyId());
        ProgramEntity program = programSessionBean.getProgramById(user.getProgramId());
        return new UserInfoModel(user.getId(), user.getLastName(), user.getFirstName(), user.getPhone(), user.getMail(), company.getName(), program.getLabel());
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
        return q.getResultList();
    }

    public void createNewUser(HttpServletRequest request, int connectedId) {
        String lastname = request.getParameter("lastname");
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String email = request.getParameter(FIELD_MAIL);
        String programId = request.getParameter("selectPrograms");
        String companyId = request.getParameter("selectCompanies");
        em.getTransaction().begin();
        Query q = em.createNativeQuery("INSERT INTO user(last_name, first_name,mdp,phone,mail,type,is_active,company_id,program_id,related_user_id,is_archive) " +
                "VALUES(?1, ?2, 123, ?4, ?5, 'apprenti', 1, ?8, ?9, ?10, 0)");
        q.setParameter(1, lastname);
        q.setParameter(2, name);
        q.setParameter(4, phone);
        q.setParameter(5, email);
        q.setParameter(8, companyId);
        q.setParameter(9, programId);
        q.setParameter(10, connectedId);
        q.executeUpdate();
        em.getTransaction().commit();
    }
}
