<%@ page import="com.example.app.database.dao.RoleDao" %>
<%@ page import="com.example.app.database.entity.Role" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.app.database.entity.User" %>
<%@ page import="com.example.app.database.dao.UserDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="<%=session.getAttribute("lang")%>">
<head>
    <jsp:include page="include/head.jsp"/>
    <title>LinkedOut | Register</title>
    <link href="styles/common.css"/>
</head>
<body>
<%
    if (request.getParameter("username") != null) {
        out.println(request.getParameter("username"));
        String username = request.getParameter("username").toString();
        String password = request.getParameter("password").toString();
        String email = request.getParameter("email").toString();
        String confPassword = request.getParameter("confPassword").toString();
        String roleName = request.getParameter("role").toString();
        String pwErrors = "";

        UserDao userDao = new UserDao();
        RoleDao roleDao = new RoleDao();


        if (password.equals(confPassword)) {
            User user = new User();
            Role role = roleDao.findByName(roleName);

            user.setUsername(username);
            user.setPassword(password);
            user.setEmail(email);
            user.setRole(role);

            userDao.create(user);
            session.setAttribute("newUsername", username);
        } else {
            out.println("Passwords do not match!");
        }
    }
%>
%>
<div class="register">
    <main class="container">
        <div class="container-fluid">
            <form method="post" action="register.jsp">
                <h2 class="testing">Registruj se</h2>
                <div class="row">
                    <div class="col-md-3">
                        <label for="username">Username:</label>
                        <input id="username" name="username" type="text" autofocus="autofocus"/>
                    </div>
                    <div class="col-md-3">
                        <label for="password">Password:</label>
                        <input id="password" name="password" type="password" autofocus="autofocus"/>
                    </div>
                    <div class="col-md-3">
                        <label for="confPassword">Confirm password:</label>
                        <input id="confPassword" name="confPassword" type="password" autofocus="autofocus"/>
                    </div>
                    <div class="col-md-5">
                        <label for="email">Unesite vaš email:</label>
                        <input id="email" name="email" type="text" autofocus="autofocus"/>
                    </div>
                    <div class="col-md-5">
                        <label for="role">Izaberite da li želite da budete poslodavac ili zaposleni:</label>
                        <br/>
                        <select name="role" id="role" multiple>
                            <option value="Poslodavac">Poslodavac</option>
                            <option value="Zaposleni">Zaposleni</option>
                        </select>
                    </div>
                </div>
                <div class="submit-btn">
                    <input type="submit" class="btn btn-primary" value="Submit"/>
                </div>
            </form>
        </div>
    </main>
</div>
</body>
</html>