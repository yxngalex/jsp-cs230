<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="include/head.jsp"/>
    <title>LINKEDOUT | Create a Job</title>
</head>
<body>
<jsp:include page="include/nav.jsp"/>
<main class="create-a-job">
    <div class="create">
        <form method="post" action="${pageContext.request.contextPath}/add-job">
            <div class="form-group">
                <label for="name">Name</label>
                <input type="text" class="form-control" id="name" name="name" aria-describedby="name" placeholder="Please enter your jobs name" required>
                <small id="nameHelp" class="form-text text-muted">This is your jobs name!</small>
            </div>
            <div class="form-group">
                <label for="description">Description</label>
                <textarea name="description" id="description" maxlength="500" minlength="100"></textarea>
            </div>
            <div class="form-check">
                <label class="form-check-label" for="firm">Firm:</label>
                <select name="firm" id="firm">
                    <option value="Test">Test</option>
                </select>
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
    </div>
</main>
</body>
</html>
