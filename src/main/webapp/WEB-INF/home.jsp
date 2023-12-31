<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="dependancies.jsp" %>
<%@ include file="./components/navbar.jsp" %>
<%@ page import="fr.efrei2023.ASTA.utils.UsersConstants" %>

<html>
<head>
    <title>Accueil</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" rel="stylesheet"
          id="bootstrap-css">
    <link href="https://unpkg.com/bootstrap-table@1.22.1/dist/bootstrap-table.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> <!-- Add jQuery -->
    <script src="https://unpkg.com/bootstrap-table@1.22.1/dist/bootstrap-table.min.js"></script>
    <script src="https://unpkg.com/tableexport.jquery.plugin/tableExport.min.js"></script>
    <script src="https://unpkg.com/bootstrap-table@1.22.1/dist/bootstrap-table-locale-all.min.js"></script>
    <script src="https://unpkg.com/bootstrap-table@1.22.1/dist/extensions/export/bootstrap-table-export.min.js"></script>
    <script src="jquery-3.7.1.min.js"></script>
</head>
<body>
<div class="content m-16" style="background-color: white;width: 95%; padding: 20px;margin: 25px">
    <h3 style="text-align: center">Liste des apprentis</h3>
    <form method="post" action="<%= UsersConstants.FORM_USER_CONTROLLER %>">
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
                                    <form action="<%= UsersConstants.FORM_USER_CONTROLLER %>"
                                          method="post"
                                          id="archive-form"
                                    >
                                        <input type="hidden"
                                               id="<%= UsersConstants.FIELD_USER_ID %>"
                                               name="<%= UsersConstants.FIELD_USER_ID %>"
                                               value=${user.id}
                                        >
                                        <button class="archive-button btn btn-primary"
                                                type="submit"
                                                name="action"
                                                value="<%= UsersConstants.ACTION_ARCHIVE %>"
                                                data-userid="${user.id}"
                                        >
                                            Archiver
                                        </button>
                                        <button class="btn btn-primary"
                                                name="action"
                                                value="<%= UsersConstants.ACTION_DETAIL %>"
                                                data-userid="${user.id}"
                                        >
                                            Détails
                                        </button>
                                        <button class="btn btn-primary"
                                                type="submit"
                                                name="action"
                                                value="<%= UsersConstants.ACTION_GO_TO_PAGE_MODIFY %>"
                                                data-userid="${user.id}"
                                        >
                                            Modifier
                                        </button>
                                    </form>
                                </td>
                            </tr>
                        </c:if>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <tr>
                        <td colspan="6">
                            La liste est vide. Ajoutez au moins un(e) apprenti(e).
                        </td>
                    </tr>
                </c:otherwise>
            </c:choose>
            </tbody>
        </table>
    </form>
</div>

<script>
    $(document).ready(function () {
        $('.archive-button').click(function () {
            alert('Archivage réussi !');
        });
    });
    $('#table').bootstrapTable({
        locale: "fr-FR",
    })
</script>

</body>
</html>
