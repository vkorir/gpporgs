package edu.berkeley.gpporgs.model;

import lombok.*;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Id;

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
    private String calNetId;
    private @NonNull String firstName;
    private String lastName;
    private @NonNull Boolean isAdmin;
}
