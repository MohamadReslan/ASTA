package fr.efrei2023.ASTA.model.bean;

public class User {

    private String loginSaisi;
    private String motDePasseSaisi;

    // New
    private int id; //coucou maximussss
    private String lastName;
    private String firstName;
    private String phone;
    private String mail;
    private String type;
    private int companyId;
    private int programId;

    public String getLoginSaisi() {
        return loginSaisi;
    }

    public void setLoginSaisi(String loginSaisi) {
        this.loginSaisi = loginSaisi;
    }

    public String getMotDePasseSaisi() {
        return motDePasseSaisi;
    }

    public void setMotDePasseSaisi(String motDePasseSaisi) {
        this.motDePasseSaisi = motDePasseSaisi;
    }

}
