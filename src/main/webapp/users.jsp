<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
</head>
<body>
<h3>Bonjour ${userConnected.firstName} ${userConnected.lastName} !</h3>
<div class="content">
    <table class="table table-striped">
        <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">Prénom</th>
            <th scope="col">Nom</th>
            <th scope="col">Téléphone</th>
            <th scope="col">Mail</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${allUsers}" var="user">
            <tr>
                <th><input type="radio" name="idUser" value=${user.id}></th>
                <td>${user.firstName}</td>
                <td>${user.lastName}</td>
                <td>${user.phone}</td>
                <td>${user.mail}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
