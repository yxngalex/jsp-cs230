package com.example.app.database.entity;

import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "job")
@Data
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
public class Job implements Serializable {
    @Id
    @EqualsAndHashCode.Include
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "job_id")
    private Long idJob;

    @ManyToOne
    @JoinTable(name = "firm", joinColumns = @JoinColumn(name = "firm_id"), inverseJoinColumns = @JoinColumn(name = "firm_id"))
    private Firm firm;

    @Column(name = "name")
    private String name;

    @Column(name = "description")
    private String description;

    @Override
    public String toString() {
        return name + ", " + description;
    }
}
