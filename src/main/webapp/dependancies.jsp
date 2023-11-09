<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="fr.efrei2023.ASTA.utils.UsersConstants" %>

<html>
<head>
</head>
<body>
<div style="align-items: center;padding: 6px">
    <form method="post" action="user-controller" style="margin: 0">
        <div class="justify-content-between align-items-center" style="display: flex;flex-wrap: nowrap">
            <div style="display: flex;gap:4px;flex-wrap: nowrap">
                <h5 style="background-color: #508bfc;color: white;border-radius: 2px;padding:0 4px 0 4px">APPRENTICESHIP</h5><h5 style="color: #508bfc">APPLICATION</h5>
            </div>
            <div>
                <button type="submit" name="action" value="Home" class="btn btn-outline-primary">Accueil</button>
                <button type="submit" name="action" value="Apprentis archives"  class="btn btn-outline-primary">Utilisateurs Archivés</button>
                <button type="submit" name="action" value="Ajouter"  class="btn btn-outline-primary">Ajout d'utilisateur</button>
            </div>
            <div style="display: flex;gap:8px; align-items: center">
                <h6>Utilisateur : </h6><h6 style="font-weight: bold">${userConnected.firstName} ${userConnected.lastName} </h6>
                <button type="submit" name="action" value="Déconnexion" class="btn btn-outline-danger">Déconnexion</button>
            </div>
        </div>
    </form>
</div>
</body>
</html>
