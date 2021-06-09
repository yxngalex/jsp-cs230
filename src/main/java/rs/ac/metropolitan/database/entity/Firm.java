package rs.ac.metropolitan.database.entity;

import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.persistence.*;
import javax.xml.bind.annotation.XmlRootElement;
import java.io.Serializable;

@Entity
@Table(name = "firm")
@Data
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
@XmlRootElement
@NamedQueries({
        @NamedQuery(name = "Firm.findAll", query = "SELECT f FROM Firm f")
        , @NamedQuery(name = "Firm.findByFirmId", query = "SELECT f FROM Firm f WHERE f.idFirm = :idFirm")
        , @NamedQuery(name = "Firm.findByName", query = "SELECT f FROM Firm f WHERE f.name = :name")
        , @NamedQuery(name = "Firm.findByAddress", query = "SELECT f FROM Firm f WHERE f.address = :address")})
public class Firm implements Serializable {
    @Id
    @EqualsAndHashCode.Include
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "firm_id")
    private Integer idFirm;

    @Column(name = "name")
    private String name;

    @Column(name = "address")
    private String address;

    @Override
    public String toString() {
        return name + ", " + address;
    }
}
