package edu.berkeley.gpporgs.model;

import lombok.*;

import javax.persistence.*;

@Entity
@Getter
@Setter
@ToString
@EqualsAndHashCode
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "organizations")
public class Organization {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
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
    private Iterable<Affiliation> affiliations;
    private @NonNull Long typeId;
    @Transient
    private @NonNull Type type;
    private @NonNull String region;
    private String sectorIds;
    @Transient
    private Iterable<Sector> sectors;
    private Boolean approved;
    @Transient
    private Iterable<Contact> contacts;
}
