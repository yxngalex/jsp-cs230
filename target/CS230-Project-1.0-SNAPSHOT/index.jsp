<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>LinkedOut | Jobs</title>
</head>
<body>
<%@include file="include/nav.jsp" %>
<h1>
    <%= "A!" %>
    Server version = <%= application.getServerInfo()%>
    Servlet version = <%= application.getMajorVersion()%>.<%=application.getMinorVersion()%>
    JSP version = <%=JspFactory.getDefaultFactory().getEngineInfo().getSpecificationVersion()%> <br>
</h1>
<br/>
<a href="register.jsp">Register</a>
<a href="login.jsp">Login</a>
<a href="hello-servlet">Servlet</a>
</body>
</html>