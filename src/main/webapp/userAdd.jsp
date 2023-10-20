<%--
  Created by IntelliJ IDEA.
  User: basti
  Date: 20/10/2023
  Time: 09:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>UserAdd</title>
</head>
<body>
<h3>Bonjour ${userConnected.firstName} ${userConnected.lastName} !</h3>
<div class="panel-body">
    <form action="user-controller" method="post">
            <div class="form-group">
                <input class="form-control" placeholder="Nom de famille" name="lastname" autofocus="">
            </div>
            <div class="form-group">
                <input class="form-control" placeholder="Prénom" name="name" type="">
            </div>
            <div class="form-group">
                <input class="form-control" placeholder="Téléphone" name="phone" type="">
            </div>
            <div class="form-group">
                <input class="form-control" placeholder="Email" name="email" type="">
            </div>

            <input type="submit" name="action" value="Ajouter l'apprenti" class="btn btn-primary"/>
    </form>
</div>
</body>
</html>
