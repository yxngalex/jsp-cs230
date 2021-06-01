package com.example.app.database.entity;

import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "role")
@Data
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
public class Role implements Serializable {
    @Id
    @EqualsAndHashCode.Include
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "role_id")
    private Integer idRole;

    @Column(name = "role")
    private String role;

    @Override
    public String toString() {
        return role;
    }

}
