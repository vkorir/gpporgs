package edu.berkeley.gpporgs.resolver;

import com.coxautodev.graphql.tools.GraphQLResolver;
import edu.berkeley.gpporgs.model.*;
import edu.berkeley.gpporgs.repository.AddressRepository;
import edu.berkeley.gpporgs.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Component
public class ReviewResolver implements GraphQLResolver<Review> {

    @Autowired
    private AddressRepository addressRepository;

    @Autowired
    private UserRepository userRepository;

    @Value("${mysql_data_delimiter}")
    private String dataDelimiter;

    public Address address(Review review) {
        return addressRepository.findById(review.getAddressId()).orElse(null);
    }

    public Iterable<String> languages(Review review) {
        return Arrays.asList(review.getLanguageCodes().split(dataDelimiter));
    }

    public User reviewer(Review review) {
        return userRepository.findById(review.getReviewerId()).orElse(null);
    }

    public Iterable<Long> sectors(Review review) {
        List<Long> sectorIds = new ArrayList<>();
        for (String sectorId: review.getSectorIds().split(dataDelimiter)) {
            sectorIds.add(Long.parseLong(sectorId));
        }
        return sectorIds;
    }
}
