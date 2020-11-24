package edu.berkeley.gpporgs.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.Setter;

import javax.persistence.*;

/**
 * @author Victor Korir
 */

@Entity
@Getter
@Setter
@NoArgsConstructor
@Table(name = "users")
public class User {
    private @Id @GeneratedValue(strategy = GenerationType.IDENTITY) Long id;
    private @NonNull String email;
    private String firstName;
    private String lastName;
    private Boolean isAdmin = false;
    private Boolean hasAccess;
    private String created;
    private Integer numberOfLogin = 0;
    private String lastLogin;
}
