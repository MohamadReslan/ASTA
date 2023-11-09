<%--
  Created by IntelliJ IDEA.
  User: china
  Date: 2023/11/7
  Time: 22:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>Header</title>
</head>
<body>
<div  style="align-items: center">
    <form method="post" action="user-controller" style="margin: 0">
        <div class="justify-content-between align-items-center" style="display: flex;flex-wrap: nowrap">
            <div style="display: flex;gap:4px;flex-wrap: nowrap">
                <h2 style="background-color: #508bfc;color: white;border-radius: 2px;padding:0 4px 0 4px">APPRENTICESHIP</h2><h2 style="color: #508bfc">APPLICATION</h2>
            </div>
            <div>
                <button type="submit" name="action" value="Home" class="btn btn-outline-primary">Acceuil</button>
                <button type="submit" name="action" value="Apprentis archives"  class="btn btn-outline-primary">Utilisateurs Archivés</button>
                <button type="submit" name="action" value="Ajouter"  class="btn btn-outline-primary">Ajout d'utilisateur</button>
            </div>
            <button type="submit" name="action" value="Déconnexion" class="btn btn-outline-danger">Déconnexion</button>
        </div>
    </form>
</div>
</body>
</html>
