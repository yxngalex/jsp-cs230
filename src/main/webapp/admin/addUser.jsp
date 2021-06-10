<%@ page import="rs.ac.metropolitan.database.entity.User" %>
<%@ page import="rs.ac.metropolitan.database.dao.UserDao" %>
<%@ page import="rs.ac.metropolitan.database.dao.RoleDao" %>
<%@ page import="rs.ac.metropolitan.database.entity.Role" %>
<%@ page import="java.util.List" %>
<%@ page import="rs.ac.metropolitan.security.Security" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="../include/head.jsp"/>
    <title>LINKEDOUT | ADD USER</title>
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
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String email = request.getParameter("email");
    String confPassword = request.getParameter("confPassword");
    String roleString = request.getParameter("role");
    String pwErr = "";

    RoleDao roleDao = new RoleDao();
    List<Role> roles = roleDao.findAll();
    request.setAttribute("roles", roles);


    if (request.getParameter("username") != null) {
        UserDao userDao = new UserDao();


        if (password.equals(confPassword)) {
            User user = new User();
            Role role = roleDao.findByName(roleString);

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
<jsp:include page="../include/nav.jsp"/>
<div class="register">
    <main class="container">
        <div class="container-fluid">
            <div class="register-menu">
                <form method="post" action="addUser.jsp">
                    <h2 class="testing">Add user:</h2>
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
                                <label for="email">Unesite vaš email:</label>
                                <input id="email" name="email" type="text" autofocus="autofocus"/><br/><br/>
                                <select name="role" id="role" class="form-select" aria-label="Select a Role" style="width: 40%; margin-left: 30%;">
                                    <option selected>Role</option>
                                    <c:forEach items="${roles}" var="role">
                                        <option value="${role.role}">${role.role}</option>
                                    </c:forEach>
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
