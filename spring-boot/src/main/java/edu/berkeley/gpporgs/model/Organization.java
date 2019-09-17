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
    private @NonNull Long id;

    private @NonNull Long organizationId;

    private @NonNull Long addressId;

    private String phone;

    private String email;

    private String website;

    private String[] affiliations;

    private String type;

    private String region;

    private String[] sectors;

    private Boolean approved;

}
