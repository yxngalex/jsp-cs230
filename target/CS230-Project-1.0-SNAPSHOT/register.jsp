<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.example.app.database.dao.RoleDao" %>
<%@ page import="com.example.app.database.entity.Role" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="<%=session.getAttribute("lang")%>">
<head>
    <jsp:include page="include/head.jsp"/>
    <title>LinkedOut | Register</title>
    <link href="styles/common.css" />
</head>
<body>
<%
    RoleDao roleDao = new RoleDao();
    List<Role> roles = roleDao.findAll();
    request.setAttribute("roles", roles);
%>
<div class="register">
    <main class="container">
        <div class="container-fluid">
            <form method="post" action="${pageContext.request.contextPath}/register">
                <h2 class="testing">Registruj se</h2>
                <div class="row">
                    <div class="col-md-3">
                        <label for="username">Unesite vaše korisničko ime:</label>
                        <input id="username" type="text" autofocus="autofocus"/>
                    </div>
                    <div class="col-md-3">
                        <label for="password">Unesite vašu šifru:</label>
                        <input id="password" type="password" autofocus="autofocus"/>
                    </div>
                    <div class="col-md-5">
                        <label for="email">Unesite vaš email:</label>
                        <input id="email" type="text" autofocus="autofocus"/>
                    </div>
                    <div class="col-md-5">
                        <label for="role">Izaberite da li želite da budete poslodavac ili zaposleni:</label>
                        <br/>
                        <select name="roles" id="role" multiple>
                            <option value="" disabled selected>Izaberite</option>
                            <c:forEach items="${roles}" var="role">
                                <option value="${role.idRole}">${role.role}</option>
                            </c:forEach>
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