package com.gpporgs.service;

import com.gpporgs.model.User;
import com.gpporgs.repository.UserRepository;
import io.leangen.graphql.annotations.GraphQLArgument;
import io.leangen.graphql.annotations.GraphQLMutation;
import io.leangen.graphql.annotations.GraphQLQuery;
import io.leangen.graphql.spqr.spring.annotations.GraphQLApi;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@GraphQLApi
public class UserService {

    @Autowired
    private UserRepository userRepository;

    @GraphQLQuery(name = "user")
    public Optional<User> userByCalNetId(@GraphQLArgument(name = "calNetId") String calNetId) {
        return userRepository.findById(calNetId);
    }

    @GraphQLQuery(name = "users")
    public List<User> getUsers() {
        return (List<User>) userRepository.findAll();
    }

    @GraphQLMutation(name = "saveUser")
    public User saveUser(@GraphQLArgument(name = "user") User user) {
        return userRepository.save(user);
    }
}
