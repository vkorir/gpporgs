package edu.berkeley.gpporgs.resolver;

import com.coxautodev.graphql.tools.GraphQLMutationResolver;
import edu.berkeley.gpporgs.model.*;
import edu.berkeley.gpporgs.repository.*;
import edu.berkeley.gpporgs.security.UserPrincipal;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.Date;
import java.util.TimeZone;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

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

    private boolean isAdmin() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        return authentication != null &&
                authentication.getAuthorities().contains(new SimpleGrantedAuthority(UserPrincipal.ADMIN));
    }

    public Organization createOrganization(Organization organization) {
        if (organization == null) {
            return null;
        }
        return delimitFields(organization);
    }

    public Organization updateOrganization(Organization organization) {
        if (!isAdmin()) {
            return null;
        }
        Optional<Organization> optional = organizationRepository.findById(organization.getId());
        if (!optional.isPresent()) {
            return null;
        }
        organization = (Organization) updateObject(organization, optional.get());
        return delimitFields(organization);
    }

    public Iterable<Organization> addOrganizations(Iterable<Organization> organizations) {
        List<Organization> result = new ArrayList<>();
        for (Organization organization: organizations) {
            result.add(createOrganization(organization));
        }
        return result;
    }

    private Iterable<String> longsToStrings(Iterable<Long> longs) {
        List<String> strings = new ArrayList<>();
        for (Long value: longs) {
            strings.add(value.toString());
        }
        return strings;
    }

    private Organization delimitFields(Organization organization) {
        if (organization.getAddress() != null) {
            Long addressId = addressRepository.save(organization.getAddress()).getId();
            organization.setAddressId(addressId);
        }
        if (organization.getAffiliations() != null) {
            organization.setAffiliationIds(String.join(dataDelimiter, longsToStrings(organization.getAffiliations())));
        }
        if (organization.getSectors() != null) {
            organization.setSectorIds(String.join(dataDelimiter, longsToStrings(organization.getSectors())));
        }
        Iterable<Contact> contacts = null;
        if (organization.getContacts() != null) {
            contacts = organization.getContacts();
        }
        if (organization.getId() == null) {
            organization.setCreated(getCurrentUTCTime());
        }
        organization = organizationRepository.save(organization);
        if (contacts != null) {
            for (Contact contact: contacts) {
                contact.setOrganizationId(organization.getId());
            }
            contactRepository.saveAll(contacts);
        }
        return organization;
    }

    public User createUser(User user) {
        if (user == null || user.getEmail() == null) {
            return null;
        }
        user.setCreated(getCurrentUTCTime());
        Optional<User> optional = userRepository.findByEmail(user.getEmail());
        return optional.orElseGet(() -> userRepository.save(user));
    }

    public User updateUser(User user) {
        if (user == null || !isAdmin()) {
            return null;
        }
        Optional<User> optional = userRepository.findById(user.getId());
        if (!optional.isPresent()) {
            return null;
        }
        user = (User) updateObject(user, optional.get());
        return userRepository.save(user);
    }

    public Review createReview(Organization organization, Review review) {
        if (review == null) {
            return null;
        }
        Long orgId = delimitFields(organization).getId();
        review.setOrganizationId(orgId);
        return delimitFields(review);
    }

    public Review updateReview(Review review) {
        Optional<Review> optional = reviewRepository.findById(review.getId());
        if (!optional.isPresent()) {
            return null;
        }
        review = (Review) updateObject(review, optional.get());
        return delimitFields(review);
    }

    private String getCurrentUTCTime() {
        TimeZone timeZone = TimeZone.getTimeZone("UTC");
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm'Z'");
        dateFormat.setTimeZone(timeZone);
        return dateFormat.format(new Date());
    }

    private Review delimitFields(Review review) {
        if (review.getAddress() != null) {
            Long addressId = addressRepository.save(review.getAddress()).getId();
            review.setAddressId(addressId);
        }
        if (review.getLanguages() != null) {
            review.setLanguageCodes(String.join(dataDelimiter, review.getLanguages()));
        }
        if (review.getSectors() != null) {
            review.setSectorIds(String.join(dataDelimiter, longsToStrings(review.getSectors())));
        }
        if (review.getId() == null) {
            review.setCreated(getCurrentUTCTime());
        }
        return reviewRepository.save(review);
    }

    private Object updateObject(Object source, Object target) {
        for (Field field: source.getClass().getDeclaredFields()) {
            try {
                field.setAccessible(true);
                if (field.get(source) != null) {
                    field.set(target, field.get(source));
                }
            } catch (IllegalAccessException e) {
                // ignore
            }
        }
        return target;
    }
}
