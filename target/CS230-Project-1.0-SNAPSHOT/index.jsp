<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="include/head.jsp"/>
    <title>LinkedOut | Jobs</title>
    <style>
        .name {
            color: limegreen;
        }

        .main-page {
            position: relative;
            width: 100%;
            height: 100%;
        }

        .main-page .contect-card {
            position: relative;
            text-align: center;
            margin-top: 10em;
        }

        .more-info {
            position: relative;
            display: flex;
            margin-top: 18em;
        }

        .more-info p {
            font-size: 15px;
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

<%@include file="include/nav.jsp" %>
<main class="main-page">
    <div class="contect-card">
        <% if (loggedIn) {%>
        <h2>Greetings <span class="name"><%=user.getUsername()%></span>!</h2>
        <h3>Welcome to LINKEDOUT</h3>
        <div class="para">
            <p>See all jobs <a href="#" style="text-decoration: none; color: darkorange; font-size: 20px;">here!</a>.</p>
        </div>
        <% } %>
        <% if (!loggedIn) {%>
        <h2>Greetings, stranger!</h2>
        <h3>Welcome to LINKEDOUT</h3>
        <div class="para">
            <p style="font-size: 20px;">You have to login to continue to the site!</p>
        </div>
        <% } %>
    </div>
    <div class="more-info">
        <div>
            <p style="font-size: 25px">
                Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et
                dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip
                ex ea commodo consequat.
            </p>
        </div>
        <div>
            <p style="font-size: 25px">
            Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et
                dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip
                ex ea commodo consequat.
            </p>
        </div>
        <div>
            <p style="font-size: 25px">
            Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et
                dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip
                ex ea commodo consequat.
            </p>
        </div>
    </div>
</main>
</body>
</html>