<%--
  Created by IntelliJ IDEA.
  User: louisgiraudel
  Date: 07/11/2023
  Time: 23:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp" %>
<html>
<head>

  <title>Title</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> <!-- Add jQuery -->
  <script src="jquery-3.7.1.min.js"></script>
  <script src="https://unpkg.com/bootstrap-table@1.22.1/dist/bootstrap-table.min.js"></script>

</head>
<body>
<section class="row d-flex justify-content-center" style="background-color: #508bfc;width: 100%;height: 100%">
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div>
        <div class="card shadow-2-strong" style="border-radius: 1rem;">
          <div class="p-5 text-center" style="">
            <h3 class="mb-5"> Vous êtes sur la page de : ${ apprentice.firstName } !</h3>
            <form class="row d-flex justify-content-center text-center" action="user-controller" method="post">
              <fieldset>
                <!--show last name !-->
                <div class="form-group">
                  <input class="form-control" placeholder="Lastname" name="champLastname" value="${apprentice.lastName}" autofocus="">
                </div>
                <!--show first name !-->
                <div class="form-group">
                  <input class="form-control" placeholder="Firstname" name="champFirstname" value="${apprentice.firstName}" type="text">
                </div>
                <!--show mdp crypté avec fonctionnalité de le voir !-->
                <div class="form-group">
                  <input class="form-control" placeholder="Password" name="champPassword" value="${apprentice.mdp}" type="password">
                </div>
                <!--show mail !-->
                <div class="form-group">
                  <input class="form-control" placeholder="Mail" name="champMail" value="${apprentice.mail}" type="email">
                </div>
                <!--show téléphone !-->
                <div class="form-group">
                  <input class="form-control" placeholder="Telephone" name="champPhone" value="${apprentice.phone}" type="number">
                </div>
                <!--show company from company id!-->
                <div class="form-group">
                  <select name="champCompany">
                    <c:forEach items="${allCompanies}" var="company">
                        <option <c:if test="${company.id == apprentice.companyId}">selected="selected"</c:if> name="companyId" value="${company.id}">${company.name}</option>
                    </c:forEach>
                  </select>
                </div>
                <!--show programm from programm id !-->
                <div class="form-group">
                  <select name="champProgram">
                    <c:forEach items="${allPrograms}" var="program">
                        <option <c:if test="${program.id == apprentice.programId}">selected="selected"</c:if> name="programId" value="${program.id}">${program.label}</option>
                    </c:forEach>
                  </select>
                </div>

                <button class="modification-button btn btn-primary" type="submit" name="action" value="modification">
                  Modifier
                </button>

              </fieldset>
              <input name="userId" value="${apprentice.id}" type="text" hidden="hidden">
            </form>

          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<script>
  $(document).ready(function () {
    $('.modification-button').click(function () {
      alert('Modification réussie !');
    });
  });
</script>

</body>
</html>
