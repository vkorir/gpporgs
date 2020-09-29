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

@Entity
@Getter
@Setter
@NoArgsConstructor
@Table(name = "reviews")
public class Review {
    private @Id @GeneratedValue(strategy = GenerationType.IDENTITY) Long id;
    private String creationTime;
    private Long organizationId;
    private @NonNull Long addressId;
    @Transient
    private @NonNull Address address;
    private @NonNull Long region;
    private @NonNull String languageCodes;
    @Transient
    private @NonNull Iterable<String> languages;
    private String difficulties;
    private String sectorIds;
    @Transient
    private @NonNull Iterable<Long> sectors;
    private String sectorOther;
    private Integer stipend;
    private Integer cost = 0;
    private String duration;
    private @NonNull String workDone;
    private String typicalDay;
    private @NonNull String evaluation;
    private String other;
    private Integer safety = 1;
    private Integer responsiveness = 1;
    private @NonNull Boolean anonymous;
    private @NonNull Long reviewerId;
    @Transient
    private User reviewer;
}
