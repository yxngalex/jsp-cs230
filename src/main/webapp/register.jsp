<%@ page import="com.example.app.database.dao.RoleDao" %>
<%@ page import="com.example.app.database.entity.Role" %>
<%@ page import="com.example.app.database.entity.User" %>
<%@ page import="com.example.app.database.dao.UserDao" %>
<%@ page import="com.example.app.security.Security" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="<%=session.getAttribute("lang")%>">
<head>
    <jsp:include page="include/head.jsp"/>
    <title>LinkedOut | Register</title>
    <style>
        body, html {
            background: whitesmoke;
        }

        .container-fluid {
            text-align: center !important;
        }

        .register-menu {
            margin-top: 30px;
            padding: 10px;
            position: relative;
        }

        .fields {
            margin-left: 26.5em;
            margin-top: 2em;
            margin-bottom: 2em;
            width: 100%;
        }
    </style>
</head>
<body>
<%
    String pwErr = "";
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String email = request.getParameter("email");
    String confPassword = request.getParameter("confPassword");
    String roleName = request.getParameter("role");

    if (request.getParameter("username") != null) {
        UserDao userDao = new UserDao();
        RoleDao roleDao = new RoleDao();


        if (password.equals(confPassword)) {
            User user = new User();
            Role role = roleDao.findByName(roleName);

            user.setUsername(username);
            user.setPassword(Security.hash(password));
            user.setEmail(email);
            user.setRole(role);

            userDao.create(user);
            session.setAttribute("newUsername", username);
        } else {
            pwErr = "Passwords do not match!";
        }
    }
%>
<div class="register">
    <main class="container">
        <div class="container-fluid">
            <div class="register-menu">
                <form method="post" action="register.jsp">
                    <h2 class="testing">Registruj se</h2>
                    <div class="row">
                        <div class="fields">
                            <div class="col-md-4">
                                <label for="username">Username:</label>
                                <input id="username" name="username" type="text" autofocus="autofocus"/><br/><br/>
                                <label for="password">Password:</label>
                                <input id="password" name="password" type="password" autofocus="autofocus"/><br/><br/>
                                <label for="confPassword">Confirm password:</label>
                                <input id="confPassword" name="confPassword" type="password"
                                       autofocus="autofocus"/><br/><br/>
                                <span style="color: red"><%= pwErr %></span>
                                <label for="email">Unesite vaš email:</label>
                                <input id="email" name="email" type="text" autofocus="autofocus"/><br/><br/>
                                <label for="role">Izaberite da li želite da budete poslodavac ili zaposleni:</label>
                                <br/>
                                <select name="role" id="role">
                                    <option value="Poslodavac">Poslodavac</option>
                                    <option value="Zaposleni">Zaposleni</option>
                                </select>
                            </div>
                        </div>
                        <div class="submit-btn">
                            <input type="submit" class="btn btn-primary" value="Submit"/>
                        </div>
                    </div>
                </form>
            </div>
        </div>

    </main>
</div>
</body>
</html>