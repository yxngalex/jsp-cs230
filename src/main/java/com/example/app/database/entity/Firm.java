package com.example.app.database.entity;

import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "firm")
@Data
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
public class Firm implements Serializable {
    @Id
    @EqualsAndHashCode.Include
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "firm_id")
    private Long idFirm;

    @Column(name = "name")
    private String name;

    @Column(name = "address")
    private String address;

    @Override
    public String toString() {
        return name + ", " + address;
    }
}
