package edu.berkeley.gpporgs.resolver;

import com.coxautodev.graphql.tools.GraphQLMutationResolver;
import edu.berkeley.gpporgs.model.*;
import edu.berkeley.gpporgs.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class MutationResolver implements GraphQLMutationResolver {

    @Autowired
    private AddressRepository addressRepository;

    @Autowired
    private ContactRepository contactRepository;

    @Autowired
    private OrganizationRepository organizationRepository;

    @Autowired
    private ReviewRepository reviewRepository;

    @Autowired
    private UserRepository userRepository;

    @Value("${mysql_data_delimiter}")
    private String dataDelimiter;

    public Organization createOrganization(Organization organization) {
        return delimitFields(organization);
    }

    public Organization updateOrganization(Long organizationId, Organization organization) {
        organization.setId(organizationId);
        return delimitFields(organization);
    }

    private Organization delimitFields(Organization organization) {
        Long addressId = addressRepository.save(organization.getAddress()).getId();
        organization.setAddressId(addressId);
        organization.setAffiliationIds(String.join(dataDelimiter, organization.getAffiliations()));
        organization.setSectorIds(String.join(dataDelimiter, organization.getSectors()));
        contactRepository.saveAll(organization.getContacts());
        return organizationRepository.save(organization);
    }

    public User createUser(User user) {
        return userRepository.save(user);
    }

    public User updateUser(String username, User user) {
        if (username.equals(user.getUsername())) {
            userRepository.save(user);
        }
        return user;
    }

    public Review createReview(Review review) {
        return delimitFields(review);
    }

    public Review updateReview(Long reviewId, Review review) {
        review.setId(reviewId);
        return delimitFields(review);
    }

    private Review delimitFields(Review review) {
        review.setLanguageCodes(String.join(dataDelimiter, review.getLanguages()));
        review.setSectorIds(String.join(dataDelimiter, review.getSectors()));
        return reviewRepository.save(review);
    }
}
