package edu.berkeley.gpporgs.resolver;

import com.coxautodev.graphql.tools.GraphQLResolver;
import edu.berkeley.gpporgs.model.*;
import edu.berkeley.gpporgs.repository.AddressRepository;
import edu.berkeley.gpporgs.repository.UserRepository;
import edu.berkeley.gpporgs.security.UserPrincipal;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
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

    public Address address(Review review) {
        return addressRepository.findById(review.getAddressId()).orElse(null);
    }

    public Iterable<String> languages(Review review) {
        return Arrays.asList(review.getLanguageCodes().split("\\^"));
    }

    public User reviewer(Review review) {
        UserPrincipal principal = (UserPrincipal) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (principal.getAuthorities().contains(new SimpleGrantedAuthority("ROLE_ADMIN"))) {
            if (review.getReviewerId() == null) {
                return null;
            }
            return userRepository.findById(review.getReviewerId()).orElse(null);
        }
        return null;
    }

    public Iterable<Long> sectors(Review review) {
        List<Long> sectorIds = new ArrayList<>();
        if (review.getSectorIds().length() == 0) {
            return sectorIds;
        }
        for (String sectorId: review.getSectorIds().split("\\^")) {
            sectorIds.add(Long.parseLong(sectorId));
        }
        return sectorIds;
    }
}
