package edu.berkeley.gpporgs.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.Lob;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

/**
 * @author Victor Korir
 * @Date 10/01/2020
 */

@Entity
@Getter
@Setter
@NoArgsConstructor
@Table(name = "reviews")
public class Review implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String created;

    @JsonIgnore
    @ManyToOne(fetch = FetchType.LAZY)
    private Organization organization;

    @OneToOne(cascade = CascadeType.ALL)
    private Address address;

    @OneToOne
    private Region region;

    @ManyToMany(cascade = CascadeType.MERGE)
    @JoinTable(
        name = "rev_languages",
        joinColumns = @JoinColumn(name = "rev_id"),
        inverseJoinColumns = @JoinColumn(name = "lan_code")
    )
    private List<Language> languages;

    @Lob
    private String difficulties;

    @ManyToMany(cascade = CascadeType.MERGE)
    @JoinTable(
        name = "rev_sectors",
        joinColumns = @JoinColumn(name = "rev_id"),
        inverseJoinColumns = @JoinColumn(name = "sec_id")
    )
    private List<Sector> sectors;

    private String sectorOther;

    private Integer stipend;

    private Integer cost = 0;

    private String duration;

    @Lob
    private String workDone;

    @Lob
    private String typicalDay;

    @Lob
    private String evaluation;

    @Lob
    private String other;

    private Integer safety = 1;

    private Integer responsiveness = 1;

    private Boolean anonymous = true;

    @ManyToOne
    private User reviewer;
}
