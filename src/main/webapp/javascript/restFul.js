fetch('/ASTA/apprentices')
    .then(response => response.json())
    .then(data => {
        console.log("data", data);

        document.getElementById("title").innerHTML = "Détails de : " + data.firstName + " " + data.lastName;
        document.getElementById("content").innerHTML = "<span class='row d-flex'>Prénom : " + data.firstName + "</span></br><span class='row d-flex'>Nom : " + data.lastName + "</span></br><span class='row d-flex'>Téléphone : " + data.phone + "</span></br><span class='row d-flex'>Mail : " + data.mail + "</span></br><span class='row d-flex'>Maitre d'apprentissage : " + data.managerName + "</span></br><span class='row d-flex'>Entreprise : " + data.companyName + "</span></br><span class='row d-flex'>Programme : " + data.programName + "</span>";
    })