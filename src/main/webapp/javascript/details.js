fetch('/ASTA/apprentices')
    .then(response => response.json())
    .then(data => {
        console.log(data);
        let divMission = "";
        if (data.mission !== null) {
            divMission =
                "<div class='input-group'>" +
                "<span class='input-group-text'>Mission</span>" +
                "<input disabled readonly type='text' style='background-color: white;' class='form-control' placeholder='" + data.mission.job + "'/>" +
                "<input disabled readonly type='text' class='form-control' placeholder='" + data.mission.comment + "' style='background-color: white;width: 50%'/>" +"</div>";
        }

        const divContent = styleInput("Prénom", data.firstName) + styleInput("Nom", data.lastName) +
            styleInput("Téléphone", data.phone) + styleInput("Mail", data.mail) +
            styleInput("Maitre d'apprentissage", data.managerName) + styleInput("Entreprise", data.companyName) +
            styleInput("Programme", data.programName) + divMission;

        document.getElementById("title").innerHTML = "Détails de : " + data.firstName + " " + data.lastName;
        document.getElementById("content").innerHTML = divContent;
    });

function styleInput(name, value) {
    return "<div class='input-group mb-3' style='width: 100%'>" +
        "<span class='input-group-text' style='width: 50%'>" + name + "</span>" +
        "<input disabled readonly type='text' class='form-control' placeholder='" + value + "' style='background-color: white;'/>" +
        "</div>";
}