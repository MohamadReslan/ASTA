package fr.efrei2023.ASTA.model.Model;

public class UserInfoModel {
    public int id;
    public String lastName;
    public String firstName;
    public String phone;
    public String mail;
    public String companyName;
    public String programName;

    public UserInfoModel(int id, String lastName, String firstName, String phone, String mail, String companyName, String programName) {
        this.id = id;
        this.lastName = lastName;
        this.firstName = firstName;
        this.phone = phone;
        this.mail = mail;
        this.companyName = companyName;
        this.programName = programName;
    }
}
