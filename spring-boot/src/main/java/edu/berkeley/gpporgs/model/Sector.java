package edu.berkeley.gpporgs.model;

import io.leangen.graphql.annotations.GraphQLQuery;
import lombok.Getter;

import javax.persistence.*;

@Entity
@Getter
@Table(name = "sectors")
public class Sector {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @GraphQLQuery(name = "name")
    private String name;
}
