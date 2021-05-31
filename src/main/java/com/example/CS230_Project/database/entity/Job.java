package com.example.CS230_Project.database.entity;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "job")
public class Job implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "job_id")
    private Long idJob;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinTable(name = "firm", joinColumns = @JoinColumn(name = "firm_id"), inverseJoinColumns = @JoinColumn(name = "firm_id"))
    private Firm firm;

    @Column(name = "name")
    private String name;

    @Column(name = "description")
    private String description;

    public Job() {
    }

    public Long getIdJob() {
        return idJob;
    }

    public void setIdJob(Long idJob) {
        this.idJob = idJob;
    }

    public Firm getFirm() {
        return firm;
    }

    public void setFirm(Firm firm) {
        this.firm = firm;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "Job{" +
                "idJob=" + idJob +
                ", firm=" + firm +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                '}';
    }
}
