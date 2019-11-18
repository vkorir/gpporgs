package edu.berkeley.gpporgs.resolver;

import com.coxautodev.graphql.tools.GraphQLMutationResolver;
import com.google.common.collect.Lists;
import edu.berkeley.gpporgs.model.*;
import edu.berkeley.gpporgs.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

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

    private Iterable<String> longsToStrings(Iterable<Long> longs) {
        List<String> strings = new ArrayList<>();
        for (Long value: longs) {
            strings.add(value.toString());
        }
        return strings;
    }

    private Organization delimitFields(Organization organization) {
        Long addressId = addressRepository.save(organization.getAddress()).getId();
        organization.setAddressId(addressId);
        organization.setAffiliationIds(String.join(dataDelimiter, longsToStrings(organization.getAffiliations())));
        organization.setSectorIds(String.join(dataDelimiter, longsToStrings(organization.getSectors())));
        contactRepository.saveAll(organization.getContacts());
        return organizationRepository.save(organization);
    }

    public User createUser(User user) {
        return userRepository.save(user);
    }

    public User updateUser(String username, User user) {
        if (username.equals(user.getId())) {
            userRepository.save(user);
        }
        return user;
    }

    public Review createReview(Organization organization, Review review) {
        Long orgId = delimitFields(organization).getId();
        review.setOrganizationId(orgId);
        return delimitFields(review);
    }

    public Review updateReview(Long reviewId, Review review) {
        review.setId(reviewId);
        return delimitFields(review);
    }

    public Contact updateContact(Long id, Contact contact) {
        Optional oldContact = contactRepository.findById(id);
        if (oldContact.isPresent()) {
            contact.setId(id);
            return contactRepository.save(contact);
        }
        return null;
    }

    private Review delimitFields(Review review) {
        Long addressId = addressRepository.save(review.getAddress()).getId();
        review.setAddressId(addressId);
        review.setLanguageCodes(String.join(dataDelimiter, review.getLanguages()));
        review.setSectorIds(String.join(dataDelimiter, longsToStrings(review.getSectors())));
        return reviewRepository.save(review);
    }
}
