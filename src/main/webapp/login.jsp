<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="<%=session.getAttribute("lang")%>">
<head>
    <jsp:include page="include/head.jsp"/>
    <title>LINKEDOUT | Login</title>
</head>
<body>
<%--    <%--%>
<%--        String username = request.getParameter("username");--%>
<%--        String password = request.getParameter("password");--%>
<%--        String userErr = "";--%>
<%--        String pwErr = "";--%>


<%--        User user = new UserDao().findByUsername(username);--%>

<%--        if (user == null) {--%>
<%--            userErr = "User doesn't exists";--%>
<%--        } else if (!user.getPassword().equals(Security.hash(password))) {--%>
<%--            pwErr = "Invalid password";--%>
<%--        }--%>

<%--        if (user != null) {--%>
<%--            Properties props = Config.getProperties();--%>
<%--            int validity = Integer.parseInt(props.getProperty("session-validity"));--%>
<%--            session.setAttribute("username", user.getUsername());--%>
<%--            session.setAttribute("id", user.getIdUser());--%>
<%--            session.setAttribute("roles", user.getRole());--%>
<%--            session.setMaxInactiveInterval(validity);--%>
<%--            response.sendRedirect(request.getContextPath() + "/index.jsp");--%>
<%--        } else {--%>
<%--            System.out.println("Greska");--%>
<%--        }--%>
<%--    %>--%>
    <main>
        <form method="post" action="${pageContext.request.contextPath}/login">
            <h2>Ulogujte se</h2>
            <label for="username">Username:</label>
            <input type="text" name="username" id="username" />
            <label for="password">Password:</label>
            <input type="password" name="password" id="password" />
            <input type="submit" class="btn btn-success" value="Submit" />
        </form>
    </main>
</body>
</html>
