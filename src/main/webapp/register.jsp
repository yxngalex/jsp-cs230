<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="<%=session.getAttribute("lang")%>">
<head>
    <jsp:include page="include/head.jsp"/>
    <title>LinkedOut | Register</title>
</head>
<body>
<main class="container">
    <form class="" method="post" action="<c:url value="/register"/>">
        <h2>Registruj se</h2>
        <div class="row">
            <h3>Test</h3>
        </div>
    </form>
</main>
</body>
</html>