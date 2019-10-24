package edu.berkeley.gpporgs.resolver;

import com.coxautodev.graphql.tools.GraphQLResolver;
import edu.berkeley.gpporgs.model.*;
import edu.berkeley.gpporgs.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

@Component
public class OrganizationResolver implements GraphQLResolver<Organization> {

    @Autowired
    private AddressRepository addressRepository;

    @Autowired
    private AffiliationRepository affiliationRepository;

    @Autowired
    private TypeRepository typeRepository;

    @Autowired
    private SectorRepository sectorRepository;

    @Autowired
    private ContactRepository contactRepository;

    @Value("${mysql_data_delimiter}")
    private String dataDelimiter;

    public Address address(Organization organization) {
        return addressRepository.findById(organization.getAddressId()).orElse(null);
    }

    public Iterable<String> affiliations(Organization organization) {
        return Arrays.asList(organization.getAffiliationIds().split(dataDelimiter));
    }

    public Iterable<String> sectors(Organization organization) {
        return Arrays.asList(organization.getSectorIds().split(dataDelimiter));
    }

    public Iterable<Contact> getContacts(Organization organization) {
        return contactRepository.findContactByOrganizationId(organization.getId());
    }
}
