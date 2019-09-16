package com.gpporgs.model;

import io.leangen.graphql.annotations.GraphQLQuery;
import lombok.*;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Id;

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
@Table(name = "users")
public class User {
    @Id
    @GraphQLQuery(name = "calNetId")
    private @NonNull String calNetId;

    @GraphQLQuery(name = "firstName")
    private @NonNull String firstName;

    @GraphQLQuery(name = "lastName")
    private String lastName;

    @GraphQLQuery(name = "isAdmin")
    private @NonNull Boolean isAdmin;
}
