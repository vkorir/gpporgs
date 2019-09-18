package edu.berkeley.gpporgs.model;


import lombok.*;

import javax.persistence.*;

@Entity
@Getter
@Setter
@NoArgsConstructor
@Table(name = "reviews")
public class Review {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private @NonNull Long organizationId;
    private @NonNull Long addressId;
    private @NonNull String region;
    private @NonNull String languageIds;
    @Transient
    private @NonNull Iterable<Language> languages;
    private String difficulties;
    private String sectorIds;
    @Transient
    private @NonNull Iterable<Sector> sectors;
    private Integer stipend;
    private Integer cost;
    private String duration;
    private @NonNull String workDone;
    private String typicalDay;
    private @NonNull String evaluation;
    private String other;
    private Integer safety;
    private Integer responsiveness;
    private @NonNull Boolean anonymous;
    private @NonNull Long reviewerId;
}
