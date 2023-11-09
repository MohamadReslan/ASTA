<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <title>Profil Apprenti</title>
</head>
<body class="d-flex flex-column align-items-center" style="background-color: #508bfc;width: 100%;height: 630px">
<h1 id="title" class="d-flex m-4">Profil de ${userConnected.firstName} ${userConnected.lastName}</h1>
<div class="h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
        <div class="card shadow-2-strong d-flex" style="border-radius: 1rem; height: 100%">
            <div id="content" class="col justify-content-center p-5 text-center" style="max-width: max-content">
                <div class="input-group mb-3">
                    <span class="input-group-text">Prénom</span>
                    <input disabled readonly type="text" class="form-control" value="${userConnected.firstName}" style="background-color: white;">
                </div>
                <div class="input-group mb-3">
                    <span class="input-group-text">Nom</span>
                    <input disabled readonly type="text" class="form-control" value="${userConnected.lastName}" style="background-color: white;">
                </div>
                <div class="input-group mb-3">
                    <span class="input-group-text">Téléphone</span>
                    <input disabled readonly type="text" class="form-control" value="${userConnected.phone}" style="background-color: white;">
                </div>
                <div class="input-group mb-3">
                    <span class="input-group-text">Mail</span>
                    <input disabled readonly type="text" class="form-control" value="${userConnected.mail}" style="background-color: white;">
                </div>
                <div class="input-group mb-3">
                    <span class="input-group-text">Maître d'apprentissage</span>
                    <input disabled readonly type="text" class="form-control" value="à faire" style="background-color: white;">
                </div>
                <div class="input-group mb-3">
                    <span class="input-group-text">Entreprise</span>
                    <input disabled readonly type="text" class="form-control" value="" style="background-color: white;">
                </div>
                <div class="input-group mb-3">
                    <span class="input-group-text">Programme</span>
                    <input disabled readonly type="text" class="form-control" value="" style="background-color: white;">
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
