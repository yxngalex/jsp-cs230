package rs.ac.metropolitan.servlet;

import rs.ac.metropolitan.database.dao.UserJobDao;
import rs.ac.metropolitan.database.entity.Job;
import rs.ac.metropolitan.database.entity.User;
import rs.ac.metropolitan.database.entity.UserJob;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/subscribe")
public class SubscribeServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = new User();
        Job job = new Job();
        UserJob userJob = new UserJob();


        UserJobDao userJobDao = new UserJobDao();

        userJobDao.create(userJob);
    }
}
