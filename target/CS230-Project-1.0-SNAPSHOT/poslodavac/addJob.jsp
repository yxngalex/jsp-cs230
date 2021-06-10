<%@ page import="rs.ac.metropolitan.database.dao.FirmDao" %>
<%@ page import="rs.ac.metropolitan.database.entity.Firm" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="../include/head.jsp"/>
    <title>LINKEDOUT | Create a Job</title>
    <style>
        .create-a-job {
            text-align: center;
        }

        .form-group {
            margin: 2em 0 !important;
        }
    </style>
</head>
<body>
<%
    FirmDao firmDao = new FirmDao();
    List<Firm> firms = firmDao.findAll();
    request.setAttribute("firms", firms);
%>
<jsp:include page="../include/nav.jsp"/>
<main class="create-a-job">
    <div class="create">
        <form method="post" action="${pageContext.request.contextPath}/add-job">
            <div class="form-group">
                <label for="name">Name</label>
                <input type="text" class="form-control" id="name" name="name" aria-describedby="name"
                       placeholder="Please enter your jobs name" required style="width: 20%; margin-left: 40%;">
                <small id="nameHelp" class="form-text text-muted">This is your jobs name!</small>
            </div>
            <br>
            <div class="form-group">
                <label for="description">Description</label><br>
                <textarea name="description" id="description" maxlength="500" minlength="5" style="height: 40%; width: 80%;"></textarea><br>
                <small id="descriptionHelp" class="form-text text-muted">This is your jobs description!</small>
            </div>
            <br>
            <select name="firm" id="firm" class="form-select" aria-label="Select a Firm" style="width: 40%; margin-left: 30%;">
                <option selected>See all firms</option>
                <c:forEach items="${firms}" var="firm">
                    <option value="${firm.name}">${firm.name}</option>
                </c:forEach>
            </select>
            <br><br>
            <input type="submit" class="btn btn-success" value="submit" />
        </form>
    </div>
</main>
</body>
</html>
