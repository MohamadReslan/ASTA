<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <title>Profil Apprenti</title>
</head>
<body>
<nav class="navbar navbar-expand-lg bg-primary-subtle" style="background-color: darkblue;">
    <form method="post" action="user-controller" style="width: 100%; margin: 0;">
        <div class="container-fluid d-flex">
            <a class="navbar-brand" style="display: flex;gap:4px;flex-wrap: nowrap"><h5 style="background-color: white;color: darkblue;border-radius: 2px;padding:4px 4px 0 4px;margin: 0;">APPRENTICESHIP</h5><h5 style="color: white;margin-top: 4px;">APPLICATION</h5></a>
            <div class="collapse navbar-collapse" id="navbarNav">
            </div>
            <div class="d-flex" style="display: flex;gap:8px; align-items: center">
                <h6 style="color: white; margin: 0;">Utilisateur : </h6><h6 style="font-weight: bold; color: white; margin: 0;">${userInfo.firstName} ${userInfo.lastName} </h6>
                <button type="submit" name="action" value="Déconnexion" class="btn btn-outline-danger">Déconnexion</button>
            </div>
        </div>
    </form>
</nav>
<div class="d-flex flex-column align-items-center" style="background-color: #508bfc;width: 100%;height: 100%">
    <h1 id="title" class="d-flex m-4">Profil de ${userInfo.firstName} ${userInfo.lastName}</h1>
    <div style="height: 465px">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="card shadow-2-strong d-flex" style="border-radius: 1rem; height: 100%">
                <div id="content" class="col justify-content-center p-5 text-center" style="max-width: max-content">
                    <div class="input-group mb-3 w-100">
                        <span class="input-group-text w-50">Prénom</span>
                        <input disabled readonly type="text" class="form-control" value="${userInfo.firstName}" style="background-color: white;">
                    </div>
                    <div class="input-group mb-3 w-100">
                        <span class="input-group-text w-50">Nom</span>
                        <input disabled readonly type="text" class="form-control" value="${userInfo.lastName}" style="background-color: white;">
                    </div>
                    <div class="input-group mb-3 w-100">
                        <span class="input-group-text w-50">Téléphone</span>
                        <input disabled readonly type="text" class="form-control" value="${userInfo.phone}" style="background-color: white;">
                    </div>
                    <div class="input-group mb-3 w-100">
                        <span class="input-group-text w-50">Mail</span>
                        <input disabled readonly type="text" class="form-control" value="${userInfo.mail}" style="background-color: white;">
                    </div>
                    <div class="input-group mb-3 w-100">
                        <span class="input-group-text w-50">Maître d'apprentissage</span>
                        <input disabled readonly type="text" class="form-control" value="${userInfo.managerName}" style="background-color: white;">
                    </div>
                    <div class="input-group mb-3 w-100">
                        <span class="input-group-text w-50">Entreprise</span>
                        <input disabled readonly type="text" class="form-control" value="${userInfo.companyName}" style="background-color: white;">
                    </div>
                    <div class="input-group mb-3 w-100">
                        <span class="input-group-text w-50">Programme</span>
                        <input disabled readonly type="text" class="form-control" value="${userInfo.programName}" style="background-color: white;">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
