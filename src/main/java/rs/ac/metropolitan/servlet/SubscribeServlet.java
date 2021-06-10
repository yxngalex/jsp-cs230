package rs.ac.metropolitan.servlet;

import rs.ac.metropolitan.database.dao.JobDao;
import rs.ac.metropolitan.database.dao.UserDao;
import rs.ac.metropolitan.database.entity.Job;
import rs.ac.metropolitan.database.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(urlPatterns = "/subscribe")
public class SubscribeServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Integer userId = (Integer) session.getAttribute("id");
        String jobIdstr =  req.getParameter("id-job");
        Integer jobId = Integer.parseInt(jobIdstr);
        User user = new UserDao().find(userId);

        JobDao jobDao = new JobDao();

        Job job = jobDao.find(jobId);

        job.getUsers().add(user);
        jobDao.update(job);

        req.getRequestDispatcher("/jobs.jsp").forward(req, resp);
    }
}
