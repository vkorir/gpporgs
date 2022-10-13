package edu.berkeley.gpporgs.controllers;

import java.lang.reflect.Field;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Optional;
import java.util.TimeZone;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.graphql.data.method.annotation.Argument;
import org.springframework.graphql.data.method.annotation.MutationMapping;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;

import edu.berkeley.gpporgs.model.Organization;
import edu.berkeley.gpporgs.model.Review;
import edu.berkeley.gpporgs.model.User;
import edu.berkeley.gpporgs.repository.OrganizationRepository;
import edu.berkeley.gpporgs.repository.ReviewRepository;
import edu.berkeley.gpporgs.repository.UserRepository;

/**
 * @author Victor Korir
 * @Date 10/01/2020
 */

@Controller
public class MutationController {
    
    @Autowired
    private UserRepository userRepository;

    @Autowired
    private OrganizationRepository organizationRepository;

    @Autowired
    private ReviewRepository reviewRepository;

    @MutationMapping
    @PreAuthorize("isAuthenticated()")
    public User createUser(@Argument User user) {
        if (user != null && user.getEmail() != null) {
            user.setCreated(getCurrentUTCTime());
            Optional<User> optional = userRepository.findByEmail(user.getEmail());
            return optional.orElseGet(() -> userRepository.save(user));
        }
        return null;
    }

    @MutationMapping
    @PreAuthorize("isAuthenticated()")
    public User updateUser(@Argument User user) {
        Optional<User> optional = userRepository.findById(user.getId());
        if (optional.isPresent()) {
            return userRepository.save((User) updateObject(user, optional.get()));
        }
        return null;
    }

    @MutationMapping
    @PreAuthorize("isAuthenticated()")
    public Organization createOrganization(@Argument Organization org) {
        org.setCreated(getCurrentUTCTime());
        return organizationRepository.save(org);
    }

    @MutationMapping
    @PreAuthorize("isAuthenticated()")
    public Organization updateOrganization(@Argument Organization org) {
        Optional<Organization> optional = organizationRepository.findById(org.getId());
        if (optional.isPresent()) {
            return organizationRepository.save((Organization) updateObject(org, optional.get()));
        }
        return null;
    }

    @MutationMapping
    @PreAuthorize("isAuthenticated()")
    public Review createReview(@Argument long orgId, @Argument Review rev) {
        Optional<Organization> optional = organizationRepository.findById(orgId);
        if (optional.isPresent()) {
            rev.setOrganization(optional.get());
            rev.setCreated(getCurrentUTCTime());
            return reviewRepository.save(rev);
        }
        return null;
    }

    @MutationMapping
    @PreAuthorize("isAuthenticated()")
    public Review updateReview(@Argument Review rev) {
        Optional<Review> optional = reviewRepository.findById(rev.getId());
        if (optional.isPresent()) {
            return reviewRepository.save((Review) updateObject(rev, optional.get()));
        }
        return null;
    }

    private String getCurrentUTCTime() {
        TimeZone timeZone = TimeZone.getTimeZone("UTC");
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm'Z'");
        dateFormat.setTimeZone(timeZone);
        return dateFormat.format(new Date());
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
