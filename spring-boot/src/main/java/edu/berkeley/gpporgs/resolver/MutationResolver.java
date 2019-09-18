package edu.berkeley.gpporgs.resolver;

import com.coxautodev.graphql.tools.GraphQLMutationResolver;
import edu.berkeley.gpporgs.model.Language;
import edu.berkeley.gpporgs.model.Review;
import edu.berkeley.gpporgs.model.Sector;
import edu.berkeley.gpporgs.model.User;
import edu.berkeley.gpporgs.repository.LanguageRepository;
import edu.berkeley.gpporgs.repository.ReviewRepository;
import edu.berkeley.gpporgs.repository.SectorRepository;
import edu.berkeley.gpporgs.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Component
public class MutationResolver implements GraphQLMutationResolver {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ReviewRepository reviewRepository;

    @Autowired
    private LanguageRepository languageRepository;

    @Autowired
    private SectorRepository sectorRepository;

    @Value("${mysql_data_delimiter}")
    private String dataDelimiter;

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

//    public Review createReview(Review review) {
//        return reviewRepository.save(delimitTransientFields(review));
//    }
//
//    public Review updateReview(Long reviewId, Review review) {
//        Optional<Review> oldReview = reviewRepository.findById(reviewId);
//        if (oldReview.isPresent()) {
//            review.setId(reviewId);
//            reviewRepository.save(delimitTransientFields(review));
//            return review;
//        }
//        return null;
//    }

//    private Review delimitTransientFields(Review review) {
//        List<String> languageIds = new ArrayList<>();
//        for (Language language: review.getLanguages()) {
//            languageIds.add(language.getCode());
//        }
//        review.setLanguageCodes(String.join(dataDelimiter, languageIds));
//        List<String> sectorIds = new ArrayList<>();
//        for (Sector sector: review.getSectors()) {
//            sectorIds.add(sector.getId().toString());
//        }
//        review.setSectorIds(String.join(dataDelimiter, sectorIds));
//        return review;
//    }
}
