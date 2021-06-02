package com.example.app.database.dao;

import com.example.app.database.entity.Firm;
import com.example.app.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

import javax.transaction.Transactional;

public class FirmDao extends AbstractDao<Firm>{
    public FirmDao() {
        super(Firm.class);
    }

    @Transactional
    public Firm findByName(final String firmName) {
        final String QUERY = "select f from Firm f where f.name = :firm";
        Firm firm = null;
        Transaction transaction;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            firm = session.createQuery(QUERY, Firm.class)
                    .setParameter("firm", firmName)
                    .getSingleResult();
            transaction.commit();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return firm;
    }
}
