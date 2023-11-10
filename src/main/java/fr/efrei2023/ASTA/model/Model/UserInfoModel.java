package fr.efrei2023.ASTA.model.Model;

import fr.efrei2023.ASTA.model.entity.MissionEntity;
import fr.efrei2023.ASTA.model.entity.UserEntity;

public class UserInfoModel {
    private int id;
    private String lastName;
    private String firstName;
    private String phone;
    private String mail;
    private String managerName;
    private String companyName;
    private String programName;
    private MissionEntity mission;

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

    public String getFirstName() {
        return firstName;
    }

    public String getPhone() {
        return phone;
    }

    public String getMail() {
        return mail;
    }

    public String getManagerName() {
        return managerName;
    }

    public String getCompanyName() {
        return companyName;
    }

    public String getProgramName() {
        return programName;
    }

    public MissionEntity getMission() {
        return mission;
    }
}