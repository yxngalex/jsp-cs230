package rs.ac.metropolitan.database.entity;

import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.persistence.*;
import javax.xml.bind.annotation.XmlRootElement;
import java.io.Serializable;

@Entity
@Table(name = "user_job")
@Data
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
@XmlRootElement
@NamedQueries({
        @NamedQuery(name = "UserJob.findAll", query = "SELECT u FROM UserJob u")
        , @NamedQuery(name = "UserJob.findByUserJobId", query = "SELECT u FROM UserJob u WHERE u.userJobId = :userJobId")})
public class UserJob implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic
    @Column(name = "user_job_id")
    private Integer userJobId;

    @JoinColumn(name = "user_id", referencedColumnName = "user_id")
    @ManyToOne(optional = false, fetch = FetchType.EAGER)
    private User userId;

    @JoinColumn(name = "job_id", referencedColumnName = "job_id")
    @ManyToOne(optional = false, fetch = FetchType.EAGER)
    private Job jobId;
}
