package edu.berkeley.gpporgs.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * @author Victor Korir
 * @Date 10/01/2020
 */

@Entity
@Getter
@Setter
@NoArgsConstructor
@Table(name = "contacts")
public class Contact implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;

    private String role;

    private String email;

    private String phone;
}
