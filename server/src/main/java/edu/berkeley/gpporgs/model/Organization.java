package edu.berkeley.gpporgs.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.Setter;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 * @author Victor Korir
 */

@Entity
@Getter
@Setter
@NoArgsConstructor
@Table(name = "organizations")
public class Organization {
    private @Id @GeneratedValue(strategy = GenerationType.IDENTITY) Long id;
    private @NonNull String name;
    private String description;
    private @NonNull Long addressId;
    @Transient
    private Address address;
    private String phone;
    private String email;
    private String website;
    private String affiliationIds;
    @Transient
    private Iterable<Long> affiliations;
    private Long type;
    private String typeOther;
    private Long region;
    private String sectorIds;
    @Transient
    private Iterable<Long> sectors;
    private String sectorOther;
    private Boolean approved;
    @Transient
    private Iterable<Contact> contacts;
    private String created;
}
