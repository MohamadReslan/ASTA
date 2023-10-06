package fr.efrei2023.ASTA.model;

import jakarta.persistence.*;

import java.sql.Date;

@Entity
@Table(name = "program", schema = "asta", catalog = "")
public class ProgramEntity {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id")
    private int id;
    @Basic
    @Column(name = "label")
    private String label;
    @Basic
    @Column(name = "diploma_year")
    private Date diplomaYear;
    @Basic
    @Column(name = "major")
    private String major;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }

    public Date getDiplomaYear() {
        return diplomaYear;
    }

    public void setDiplomaYear(Date diplomaYear) {
        this.diplomaYear = diplomaYear;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ProgramEntity that = (ProgramEntity) o;

        if (id != that.id) return false;
        if (label != null ? !label.equals(that.label) : that.label != null) return false;
        if (diplomaYear != null ? !diplomaYear.equals(that.diplomaYear) : that.diplomaYear != null) return false;
        if (major != null ? !major.equals(that.major) : that.major != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (label != null ? label.hashCode() : 0);
        result = 31 * result + (diplomaYear != null ? diplomaYear.hashCode() : 0);
        result = 31 * result + (major != null ? major.hashCode() : 0);
        return result;
    }
}
