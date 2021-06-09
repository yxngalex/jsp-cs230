package rs.ac.metropolitan.servlet;
import rs.ac.metropolitan.config.Config;
import rs.ac.metropolitan.database.entity.User;
import rs.ac.metropolitan.database.dao.UserDao;
import rs.ac.metropolitan.security.Security;
import com.google.common.collect.Iterables;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

@WebServlet(urlPatterns = "/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        List<String> errors = new ArrayList<>();

        User user = new UserDao().findByUsername(username);

        if (user == null) {
            errors.add("User doesn't exists");
        } else if (!user.getPassword().equals(Security.hash(password))) {
            errors.add("Invalid password");
        }

        if (errors.size() != 0) {
            System.out.println("greska");
            request.setAttribute("errors", Iterables.toArray(errors, String.class));
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            assert user != null;
            Properties props = Config.getProperties();
            int validity = Integer.parseInt(props.getProperty("session-validity"));
            HttpSession session = request.getSession(true);
            session.setAttribute("username", user.getUsername());
            session.setAttribute("id", user.getIdUser());
            session.setAttribute("roles", user.getRole());
            session.setMaxInactiveInterval(validity);
            response.sendRedirect(request.getContextPath() + "/index.jsp");
            System.out.println("redirect");
        }
    }
}
