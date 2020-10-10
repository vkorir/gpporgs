package edu.berkeley.gpporgs.resolver;

import com.coxautodev.graphql.tools.GraphQLQueryResolver;
import edu.berkeley.gpporgs.model.*;
import edu.berkeley.gpporgs.repository.*;
import edu.berkeley.gpporgs.security.UserPrincipal;
import graphql.GraphQLException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

import java.util.ArrayList;

@Component
public class QueryResolver implements GraphQLQueryResolver {

    @Autowired
    private AffiliationRepository affiliationRepository;

    @Autowired
    private CountryRepository countryRepository;

    @Autowired
    private LanguageRepository languageRepository;

    @Autowired
    private OrganizationRepository organizationRepository;

    @Autowired
    private RegionRepository regionRepository;

    @Autowired
    private ReviewRepository reviewRepository;

    @Autowired
    private SectorRepository sectorRepository;

    @Autowired
    private TypeRepository typeRepository;

    @Autowired
    private UserRepository userRepository;

    @Value("${mysql_data_delimiter}")
    private String dataDelimiter;

    public Iterable<Affiliation> affiliations() {
        return affiliationRepository.findAll();
    }

    public Iterable<Country> countries() {
        return countryRepository.findAll();
    }

    public User currentUser() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication == null) {
            return null;
        }
        String currentUsername = authentication.getName();
        return userRepository.findByEmail(currentUsername).orElse(null);
    }

    public Iterable<Language> languages() {
        return languageRepository.findAll();
    }

    public Organization organization(Long id) throws GraphQLException {
        return organizationRepository.findById(id).orElse(null);
    }

    public Iterable<Organization> organizations() {
        return organizationRepository.findAll();
    }

    public Iterable<Region> regions() {
        return regionRepository.findAll();
    }

    public Iterable<Review> reviews(Long organizationId) {
        return reviewRepository.findAllByOrganizationIdOrderByCreatedDesc(organizationId);
    }

    public Iterable<Sector> sectors() {
        return sectorRepository.findAll();
    }

    public Iterable<Type> types() {
        return typeRepository.findAll();
    }

    public User user(String email) {
        return userRepository.findByEmail(email).orElse(null);
    }

    public Iterable<User> users() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null
                && authentication.getAuthorities().contains(new SimpleGrantedAuthority(UserPrincipal.ADMIN))) {
            return userRepository.findAll();
        }
        return new ArrayList<>();
    }
}
