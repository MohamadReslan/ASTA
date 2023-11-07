<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>Title</title>
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link href="https://unpkg.com/bootstrap-table@1.22.1/dist/bootstrap-table.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> <!-- Add jQuery -->
    <script src="https://unpkg.com/bootstrap-table@1.22.1/dist/bootstrap-table.min.js"></script>
</head>
<body style="background-color: #887D61;margin: 4px">
<div style="display: flex; align-items: center; gap: 6px;justify-content: space-between">
    <div style="display: flex;gap:4px">
        <h3>Bonjour </h3><h3 style="font-weight: bold"> ${userConnected.firstName} ${userConnected.lastName} !</h3>
    </div>
    <form method="post" action="user-controller" style="margin: 0">
        <input type="submit" name="action" value="Déconnexion" style="background-color: #8B785C;border-radius: 8px;font-size: 26px;margin-right: 10px"/>
    </form>
</div>
<div class="content m-16" style="background-color: #CFC79A;width: 60%; padding: 20px;margin: 25px">
    <h2 style="font-weight: bold;margin: 10px">Liste des étudiants</h2>
    <form method="post" action="user-controller">
    <table id="table"
           data-toggle="table"
           data-height="460"
           data-pagination="true"
           data-page-size="20"
           data-search="true"
           locale="fr">
        <thead>
        <tr>
            <th data-field="id">#</th>
            <th data-field="firstName" data-sortable="true">Prénom</th>
            <th data-field="lastName" data-sortable="true">Nom</th>
            <th data-field="phone">Téléphone</th>
            <th data-field="mail">Mail</th>
            <th data-field="action">Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:choose>
            <c:when test="${fn:length(allUsers) > 0}">
                <c:forEach items="${allUsers}" var="user">
                    <c:if test="${!user.getArchive()}">
                        <tr>
                            <td>${user.id}</td>
                            <td>${user.firstName}</td>
                            <td>${user.lastName}</td>
                            <td>${user.phone}</td>
                            <td>${user.mail}</td>
                            <td>
                                <form action="user-controller" method="post" id="archive-form">
                                    <input type="hidden" id="userId" name="userId" value=${user.id}>
                                    <button class="archive-button" style="background-color: #8B785C;border-radius: 8px;font-size: 26px;" type="submit" name="action" value="Archiver" data-userid="${user.id}">
                                        Archiver
                                    </button>
                                </form>
                            </td>
                        </tr>
                    </c:if>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <tr>
                    <td colspan="6">La liste est vide. Ajoutez au moins un(e) apprenti(e).</td>
                </tr>
            </c:otherwise>
        </c:choose>
        </tbody>
    </table>
        <div style="display: flex;gap:8px">
            <input type="submit" name="action" value="Ajouter un utilisateur" style="background-color: #8B785C;border-radius: 8px;font-size: 26px;"/>
            <input type="submit" name="action" value="Utilisateurs archivés" style="background-color: #8B785C;border-radius: 8px;font-size: 26px;"/>
        </div>
    </form>
</div>

<script>
    $(document).ready(function() {
        $('.archive-button').click(function() {
            alert('Archivage réussi !');
        });
    });
</script>
</body>
</html>
