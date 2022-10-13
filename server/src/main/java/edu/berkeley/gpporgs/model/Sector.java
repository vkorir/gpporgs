package edu.berkeley.gpporgs.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.Setter;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.Id;
import javax.persistence.ManyToMany;

/**
 * @author Victor Korir
 * @Date 10/01/2020
 */

@Entity
@Getter
@Setter
@NoArgsConstructor
@Table(name = "sectors")
public class Sector implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NonNull
    private String value;

    @JsonIgnore
    @ManyToMany(mappedBy = "sectors")
    private List<Organization> organizations;
    
    @JsonIgnore
    @ManyToMany(mappedBy = "sectors")
    private List<Review> reviews;
}
