<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" rel="stylesheet"
          id="bootstrap-css">
    <title>Page Login</title>
</head>
<body>
<section class="row d-flex justify-content-center" style="background-color: #508bfc;width: 100%;height: 100%">
    <div class="container py-5 h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div>
                <div class="card shadow-2-strong" style="border-radius: 1rem;">
                    <div class="p-5 text-center" style="">
                        <h3 class="mb-5">Connectez-vous</h3>
                        <form class="row d-flex justify-content-center text-center" action="user-controller"
                              method="post">
                            <fieldset>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Login" name="loginField" autofocus>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Mot de passe" name="pwdField"
                                           type="password">
                                </div>
                                <input type="submit" name="action" value="Login" class="btn btn-primary"/>
                            </fieldset>
                        </form>
                        </form>
                        <div style="color:red">
                            ${errorMessage}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>
