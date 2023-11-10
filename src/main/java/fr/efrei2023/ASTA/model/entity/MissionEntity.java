package fr.efrei2023.ASTA.model.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "mission", schema = "astadb", catalog = "")
public class MissionEntity {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id")
    private int id;
    @Basic
    @Column(name = "keyword")
    private String keyword;
    @Basic
    @Column(name = "job")
    private String job;
    @Basic
    @Column(name = "comment")
    private String comment;
    @Basic
    @Column(name = "userId")
    private short userId;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public short getId1() {
        return userId;
    }

    public void setId1(short userId) {
        this.userId = userId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        MissionEntity that = (MissionEntity) o;

        if (id != that.id) return false;
        if (userId != that.userId) return false;
        if (keyword != null ? !keyword.equals(that.keyword) : that.keyword != null) return false;
        if (job != null ? !job.equals(that.job) : that.job != null) return false;
        if (comment != null ? !comment.equals(that.comment) : that.comment != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (keyword != null ? keyword.hashCode() : 0);
        result = 31 * result + (job != null ? job.hashCode() : 0);
        result = 31 * result + (comment != null ? comment.hashCode() : 0);
        result = 31 * result + (int) userId;
        return result;
    }
}
