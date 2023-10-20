<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>Title</title>--%>
<%--    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">--%>
<%--    <link href="https://unpkg.com/bootstrap-table@1.22.1/dist/bootstrap-table.min.css" rel="stylesheet">--%>
<%--    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> <!-- Add jQuery -->--%>
<%--    <script src="https://unpkg.com/bootstrap-table@1.22.1/dist/bootstrap-table.min.js"></script>--%>
<%--</head>--%>
<%--<body>--%>
<%--<h3>Bonjour ${userConnected.firstName} ${userConnected.lastName} !</h3>--%>
<%--<div class="content m-16">--%>
<%--    <table id="table"--%>
<%--           data-toggle="table"--%>
<%--           data-height="460"--%>
<%--           data-pagination="true"--%>
<%--           data-page-size="2"--%>
<%--           data-search="true">--%>
<%--        <thead>--%>
<%--            <tr>--%>
<%--                <th data-field="id">#</th>--%>
<%--                <th data-field="firstName" data-sortable="true">Prénom</th>--%>
<%--                <th data-field="lastName" data-sortable="true">Nom</th>--%>
<%--                <th data-field="phone">Téléphone</th>--%>
<%--                <th data-field="mail">Mail</th>--%>
<%--            </tr>--%>
<%--        </thead>--%>
<%--        <tbody>--%>
<%--            <c:choose>--%>
<%--                <c:when test="${fn:length(allUsers) > 0}">--%>
<%--                    <c:forEach items="${allUsers}" var="user">--%>
<%--                        <tr>--%>
<%--                            <th>--%>
<%--                                <input type="radio" name="idUser" value=${user.id}>--%>
<%--                            </th>--%>
<%--                            <td>${user.firstName}</td>--%>
<%--                            <td>${user.lastName}</td>--%>
<%--                            <td>${user.phone}</td>--%>
<%--                            <td>${user.mail}</td>--%>
<%--                            <td>--%>
<%--                                <button class="archive-button" data-userid="${user.id}">--%>
<%--                                    Archiver--%>
<%--                                </button>--%>
<%--                            </td>--%>
<%--                        </tr>--%>
<%--                    </c:forEach>--%>
<%--                </c:when>--%>
<%--                <c:otherwise>--%>
<%--                    <tr>--%>
<%--                        <th colspan="5">La liste est vide. Ajoutez au moins un(e) apprenti(e).</th>--%>
<%--                    </tr>--%>
<%--                </c:otherwise>--%>
<%--            </c:choose>--%>
<%--        </tbody>--%>
<%--    </table>--%>
<%--</div>--%>

<%--<script>--%>
<%--    $(document).ready(function() {--%>
<%--        // Add a click event handler for the "Archiver" buttons--%>
<%--        $('.archive-button').click(function() {--%>
<%--            // Get the user ID from the button's data attribute--%>
<%--            var userId = $(this).data('userid');--%>

<%--            // You can perform your archiving action here--%>
<%--            // For demonstration, we'll simply alert the user ID--%>
<%--            alert('Archiving user with ID: ' + userId);--%>
<%--        });--%>
<%--    });--%>
<%--</script>--%>

<%--</body>--%>
<%--</html>--%>



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
<body>
<h3>Bonjour ${userConnected.firstName} ${userConnected.lastName} !</h3>
<div class="content m-16">
    <form method="post" action="user-controller">
    <table id="table"
           data-toggle="table"
           data-height="460"
           data-pagination="true"
           data-page-size="2"
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
                    <c:if test="${!user.isArchive}">
                        <tr>
                            <td>${user.id}</td>
                            <td>${user.firstName}</td>
                            <td>${user.lastName}</td>
                            <td>${user.phone}</td>
                            <td>${user.mail}</td>
                            <td>
                                <form action="user-controller" method="post" id="archive-form">
                                    <input type="hidden" id="userId" name="userId" value=${user.id}>
                                    <button class="archive-button" type="submit" name="action" value="Archiver" data-userid="${user.id}">
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
    </form>
</div>

<script>
    $(document).ready(function() {
        // Add a click event handler for the "Archiver" buttons
        $('.archive-button').click(function() {
            // Get the user ID from the button's data attribute
            var userId = $(this).data('userid');

            // You can perform your archiving action here
            // For demonstration, we'll simply alert the user ID
            alert('Archiving user with ID: ' + userId);
        });
    });
</script>
</body>
</html>
