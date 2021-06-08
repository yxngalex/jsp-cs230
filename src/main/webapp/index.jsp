<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>LinkedOut | Jobs</title>
</head>
<body>
<h1>
    <%= "A!" %>
    Server version = <%= application.getServerInfo()%>
    Servlet version = <%= application.getMajorVersion()%>.<%=application.getMinorVersion()%>
    JSP version = <%=JspFactory.getDefaultFactory().getEngineInfo().getSpecificationVersion()%> <br>
</h1>
<br/>
<a href="register.jsp">Register</a>
</body>
</html>