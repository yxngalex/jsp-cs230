package com.example.app.database.entity;

import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.persistence.*;
import javax.xml.bind.annotation.XmlRootElement;
import java.io.Serializable;
import java.util.List;

@Entity
@Table(name = "job")
@Data
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
@XmlRootElement
@NamedQueries({
        @NamedQuery(name = "Job.findAll", query = "SELECT j FROM Job j")
        , @NamedQuery(name = "Job.findByJobId", query = "SELECT j FROM Job j WHERE j.id = :idJob")
        , @NamedQuery(name = "Job.findByName", query = "SELECT j FROM Job j WHERE j.name = :name")
        , @NamedQuery(name = "Job.findByDescription", query = "SELECT j FROM Job j WHERE j.description = :description")})
public class Job implements Serializable {
    @Id
    @EqualsAndHashCode.Include
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "job_id")
    private Integer idJob;

    @JoinColumn(name = "firm_id", referencedColumnName = "firm_id")
    @ManyToOne(optional = false, fetch = FetchType.EAGER)
    private Firm firmId;

    @Column(name = "name")
    private String name;

    @Column(name = "description")
    private String description;

    @Override
    public String toString() {
        return name + ", " + description;
    }
}
