package com.example.app.servlet;

import com.example.app.database.dao.RoleDao;
import com.example.app.database.dao.UserDao;
import com.example.app.database.entity.Role;
import com.example.app.database.entity.User;
import com.example.app.security.Security;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(urlPatterns = "/register")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserDao userDao = new UserDao();
        RoleDao roleDao = new RoleDao();

        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String email = req.getParameter("email");
        String roleName = req.getParameter("role");

        HttpSession session = req.getSession();
        session.setAttribute("username", username);
        session.setAttribute("password", password);
        session.setAttribute("email", email);
        session.setAttribute("role", roleName);

        User user = new User();
        Role role = roleDao.findByName(roleName);

        List<String> errors = new ArrayList<>();

        if (username == null || username.isEmpty()) {
            errors.add("Invalid username");
        }
        if (password == null || password.isEmpty()) {
            errors.add("Invalid password");
        }
        if (email == null || email.isEmpty()) {
            errors.add("Invalid email");
        }
        if (role == null) {
            errors.add("Invalid role");
        }

        if (!errors.isEmpty()) {
            req.getSession().setAttribute("errors", errors.toArray(new String[]{}));
            req.getRequestDispatcher("/register.jsp").forward(req, resp);
        }

        user.setUsername(username);
        user.setPassword(Security.hash(password));
        user.setEmail(email);
        user.setRole(role);

        try {
            userDao.create(user);
        } catch (Exception e) {
            errors.add(e.getMessage());
            req.getSession().setAttribute("errors", errors.toArray(new String[]{}));
            req.getRequestDispatcher("/register.jsp").forward(req, resp);
            return;
        }

        session.setAttribute("messages", new String[]{"Uspešno ste se registrovali!"});
        req.getRequestDispatcher("/index.jsp").forward(req, resp);
    }
}
