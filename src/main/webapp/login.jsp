<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="<%=session.getAttribute("lang")%>">
<head>
    <jsp:include page="include/head.jsp"/>
    <title>LINKEDOUT | Login</title>
</head>
<body>
<main class="login-page" style="text-align: center">
    <div class="card">
        <div class="card-header">
            <h2>Ulogujte se</h2>
        </div>
        <div class="card-body">
            <form method="post" action="${pageContext.request.contextPath}/login">
                <label for="username">Username:</label>
                <input type="text" name="username" id="username"/><br><br>
                <label for="password">Password:</label>
                <input type="password" name="password" id="password"/><br><br>
                <input type="submit" class="btn btn-success" value="Submit"/>
            </form>
        </div>
        <a href="register.jsp">Register Here!</a>
    </div>
</main>
</body>
</html>
