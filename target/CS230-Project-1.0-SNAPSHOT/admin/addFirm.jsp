<%@ page import="rs.ac.metropolitan.database.entity.Firm" %>
<%@ page import="rs.ac.metropolitan.database.dao.FirmDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="../include/head.jsp"/>
    <title>LINKEDOUT | ADD FIRM</title>
    <style>
        body, html {
            background: whitesmoke;
        }

        .container-fluid {
            text-align: center !important;
        }

        .register-menu {
            margin-top: 30px;
            padding: 10px;
            position: relative;
        }

        .fields {
            margin-left: 26.5em;
            margin-top: 2em;
            margin-bottom: 2em;
            width: 100%;
        }
    </style>
</head>
<body>
 <%
     String name = request.getParameter("firm-name");
     String address = request.getParameter("address");
     String pwErr = "";

     Firm firm = new Firm();

        firm.setName(name);
        firm.setAddress(address);
        FirmDao firmDao = new FirmDao();
        firmDao.create(firm);
 %>
<jsp:include page="../include/nav.jsp"/>
 <div class="register">
     <main class="container">
         <div class="container-fluid">
             <div class="register-menu">
                 <form method="post" action="addFirm.jsp">
                     <h2 class="testing">Add firm:</h2>
                     <div class="row">
                         <div class="fields">
                             <div class="col-md-4">
                                 <label for="firm-name">Name:</label>
                                 <input id="firm-name" name="firm-name" type="text" autofocus="autofocus"/><br/><br/>
                                 <label for="address">Address:</label>
                                 <input id="address" name=address" type="text" autofocus="autofocus"/><br/><br/>
                                 <br/>
                                 <span style="color: red"><%= pwErr %></span>
                             </div>
                         </div>
                         <div class="submit-btn">
                             <input type="submit" class="btn btn-primary" value="Submit"/>
                         </div>
                     </div>
                 </form>
             </div>
         </div>
     </main>
 </div>
</body>
</html>
