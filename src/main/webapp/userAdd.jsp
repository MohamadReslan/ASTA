<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Ajout d'apprenti</title>
</head>
<body>
<h3>Bonjour ${userConnected.firstName} ${userConnected.lastName} !</h3>
<h2>Ajout d'apprenti</h2>

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
        <div class="form-group">
            <select name="selectCompanies">
                <c:forEach items="${allCompanies}" var="company">
                    <option name="companyId" value="${company.id}">${company.name}</option>
                </c:forEach>
            </select>
        </div>
        <div class="form-group">
            <select name="selectPrograms">
                <c:forEach items="${allPrograms}" var="program">
                    <option name="programId" value="${program.id}">${program.label}</option>
                </c:forEach>
            </select>
        </div>

        <input type="submit" name="action" value="Ajouter l'apprenti" class="btn btn-primary"/>
        <div style="color:red">
            ${errorMessage}
        </div>
    </form>
</div>
</body>
</html>
