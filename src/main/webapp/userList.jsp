<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp" %>
<html>
<head>
    <title>Accueil</title>
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link href="https://unpkg.com/bootstrap-table@1.22.1/dist/bootstrap-table.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> <!-- Add jQuery -->
    <script src="https://unpkg.com/bootstrap-table@1.22.1/dist/bootstrap-table.min.js"></script>
</head>
<body>
<div class="d-flex justify-content-between">
    <h3>Bonjour ${userConnected.firstName} ${userConnected.lastName} !</h3>
    <form method="post" action="user-controller">
        <input type="submit" name="action" value="Déconnexion" class="btn btn-primary"/>
    </form>
</div>
<h2>Liste des apprentis</h2>
<div class="content m-16">
    <form method="post" action="user-controller">
        <table id="table"
               data-toggle="table"
               data-height="460"
               data-pagination="true"
               data-page-size="20"
               data-search="true">
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
                                        <button class="archive-button" type="submit" name="action" value="Archiver"
                                                data-userid="${user.id}">
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
        <input type="submit" name="action" value="Ajouter" class="btn btn-primary"/>
        <input type="submit" name="action" value="Apprentis Archiver" class="btn btn-primary"/>
    </form>
</div>

<script>
    $(document).ready(function () {
        $('.archive-button').click(function () {
            alert('Archivage réussi !');
        });
    });
</script>
</body>
</html>
