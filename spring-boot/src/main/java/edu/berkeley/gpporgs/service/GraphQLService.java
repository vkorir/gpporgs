package edu.berkeley.gpporgs.service;

import edu.berkeley.gpporgs.model.Review;
import edu.berkeley.gpporgs.model.User;
import edu.berkeley.gpporgs.repository.LanguageRepository;
import edu.berkeley.gpporgs.repository.ReviewRepository;
import edu.berkeley.gpporgs.repository.UserRepository;
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
public class GraphQLService {
    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ReviewRepository reviewRepository;

    @Autowired
    private LanguageRepository languageRepository;

    @GraphQLQuery(name = "getUser")
    public Optional<User> userByCalNetId(@GraphQLArgument(name = "calNetId") String calNetId) {
        return userRepository.findById(calNetId);
    }

    @GraphQLQuery(name = "getUsers")
    public List<User> getUsers() {
        return (List<User>) userRepository.findAll();
    }

    @GraphQLMutation(name = "createUser")
    public User saveUser(@GraphQLArgument(name = "user") User user) {
        return userRepository.save(user);
    }

    @GraphQLQuery(name = "getReviews")
    public List<Review> getReviews() {
        return (List<Review>) reviewRepository.findAll();
    }

    @GraphQLMutation(name = "createReview")
    public Review addReview(Review review) {
        return reviewRepository.save(review);
    }

    @GraphQLMutation(name = "updateReview")
    public Optional<Review> updateReview(@GraphQLArgument(name = "reviewId") Long reviewId) {
        Optional<Review> review = reviewRepository.findById(reviewId);
//        if (review.isPresent()) {
//            review.get().
//        }
        return review;
    }
}
