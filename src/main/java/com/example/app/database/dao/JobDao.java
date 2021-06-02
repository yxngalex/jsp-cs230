package com.example.app.database.dao;

import com.example.app.database.entity.Job;
import com.example.app.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

import javax.transaction.Transactional;

public class JobDao extends AbstractDao<Job>{
    public JobDao() {
        super(Job.class);
    }

    @Transactional
    public Job findByName(final String jobName) {
        final String QUERY = "select j from Job j where j.name = :job";
        Job job = null;
        Transaction transaction;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            job = session.createQuery(QUERY, Job.class)
                    .setParameter("job", jobName)
                    .getSingleResult();
            transaction.commit();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return job;
    }
}
