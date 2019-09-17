package edu.berkeley.gpporgs.model;

import io.leangen.graphql.annotations.GraphQLQuery;
import lombok.*;

import javax.persistence.*;

/**
 * @author Victor Korir
 */

@Entity
@Getter
@Setter
@ToString
@EqualsAndHashCode
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "languages")
public class Language {
    @Id
    private String code;

    @GraphQLQuery(name = "name")
    private String name;
}
