package edu.berkeley.gpporgs.resolver;

import com.coxautodev.graphql.tools.GraphQLQueryResolver;
import edu.berkeley.gpporgs.model.*;
import edu.berkeley.gpporgs.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.util.List;

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

    public Iterable<Affiliation> getAffiliations() {
        return affiliationRepository.findAll();
    }

    public Iterable<Country> getCountries() {
        return countryRepository.findAll();
    }

    public Iterable<Language> getLanguages() {
        return languageRepository.findAll();
    }

    public Organization getOrganization(Long organizationId) {
        return organizationRepository.findById(organizationId).orElse(null);
    }

    public Iterable<Organization> getOrganizations(String area, List<Long> sectorIds, Integer offset, Integer limit) {
        return organizationRepository.findAll();
    }

    public Iterable<Region> getRegions() {
        return regionRepository.findAll();
    }

    public Iterable<Review> getReviews(Long organizationId) {
        return reviewRepository.findAllByOrganizationId(organizationId);
    }

    public Iterable<Sector> getSectors() {
        return sectorRepository.findAll();
    }

    public Iterable<Type> getTypes() {
        return typeRepository.findAll();
    }

    public User getUser(String userId) {
        return userRepository.findById(userId).orElse(null);
    }
}
