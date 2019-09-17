package edu.berkeley.gpporgs.model;

import edu.berkeley.gpporgs.repository.LanguageRepository;
import io.leangen.graphql.annotations.GraphQLQuery;
import lombok.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.Set;

@Entity
@Getter
@Setter
@ToString
@EqualsAndHashCode
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "reviews")
public class Review {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

//    @ManyToOne(targetEntity = Organization.class, fetch = FetchType.LAZY)
//    @JoinColumn(name = "organization_id", nullable = false)
//    @GraphQLQuery(name = "organization")
//    private Organization organization;
//
//    @OneToOne(targetEntity = Address.class, fetch = FetchType.LAZY)
//    @JoinColumn(name = "address_id", nullable = false)
//    @GraphQLQuery(name = "address")
//    private Address address;
//
//    @GraphQLQuery(name = "region")
//    private String region;

    private String languages;

//    @GraphQLQuery(name = "difficulties")
//    private String difficulties;

//    @OneToMany
//    @JoinColumn(name = "sectors")
//    @GraphQLQuery(name = "sectors")
//    private Set<Sector> sectors;
//
//    private Integer stipend;
//
//    private Integer cost;
//
//    private String duration;
//
//    private String workDone;
//
//    private String typicalDay;
//
//    private String evaluation;
//
//    private String other;
//
//    private Integer safety;
//
//    private Integer responsiveness;
//
//    private Boolean anonymous;
//
//    private Long reviewerId;

    @Value("${mysql_data_delimiter}")
    private String dataDelimiter;

    @Autowired
    private LanguageRepository languageRepository;

    @GraphQLQuery(name = "languages")
    public List<Language> getLanguages() {
        List<Language> result = new ArrayList<>();
        for (String code: languages.split(dataDelimiter)) {
            Optional<Language> language = languageRepository.findById(code);
            language.ifPresent(result::add);
        }
        return result;
    }
}
