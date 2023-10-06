package fr.efrei2023.ASTA.model;

import jakarta.persistence.*;

import java.math.BigDecimal;
import java.sql.Date;

@Entity
@Table(name = "evaluation", schema = "asta", catalog = "")
public class EvaluationEntity {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id")
    private int id;
    @Basic
    @Column(name = "grade")
    private BigDecimal grade;
    @Basic
    @Column(name = "type")
    private String type;
    @Basic
    @Column(name = "date_")
    private Date date;
    @Basic
    @Column(name = "comment")
    private String comment;
    @Basic
    @Column(name = "theme")
    private String theme;
    @Basic
    @Column(name = "id_1")
    private short id1;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public BigDecimal getGrade() {
        return grade;
    }

    public void setGrade(BigDecimal grade) {
        this.grade = grade;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getTheme() {
        return theme;
    }

    public void setTheme(String theme) {
        this.theme = theme;
    }

    public short getId1() {
        return id1;
    }

    public void setId1(short id1) {
        this.id1 = id1;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        EvaluationEntity that = (EvaluationEntity) o;

        if (id != that.id) return false;
        if (id1 != that.id1) return false;
        if (grade != null ? !grade.equals(that.grade) : that.grade != null) return false;
        if (type != null ? !type.equals(that.type) : that.type != null) return false;
        if (date != null ? !date.equals(that.date) : that.date != null) return false;
        if (comment != null ? !comment.equals(that.comment) : that.comment != null) return false;
        if (theme != null ? !theme.equals(that.theme) : that.theme != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (grade != null ? grade.hashCode() : 0);
        result = 31 * result + (type != null ? type.hashCode() : 0);
        result = 31 * result + (date != null ? date.hashCode() : 0);
        result = 31 * result + (comment != null ? comment.hashCode() : 0);
        result = 31 * result + (theme != null ? theme.hashCode() : 0);
        result = 31 * result + (int) id1;
        return result;
    }
}
