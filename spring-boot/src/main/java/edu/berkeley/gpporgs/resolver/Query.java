package edu.berkeley.gpporgs.resolver;

import com.coxautodev.graphql.tools.GraphQLQueryResolver;
import edu.berkeley.gpporgs.model.Language;
import edu.berkeley.gpporgs.model.Organization;
import edu.berkeley.gpporgs.model.Review;
import edu.berkeley.gpporgs.model.User;
import edu.berkeley.gpporgs.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class Query implements GraphQLQueryResolver {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private OrganizationRepository organizationRepository;

    @Autowired
    private ContactRepository contactRepository;

    @Autowired
    private AffiliationRepository affiliationRepository;

    @Autowired
    private TypeRepository typeRepository;

    @Autowired
    private SectorRepository sectorRepository;

    @Autowired
    private ReviewRepository reviewRepository;

    @Autowired
    private LanguageRepository languageRepository;

    @Value("${mysql_data_delimiter}")
    private String dataDelimiter;

    public Optional<User> getUser(String calNetId) {
        return userRepository.findById(calNetId);
    }

    public List<Organization> getOrganizations() {
        List<Organization> organizations = new ArrayList<>();
        for (Organization organization: organizationRepository.findAll()) {
            organizations.add(populateTransientFields(organization));
        }
        return organizations;
    }

    public Organization getOrganization(Long organizationId) {
        Optional<Organization> organization = organizationRepository.findById(organizationId);
        return organization.map(this::populateTransientFields).orElse(null);
    }

    private Organization populateTransientFields(Organization organization) {
        organization.setAffiliations(affiliationRepository.findAllById(retrieveRecordIds(organization.getAffiliationIds())));
        organization.setType(typeRepository.findById(organization.getTypeId()).get());
        organization.setSectors(sectorRepository.findAllById(retrieveRecordIds(organization.getSectorIds())));
        organization.setContacts(contactRepository.findByOrOrganizationId(organization.getId()));
        return organization;
    }

    private List<Long> retrieveRecordIds(String stringIds) {
        List<Long> longIds = new ArrayList<>();
        for (String stringId: stringIds.split(dataDelimiter)) {
            longIds.add(Long.parseLong(stringId));
        }
        return longIds;
    }

    public Iterable<Review> getReviews() {
        return reviewRepository.findAll();
    }

    public Iterable<Language> getLanguages() {
        return languageRepository.findAll();
    }
}
