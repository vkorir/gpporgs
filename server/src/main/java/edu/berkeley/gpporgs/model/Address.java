package edu.berkeley.gpporgs.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * @author Victor Korir
 */

@Entity
@Getter
@Setter
@NoArgsConstructor
@Table(name = "addresses")
public class Address {
    private @Id @GeneratedValue(strategy = GenerationType.IDENTITY) Long id;
    private String street;
    private String city;
    private String state;
    private String zip;
    private String country;
}
