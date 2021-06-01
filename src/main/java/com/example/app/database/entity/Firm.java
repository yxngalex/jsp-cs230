package com.example.app.database.entity;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "firm")
public class Firm implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "firm_id")
    private Long idFirm;

    @Column(name = "name")
    private String name;

    @Column(name = "address")
    private String address;

    public Firm() {
    }

    public Long getIdFirm() {
        return idFirm;
    }

    public void setIdFirm(Long idFirm) {
        this.idFirm = idFirm;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Override
    public String toString() {
        return "Firm{" +
                "idFirm=" + idFirm +
                ", name='" + name + '\'' +
                ", address='" + address + '\'' +
                '}';
    }
}
