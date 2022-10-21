package edu.berkeley.gpporgs.controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.graphql.data.method.annotation.Argument;
import org.springframework.graphql.data.method.annotation.QueryMapping;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;

import edu.berkeley.gpporgs.model.Affiliation;
import edu.berkeley.gpporgs.model.Country;
import edu.berkeley.gpporgs.model.Language;
import edu.berkeley.gpporgs.model.Organization;
import edu.berkeley.gpporgs.model.Region;
import edu.berkeley.gpporgs.model.Review;
import edu.berkeley.gpporgs.model.Sector;
import edu.berkeley.gpporgs.model.Type;
import edu.berkeley.gpporgs.model.User;
import edu.berkeley.gpporgs.repository.AffiliationRepository;
import edu.berkeley.gpporgs.repository.CountryRepository;
import edu.berkeley.gpporgs.repository.LanguageRepository;
import edu.berkeley.gpporgs.repository.OrganizationRepository;
import edu.berkeley.gpporgs.repository.RegionRepository;
import edu.berkeley.gpporgs.repository.ReviewRepository;
import edu.berkeley.gpporgs.repository.SectorRepository;
import edu.berkeley.gpporgs.repository.TypeRepository;
import edu.berkeley.gpporgs.repository.UserRepository;

/**
 * @author Victor Korir
 * @Date 10/01/2020
 */

@Controller
public class QueryController {
    
    @Autowired
    UserRepository userRepository;
    
    @Autowired
    private OrganizationRepository organizationRepository;
    
    @Autowired
    private ReviewRepository reviewRepository;
    
    @Autowired
    private AffiliationRepository affiliationRepository;
    
    @Autowired
    private CountryRepository countryRepository;
    
    @Autowired
    private LanguageRepository languageRepository;
    
    @Autowired
    private RegionRepository regionRepository;
    
    @Autowired
    private SectorRepository sectorRepository;
    
    @Autowired
    private TypeRepository typeRepository;
    
    @QueryMapping
    @PreAuthorize("isAuthenticated()")
    public User currentUser() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication == null) {
            return null;
        }
        String currentUsername = authentication.getName();
        return userRepository.findByEmail(currentUsername).orElse(null);
    }
    
    @QueryMapping
    @PreAuthorize("isAuthenticated()")
    public User user(@Argument long id) {
        return userRepository.findById(id).orElse(null);
    }
    
    @QueryMapping
    @PreAuthorize("isAuthenticated()")
    public Iterable<User> users() {
        return userRepository.findAll();
    }
    
    @QueryMapping
    @PreAuthorize("isAuthenticated()")
    public Organization organization(@Argument long id) {
        return organizationRepository.findById(id).orElse(null);
    }
    
    @QueryMapping
    @PreAuthorize("isAuthenticated()")
    public Iterable<Organization> organizations(@Argument boolean approved) {
        if (approved) {
            return organizationRepository.findByApproved(approved);
        }
        return organizationRepository.findAll();
    }

    @QueryMapping
    @PreAuthorize("isAuthenticated()")
    public Review review(@Argument long id) {
        return reviewRepository.findById(id).orElse(null);
    }

    @QueryMapping
    @PreAuthorize("isAuthenticated()")
    public Iterable<Review> reviews(@Argument long orgId) {
        List<Review> reviews = new ArrayList<>();
        User currentUser = currentUser();
        for (Review review : reviewRepository.findAllByOrganizationIdOrderByCreatedDesc(orgId)) {
            if (!currentUser.getIsAdmin() && currentUser.getId() != review.getReviewer().getId() && review.getAnonymous()) {
                // hide reviewer if current user is not admin nor the reviewer.
                review.setReviewer(null);
            }
            reviews.add(review);
        }
        return reviews;
    }
    
    // Publicly accessible without authentication
    
    @QueryMapping
    public Iterable<Affiliation> affiliations() {
        return affiliationRepository.findAll();
    }
    
    @QueryMapping
    public Iterable<Country> countries() {
        return countryRepository.findAll();
    }
    
    @QueryMapping
    public Iterable<Language> languages() {
        return languageRepository.findAll();
    }
    
    @QueryMapping
    public Iterable<Region> regions() {
        return regionRepository.findAll();
    }
    
    @QueryMapping
    public Iterable<Sector> sectors() {
        return sectorRepository.findAll();
    }
    
    @QueryMapping
    public Iterable<Type> types() {
        return typeRepository.findAll();
    }
}
