package com.example.app.database.dao;

import com.example.app.database.entity.Role;
import com.example.app.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;


public class RoleDao extends AbstractDao<Role> {
    public RoleDao() {
        super(Role.class);
    }

//    public Role findByName(final String roleName) {
//        final String QUERY = "select r from Role r where r.role = :role";
//        Role role = null;
//        Transaction transaction;
//        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
//            transaction = session.beginTransaction();
//            role = session.createQuery(QUERY, Role.class)
//                    .setParameter("role", roleName)
//                    .getSingleResult();
//            transaction.commit();
//            session.close();
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return role;
//    }
public Role findByName(final String roleName) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Role role = null;

        try {
            role = (Role) session.createCriteria(Role.class)
                    .add(Restrictions.eq("role", roleName))
                    .uniqueResult();
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return role;
    }

}
