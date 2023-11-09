<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="dependancies.jsp" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" rel="stylesheet"
          id="bootstrap-css">
    <title>Ajout d'apprenti</title>
</head>
<body>
<section class="row d-flex justify-content-center" style="background-color: #508bfc;width: 100%;height: 100%">
    <div class="container py-5 h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div>
                <div class="card shadow-2-strong" style="border-radius: 1rem;">
                    <div class="p-5 text-center" style="">
                        <h3 class="mb-5">Ajouter un nouvel apprenti</h3>
                        <form class="row d-flex justify-content-center text-center" action="<%= UsersConstants.FORM_USER_CONTROLLER %>"
                              method="post">
                            <fieldset>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Nom de famille" name="lastname"
                                           autofocus="">
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

                                <input type="submit" name="action" value="<%= UsersConstants.ACTION_AJOUTER_APPRENTI %>" class="btn btn-primary"/>
                                <div style="color:red">
                                    ${errorMessage}
                                </div>
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>
