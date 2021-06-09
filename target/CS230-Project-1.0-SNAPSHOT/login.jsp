<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="<%=session.getAttribute("lang")%>">
<head>
    <jsp:include page="include/head.jsp"/>
    <title>LINKEDOUT | Login</title>
</head>
<body>
    <main>
        <form method="post" action="${pageContext.request.contextPath}/login">
            <h2>Ulogujte se</h2>
            <label for="username">Username:</label>
            <input type="text" name="username" id="username" />
            <label for="password">Password:</label>
            <input type="password" name="password" id="password" />
            <input type="submit" class="btn btn-success" value="Submit" />
        </form>
        <a href="register.jsp">Register Here!</a>
    </main>
</body>
</html>
