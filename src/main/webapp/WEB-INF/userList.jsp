<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="dependancies.jsp" %>
<html>
<head>
    <title>Accueil</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link href="https://unpkg.com/bootstrap-table@1.22.1/dist/bootstrap-table.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> <!-- Add jQuery -->
    <script src="jquery-3.7.1.min.js"></script>
    <script src="https://unpkg.com/bootstrap-table@1.22.1/dist/bootstrap-table.min.js"></script>
</head>
<body style="margin: 4px">
<div class="d-flex justify-content-between" style="align-items: center">
    <div style="display: flex;gap:4px"><h3>Bonjour</h3><h3 style="font-weight: bold">${userConnected.firstName} ${userConnected.lastName} !</h3></div>
    <form method="post" action="user-controller" style="margin: 0">
        <button type="submit" name="action" value="Déconnexion" class="btn btn-outline-danger">Déconnexion</button>
    </form>
</div>
<div class="content m-16" style="background-color: white;width: 95%; padding: 20px;margin: 25px">
    <h2>Liste des apprentis</h2>
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
                                    <form action="<%= UsersConstants.FORM_USER_CONTROLLER %>" method="post" id="archive-form">
                                        <input type="hidden" id="userId" name="userId" value=${user.id}>
                                        <button class="archive-button btn btn-primary" type="submit" name="action" value="<%= UsersConstants.ACTION_ARCHIVER %>" data-userid="${user.id}" >
                                            Archiver
                                        </button>
                                        <button class="btn btn-primary" name="action" value="<%= UsersConstants.ACTION_DETAIL %>" data-userid="${user.id}">
                                            Détails
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
        <input type="submit" name="action" value="<%= UsersConstants.ACTION_AJOUTER %>" class="btn btn-primary"/>
        <input type="submit" name="action" value="<%= UsersConstants.ACTION_APPRENTICE_ARCHIVER %>" class="btn btn-primary"/>
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
