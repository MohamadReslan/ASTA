package fr.efrei2023.ASTA.model.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "user", schema = "asta", catalog = "")
public class UserEntity {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id")
    private short id;
    @Basic
    @Column(name = "last_name")
    private String lastName;
    @Basic
    @Column(name = "first_name")
    private String firstName;
    @Basic
    @Column(name = "mdp")
    private String mdp;
    @Basic
    @Column(name = "phone")
    private String phone;
    @Basic
    @Column(name = "mail")
    private String mail;
    @Basic
    @Column(name = "type")
    private String type;
    @Basic
    @Column(name = "is_active")
    private boolean isActive;
    @Basic
    @Column(name = "id_1")
    private int id1;
    @Basic
    @Column(name = "id_2")
    private int id2;

    public short getId() {
        return id;
    }

    public void setId(short id) {
        this.id = id;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }
    public String getMdp() {
        return mdp;
    }

    public void setMdp(String mdp) {
        this.mdp = mdp;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
    public boolean getIsActive() {
        return isActive;
    }

    public void setIsActive(boolean isActive) {
        this.isActive = isActive;
    }

    public int getId1() {
        return id1;
    }

    public void setId1(int id1) {
        this.id1 = id1;
    }

    public int getId2() {
        return id2;
    }

    public void setId2(int id2) {
        this.id2 = id2;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        UserEntity that = (UserEntity) o;

        if (id != that.id) return false;
        if (id1 != that.id1) return false;
        if (id2 != that.id2) return false;
        if (lastName != null ? !lastName.equals(that.lastName) : that.lastName != null) return false;
        if (firstName != null ? !firstName.equals(that.firstName) : that.firstName != null) return false;
        if (phone != null ? !phone.equals(that.phone) : that.phone != null) return false;
        if (mail != null ? !mail.equals(that.mail) : that.mail != null) return false;
        if (type != null ? !type.equals(that.type) : that.type != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) id;
        result = 31 * result + (lastName != null ? lastName.hashCode() : 0);
        result = 31 * result + (firstName != null ? firstName.hashCode() : 0);
        result = 31 * result + (phone != null ? phone.hashCode() : 0);
        result = 31 * result + (mail != null ? mail.hashCode() : 0);
        result = 31 * result + (type != null ? type.hashCode() : 0);
        result = 31 * result + id1;
        result = 31 * result + id2;
        return result;
    }
}
