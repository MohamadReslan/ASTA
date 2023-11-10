<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="dependancies.jsp" %>
<html>
<head>
    <title>Modifier Apprenti</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" rel="stylesheet"
          id="bootstrap-css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="jquery-3.7.1.min.js"></script>
    <script src="https://unpkg.com/bootstrap-table@1.22.1/dist/bootstrap-table.min.js"></script>
    <style>
        /* Style de l'icône de l'œil */
        label {
            position: relative;
        }

        label input {
            font-size: 1em;
            color: #f9f9f9;
            background: transparent;
            padding: 1rem 1.2rem;
            width: 350px;
            border-radius: 5px;
            border: 2px solid #7a7a7a;
            transition: all 0.2s;
        }

        label input:focus {
            border-color: #ff4754;
        }

        label .password-icon {
            display: flex;
            align-items: center;
            position: absolute;
            top: 35%;
            right: 5%;
            transform: translateY(-50%);
            width: 20px;
            color: #f9f9f9;
            transition: all 0.2s;
        }

        label .password-icon:hover {
            cursor: pointer;
            color: #ff4754;
        }

        label .password-icon .feather-eye-off {
            display: none;
        }

        /* Style pour masquer le bouton par défaut */
        .show-password-button {
            display: none;
        }
    </style>
</head>
<body>
<section class="row d-flex justify-content-center" style="background-color: #508bfc;width: 100%;height: 100%">
    <div class="container py-5 h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div>
                <div class="card shadow-2-strong" style="border-radius: 1rem;">
                    <div class="p-5 text-center">
                        <h3 class="mb-5"> Vous êtes sur la page de : ${ apprentice.firstName } !</h3>
                        <form class="row d-flex justify-content-center text-center"
                              action="<%= UsersConstants.FORM_USER_CONTROLLER %>" method="post">
                            <fieldset>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Lastname"
                                           name="<%= UsersConstants.FIELD_LASTNAME %>"
                                           value="${apprentice.lastName}" autofocus="">
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Firstname"
                                           name="<%= UsersConstants.FIELD_FIRSTNAME %>"
                                           value="${apprentice.firstName}" type="text">
                                </div>
                                <label>
                                    <div class="form-group">
                                        <input class="form-control" placeholder="Password"
                                               name="<%= UsersConstants.FIELD_PWD %>"
                                               value="${apprentice.mdp}" type="password" id="passwordInput">
                                        <div class="password-icon">
                                            <i data-feather="eye"></i>
                                            <i data-feather="eye-off"></i>
                                        </div>
                                    </div>
                                </label>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Mail"
                                           name="<%= UsersConstants.FIELD_EMAIL %>"
                                           value="${apprentice.mail}" type="email">
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Telephone"
                                           name="<%= UsersConstants.FIELD_PHONE %>"
                                           value="${apprentice.phone}" type="number">
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Manager Name"
                                           name="<%= UsersConstants.FIELD_MANAGER_NAME %>"
                                           value="${apprentice.managerName}" type="text">
                                </div>
                                <div class="form-group">
                                    <select style="width: 100%" name="<%= UsersConstants.FIELD_COMPANY %>">
                                        <c:forEach items="${allCompanies}" var="company">
                                            <option
                                                    <c:if test="${company.id == apprentice.companyId}">
                                                        selected="selected"
                                                    </c:if>
                                                    name="companyId" value="${company.id}">${company.name}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <select style="width: 100%" name="<%= UsersConstants.FIELD_PROGRAM %>">
                                        <c:forEach items="${allPrograms}" var="program">
                                            <option
                                                    <c:if test="${program.id == apprentice.programId}">
                                                        selected="selected"
                                                    </c:if>
                                                    name="programId" value="${program.id}">${program.label}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <button class="modification-button btn btn-primary" type="submit" name="action"
                                        value="<%= UsersConstants.ACTION_MODIFICATION %>">
                                    Modifier
                                </button>
                            </fieldset>
                            <input name="<%= UsersConstants.FIELD_USER_ID %>" value="${apprentice.id}" type="text"
                                   hidden="hidden">
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<script src="https://unpkg.com/feather-icons">
    $(document).ready(function () {
        $('.modification-button').click(function () {
            alert('Modification réussie !');
        })
    });
</script>

<script src="https://unpkg.com/feather-icons"></script>
<script>
    feather.replace();
    const eye = document.querySelector(".feather-eye");
    const eyeoff = document.querySelector(".feather-eye-off");
    const passwordField = document.querySelector("input[type=password]");
    eye.addEventListener("click", () => {
        eye.style.display = "none";
        eyeoff.style.display = "block";
        passwordField.type = "text";
    });
    eyeoff.addEventListener("click", () => {
        eyeoff.style.display = "none";
        eye.style.display = "block";
        passwordField.type = "password";
    });
</script>
</body>
</html>
