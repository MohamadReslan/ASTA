fetch('/ASTA/apprentices')
    .then(response => response.json())
    .then(data => {
        const divContent = "<span class='row d-flex'>Prénom : " + data.firstName + "</span>" +
            "</br><span class='row d-flex'>Nom : " + data.lastName + "</span></br><span class='row d-flex'>Téléphone : " +
            data.phone + "</span></br><span class='row d-flex'>Mail : " +
            data.mail + "</span></br><span class='row d-flex'>Entreprise : " +
            data.companyName + "</span></br><span class='row d-flex'>Programme : " + data.programName + "</span>";

        document.getElementById("title").innerHTML = "Détails de : " + data.firstName + " " + data.lastName;
        document.getElementById("content").innerHTML = divContent;
    })