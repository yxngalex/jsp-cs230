<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="rs.ac.metropolitan.database.dao.JobDao" %>
<%@ page import="rs.ac.metropolitan.database.entity.Job" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>LINKEDOUT | Jobs</title>
    <style>
        .card-body {
            color: #111111;
        }

        section {
            text-align: center;
            margin-left: 44%;
        }
    </style>
</head>
<body>
<%
    JobDao jobDao = new JobDao();
    List<Job> jobs = jobDao.findAll();
    request.setAttribute("jobs", jobs);

%>
<jsp:include page="include/nav.jsp"/>
<main>
    <section>
        <% if (jobs.isEmpty()) {%>
        <c:forEach items="${jobs}" var="job" varStatus="loop">
            <form action="<c:url value="/subscribe"/>" method="post">
                <div class="card border-info mb-3" style="max-width: 25rem; margin-bottom: 5em">
                    <div class="card-header">${job.name}</div>
                    <div class="card-body">
                        <h5 class="card-title">${job.firmId.name}</h5>
                        <div class="firm-description" style="overflow: auto">
                            <p class="card-text">${job.description}</p>
                        </div>
                    </div>
                    <input type="hidden" name="id-job" value="${job.idJob}"/>
                    <div class="card-footer bg-transparent border-success">
                        <input type="submit" class="btn btn-primary" value="Subscribe">
                    </div>
                </div>
            </form>
        </c:forEach>
        <% } else {%>
        <p>There are no jobs in database!</p>
        <% } %>
    </section>
</main>
<script>
    getCategoryIndex = (index) => {
        return index;
    }
</script>
</body>
</html>
