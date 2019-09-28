package edu.berkeley.gpporgs.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.Setter;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * @author Victor Korir
 */

@Entity
@Getter
@Setter
@NoArgsConstructor
@Table(name = "users")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @Column(unique = true)
    private @NonNull String username;
    private @NonNull String firstName;
    private String lastName;
    private @NonNull Boolean isAdmin;
    private @NonNull Timestamp creationTime;
    private @NonNull Integer numberOfLogin;
    private @NonNull Timestamp lastLogin;

    public static String getCalNetId(String email) {
        return email.substring(0, email.indexOf('@'));
    }
}
