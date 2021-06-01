package com.example.app.database.entity;

import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.persistence.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "user")
@Data
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
public class User implements Serializable {

    @Id
    @EqualsAndHashCode.Include
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "user_id")
    private Long idUser;

    @Column(name = "username")
    private String username;

    @Column(name = "password")
    private String password;

    @Column(name = "email")
    private String email;

    @ManyToOne
    @JoinColumn(name = "role_id")
    private Role role;

    @ManyToMany
    @JoinTable(name = "user_job", joinColumns = @JoinColumn(name = "user_id"), inverseJoinColumns = @JoinColumn(name = "job_id"))
    private List<Job> jobs = new ArrayList<>();

    @Override
    public String toString() {
        return username;
    }

}
