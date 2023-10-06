<%--
  Created by IntelliJ IDEA.
  User: nitsu
  Date: 11/09/2023
  Time: 15:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    session = request.getSession(false);
    if (session != null) {
        System.out.println("not null");
%>
<html>
<head></head>
<body>
    <h3> Bonjour ${ utilisateur.loginSaisi } !</h3>
</body>
</html>
<%  session.invalidate();
    } else {
        System.out.println("OK");

        response.sendRedirect("http://www.google.com");
    }
%>












