package edu.berkeley.gpporgs.resolver;

import com.coxautodev.graphql.tools.GraphQLResolver;
import edu.berkeley.gpporgs.model.*;
import edu.berkeley.gpporgs.repository.AddressRepository;
import edu.berkeley.gpporgs.repository.LanguageRepository;
import edu.berkeley.gpporgs.repository.SectorRepository;
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
    private LanguageRepository languageRepository;

    @Autowired
    private SectorRepository sectorRepository;

    @Autowired
    private UserRepository userRepository;

    @Value("${mysql_data_delimiter}")
    private String dataDelimiter;

    public Address getAddress(Review review) {
        return addressRepository.findById(review.getAddressId()).orElse(null);
    }

    public Iterable<String> getLanguages(Review review) {
        Iterable<Language> languages = languageRepository.findAllById(Arrays.asList(review.getLanguageCodes().split(dataDelimiter)));
        List<String> result = new ArrayList<>();
        languages.forEach(language -> result.add(language.getName()));
        return result;
    }

    public User getReviewer(Review review) {
        return userRepository.findById(review.getReviewerId()).orElse(null);
    }

    public Iterable<String> getSectors(Review review) {
        List<Long> sectorIds = new ArrayList<>();
        for (String sectorId: review.getSectorIds().split(dataDelimiter)) {
            sectorIds.add(Long.parseLong(sectorId));
        }
        Iterable<Sector> sectors = sectorRepository.findAllById(sectorIds);
        List<String> result = new ArrayList<>();
        sectors.forEach(sector -> result.add(sector.getName()));
        return result;
    }
}
