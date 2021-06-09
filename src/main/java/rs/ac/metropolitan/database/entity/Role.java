package rs.ac.metropolitan.database.entity;

import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.persistence.*;
import javax.xml.bind.annotation.XmlRootElement;
import java.io.Serializable;
import java.util.List;

@Entity
@Table(name = "role")
@Data
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
@XmlRootElement
@NamedQueries({
        @NamedQuery(name = "Role.findAll", query = "SELECT r FROM Role r")
        , @NamedQuery(name = "Role.findByRoleId", query = "SELECT r FROM Role r WHERE r.id = :idRole")
        , @NamedQuery(name = "Role.findByRole", query = "SELECT r FROM Role r WHERE r.role = :role")})
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
