<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="rs.ac.metropolitan.database.dao.JobDao" %>
<%@ page import="rs.ac.metropolitan.database.entity.Job" %>
<%@ page import="java.util.List" %>
<%@ page import="rs.ac.metropolitan.database.dao.UserJobDao" %>
<%@ page import="rs.ac.metropolitan.database.entity.UserJob" %>
<%@ page import="rs.ac.metropolitan.database.entity.User" %>
<%@ page import="rs.ac.metropolitan.database.dao.UserDao" %>
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
    UserJob userJob = new UserJob();
    JobDao jobDao = new JobDao();
    UserJobDao userJobdao = new UserJobDao();

    String num = request.getParameter("index");

    List<Job> jobs = jobDao.findAll();
    request.setAttribute("jobs", jobs);

    Job job = jobDao.find(num);

    User user = UserDao.findByUsername((String) session.getAttribute("username"));

    userJob.setUserId(user);
    userJob.setJobId(job);

    userJobdao.create(userJob);
%>
<jsp:include page="include/nav.jsp"/>
<main>
    <section>
        <form action="jobs.jsp" method="post">
            <% if (jobs.size() != 0) {%>
            <c:forEach items="${jobs}" var="jobs" varStatus="loop">
                <div class="card border-info mb-3" style="max-width: 25rem; margin-bottom: 5em">
                    <div class="card-header">${jobs.name}</div>
                    <div class="card-body">
                        <h5 class="card-title">${jobs.firmId.name}</h5>
                        <div class="firm-description" style="overflow: auto">
                            <p class="card-text">${jobs.description}</p>
                        </div>
                    </div>
                    <input type="hidden" name="index" value="${loop.index}">
                    <div class="card-footer bg-transparent border-success">
                        <input type="submit" class="btn btn-primary" value="Subscribe">
                    </div>
                </div>
            </c:forEach>
            <% } else {%>
            <p>There are no jobs in database!</p>
            <% } %>
        </form>
    </section>
</main>
    <script>
        getCategoryIndex = (index) => {
            return index;
        }
    </script>
</body>
</html>
