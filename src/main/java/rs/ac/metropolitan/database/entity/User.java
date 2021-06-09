package rs.ac.metropolitan.database.entity;

import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.persistence.*;
import javax.xml.bind.annotation.XmlRootElement;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "user")
@Data
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
@XmlRootElement
@NamedQueries({
        @NamedQuery(name = "User.findAll", query = "SELECT u FROM User u")
        , @NamedQuery(name = "User.findByUsername", query = "SELECT u FROM User u WHERE u.username = :username")
        , @NamedQuery(name = "User.findByPassword", query = "SELECT u FROM User u WHERE u.password = :password")
        , @NamedQuery(name = "User.findByEmail", query = "SELECT u FROM User u WHERE u.email = :email")
        , @NamedQuery(name = "User.findByUserId", query = "SELECT u FROM User u WHERE u.id = :idUser")})
public class User implements Serializable {

    @Id
    @EqualsAndHashCode.Include
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "user_id")
    private Integer idUser;

    @Column(name = "username")
    private String username;

    @Column(name = "password")
    private String password;

    @Column(name = "email")
    private String email;

    @ManyToOne(optional = false, fetch = FetchType.EAGER)
    @JoinColumn(name = "role_id", referencedColumnName = "role_id")
    private Role role;

    @ManyToMany
    @JoinTable(name = "user_job", joinColumns = @JoinColumn(name = "user_id"), inverseJoinColumns = @JoinColumn(name = "job_id"))
    private List<Job> jobs = new ArrayList<>();

    @Override
    public String toString() {
        return username;
    }

}
