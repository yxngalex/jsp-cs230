<%@ page import="rs.ac.metropolitan.database.entity.User" %>
<%@ page import="rs.ac.metropolitan.database.dao.UserDao" %>
<%@ page import="rs.ac.metropolitan.database.entity.Role" %>
<%@ page import="rs.ac.metropolitan.database.dao.RoleDao" %>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <title>eLearning System</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Roboto&display=swap');
        html, body {
            font-family: 'Roboto', sans-serif;
        }
        #navigation ul li {
            display: inline-block;
            padding: 0 5px;
        }
        #navigation ul li a {
            color: #fff;
            text-decoration: none;
        }
        #navigation {
            font-size: 20px;
            background: #111;
            padding: 10px;
            text-align: right;
        }
        #navigation li a:hover {
            color: darkorange;
            transition: .5ms ease;
        }
    </style>
</head>
<body>
<%
    String username = (String) session.getAttribute("username");
    Integer id = (Integer) session.getAttribute("id");
    boolean loggedIn = username != null && id != null;
    User user = new UserDao().findByUsername(username);
%>
<div id="header">
    <div class="shell">
        <div id="navigation">
            <ul>
                <% if (!loggedIn) {%>
                <li><a href="login.jsp" class="active">Login</a></li>
                <%}%>
                <%if (loggedIn && user.getRole().getRole().equals("Poslodavac")) {%>
                <li><a href="index.jsp" class="active">Home</a></li>
                <li><a href="poslodavac/addJob.jsp" class="active">Create a Job</a></li>
                <li><a href="${pageContext.request.contextPath}/logout" class="active">Logout</a></li>
                <%}%>
                <%if (loggedIn && user.getRole().getRole().equals("Zaposleni")) {%>
                <li><a href="index.jsp" class="active">Home</a></li>
                <li><a href="jobs.jsp" class="active">Find Jobs</a></li>
                <li><a href="${pageContext.request.contextPath}/logout" class="active">Logout</a></li>
                <%}%>
                <%if (loggedIn && user.getRole().getRole().equals("Admin")) {%>
                <li><a href="index.jsp" class="active">Home</a></li>
                <li><a href="admin/addUser.jsp" class="active">Add User</a></li>
                <li><a href="admin/addFirm.jsp" class="active">Add Firm</a></li>
                <li><a href="${pageContext.request.contextPath}/logout" class="active">Logout</a></li>
                <%}%>
            </ul>
        </div>
    </div>
</div>
</body>
</html>