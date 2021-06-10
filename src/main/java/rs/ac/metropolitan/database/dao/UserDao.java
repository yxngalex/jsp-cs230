package rs.ac.metropolitan.database.dao;

import rs.ac.metropolitan.database.entity.User;
import rs.ac.metropolitan.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;


public class UserDao extends AbstractDao<User> {
    public UserDao() {
        super(User.class);
    }

    public User findByUsername(final String username) {
        final String QUERY = "select u from User u where u.username = :username";
        User user = null;
        Transaction transaction;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            user = session.createQuery(QUERY, User.class)
                    .setParameter("username", username)
                    .getSingleResult();
            transaction.commit();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

}
