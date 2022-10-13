package edu.berkeley.gpporgs.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.Setter;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.Lob;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

/**
 * @author Victor Korir
 * @Date 10/01/2020
 */

@Entity
@Getter
@Setter
@NoArgsConstructor
@Table(name = "organizations")
public class Organization implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NonNull
    private String name;

    @Lob
    private String description;

    @OneToOne(cascade = CascadeType.ALL)
    private Address address;

    private String phone;

    private String email;

    private String website;

    @ManyToMany(cascade = CascadeType.MERGE)
    @JoinTable(
        name = "org_affiliations",
        joinColumns = @JoinColumn(name = "org_id"),
        inverseJoinColumns = @JoinColumn(name = "aff_id")
    )
    private List<Affiliation> affiliations;

    @OneToOne
    private Type type;

    private String typeOther;

    @OneToOne
    private Region region;

    @ManyToMany(cascade = CascadeType.MERGE)
    @JoinTable(
        name = "org_sectors",
        joinColumns = @JoinColumn(name = "org_id"),
        inverseJoinColumns = @JoinColumn(name = "sec_id")
    )
    private List<Sector> sectors;

    private String sectorOther;

    private Boolean approved = false;

    @OneToMany(cascade = CascadeType.ALL)
    @JoinTable(
        name = "org_contacts",
        joinColumns = @JoinColumn(name = "org_id"),
        inverseJoinColumns = @JoinColumn(name = "con_id")
    )
    private List<Contact> contacts;

    private String created;

    @OneToMany(mappedBy = "organization", cascade = CascadeType.REMOVE)
    private List<Review> reviews;
}
