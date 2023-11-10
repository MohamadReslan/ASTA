package fr.efrei2023.ASTA.model.Model;

import fr.efrei2023.ASTA.model.entity.MissionEntity;
import fr.efrei2023.ASTA.model.entity.UserEntity;

public class UserInfoModel {
    public int id;
    public String lastName;
    public String firstName;
    public String phone;
    public String mail;
    public String managerName;
    public String companyName;
    public String programName;
    public MissionEntity mission;

    public UserInfoModel(UserEntity user, String companyName, String programName, MissionEntity mission) {
        this.id = user.getId();
        this.lastName = user.getLastName();
        this.firstName = user.getFirstName();
        this.phone = user.getPhone();
        this.mail = user.getMail();
        this.managerName = user.getManagerName();
        this.companyName = companyName;
        this.programName = programName;
        this.mission = mission;
    }

    public int getId() {
        return id;
    }

    public String getLastName() {
        return lastName;
    }

    public String getPhone() {
        return phone;
    }

    public String getMail() {
        return mail;
    }

}

