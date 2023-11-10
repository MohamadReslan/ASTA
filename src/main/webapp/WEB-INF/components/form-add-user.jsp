<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
</head>
<body>
<section class="row d-flex justify-content-center" style="background-color: #508bfc;width: 100%;height: 100%">
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div>
        <div class="card shadow-2-strong" style="border-radius: 1rem;">
          <div class="p-5 text-center">
            <h3 class="mb-5">Ajouter un nouvel apprenti</h3>
            <form class="row d-flex justify-content-center text-center"
                  action="<%= UsersConstants.FORM_USER_CONTROLLER %>"
                  method="post">
              <fieldset>
                <div class="form-group">
                  <input class="form-control" placeholder="Nom de famille"
                         name="<%= UsersConstants.FIELD_LASTNAME %>"
                         autofocus="">
                </div>
                <div class="form-group">
                  <input class="form-control" placeholder="Prénom"
                         name="<%= UsersConstants.FIELD_FIRSTNAME %>">
                </div>
                <div class="form-group">
                  <input class="form-control" placeholder="Téléphone"
                         name="<%= UsersConstants.FIELD_PHONE %>">
                </div>
                <div class="form-group">
                  <input class="form-control" placeholder="<%= UsersConstants.FIELD_EMAIL %>"
                         name="<%= UsersConstants.FIELD_EMAIL %>">
                </div>
                <div class="form-group">
                  <input class="form-control" placeholder="Nom du maitre d'apprentissage"
                         name="<%= UsersConstants.FIELD_MANAGER_NAME %>">
                </div>
                <div class="form-group">
                  <select style="width: 100%" name="<%= UsersConstants.FIELD_COMPANY %>">
                    <c:forEach items="${allCompanies}" var="company">
                      <option name="companyId" value="${company.id}">${company.name}</option>
                    </c:forEach>
                  </select>
                </div>
                <div class="form-group">
                  <select style="width: 100%" name="<%= UsersConstants.FIELD_PROGRAM %>">
                    <c:forEach items="${allPrograms}" var="program">
                      <option name="programId" value="${program.id}">${program.label}</option>
                    </c:forEach>
                  </select>
                </div>

                <input type="submit" name="action" value="<%= UsersConstants.ACTION_ADD_APPRENTICE %>"
                       class="btn btn-primary"/>
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
