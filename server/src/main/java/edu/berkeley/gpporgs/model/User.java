package edu.berkeley.gpporgs.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.Setter;

import java.io.Serializable;
import java.util.List;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonIgnore;

/**
 * @author Victor Korir
 * @Date 10/01/2020
 */

@Entity
@Getter
@Setter
@NoArgsConstructor
@Table(name = "users")
public class User implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NonNull
    @Column(unique = true)
    private String email;

    private String firstName;

    private String lastName;

    private Boolean isAdmin = false;

    private Boolean hasAccess = false;

    private String created;

    private Integer numberOfLogin = 0;

    private String lastLogin;
    
    @JsonIgnore
    @OneToMany(mappedBy = "reviewer")
    private List<Review> reviews;
}
