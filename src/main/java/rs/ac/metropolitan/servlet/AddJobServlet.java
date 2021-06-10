package rs.ac.metropolitan.servlet;

import rs.ac.metropolitan.database.dao.FirmDao;
import rs.ac.metropolitan.database.dao.JobDao;
import rs.ac.metropolitan.database.entity.Firm;
import rs.ac.metropolitan.database.entity.Job;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/add-job")
public class AddJobServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String description = req.getParameter("description");
        String firmName = req.getParameter("firm");

        Firm firm = new FirmDao().findByName(firmName);

        if (firm == null) {
            System.out.println("Firm doesn't exist");
        }

        Job job = new Job();

        job.setName(name);
        job.setDescription(description);
        job.setFirmId(firm);

        JobDao jobDao = new JobDao();

        jobDao.create(job);

        req.getRequestDispatcher("index.jsp").forward(req, resp);
    }
}
