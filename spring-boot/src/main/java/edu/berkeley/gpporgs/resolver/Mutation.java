package edu.berkeley.gpporgs.resolver;

import com.coxautodev.graphql.tools.GraphQLMutationResolver;
import edu.berkeley.gpporgs.model.Review;
import edu.berkeley.gpporgs.model.User;
import edu.berkeley.gpporgs.repository.ReviewRepository;
import edu.berkeley.gpporgs.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Optional;

public class Mutation implements GraphQLMutationResolver {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ReviewRepository reviewRepository;

    public User createUser(User user) {
        return userRepository.save(user);
    }

    public User updateUser(String calNetId, User user) {
        Optional<User> oldUser = userRepository.findById(calNetId);
        if (oldUser.isPresent()) {
            user.setCalNetId(calNetId);
            userRepository.save(user);
            return user;
        }
        return null;
    }

    public Review createReview(Review review) {
        return reviewRepository.save(review);
    }

    public Review updateReview(Long reviewId, Review review) {
        Optional<Review> oldReview = reviewRepository.findById(reviewId);
        if (oldReview.isPresent()) {
            review.setId(reviewId);
            reviewRepository.save(review);
            return review;
        }
        return null;
    }
}
