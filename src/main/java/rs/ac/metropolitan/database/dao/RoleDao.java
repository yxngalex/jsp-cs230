package rs.ac.metropolitan.database.dao;

import rs.ac.metropolitan.database.entity.Role;
import rs.ac.metropolitan.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;


public class RoleDao extends AbstractDao<Role> {
    public RoleDao() {
        super(Role.class);
    }

    public Role findByName(final String roleName) {
        final String QUERY = "select r from Role r where r.role = :role";
        Role role = null;
        Transaction transaction;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            role = session.createQuery(QUERY, Role.class)
                    .setParameter("role", roleName)
                    .getSingleResult();
            transaction.commit();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return role;
    }
}
