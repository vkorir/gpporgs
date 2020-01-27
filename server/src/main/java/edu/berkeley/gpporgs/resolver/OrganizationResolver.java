package edu.berkeley.gpporgs.resolver;

import com.coxautodev.graphql.tools.GraphQLResolver;
import edu.berkeley.gpporgs.model.*;
import edu.berkeley.gpporgs.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class OrganizationResolver implements GraphQLResolver<Organization> {

    @Autowired
    private AddressRepository addressRepository;

    @Autowired
    private ContactRepository contactRepository;

    @Value("${mysql_data_delimiter}")
    private String dataDelimiter; // ( ^ )

    public Address address(Organization organization) {
        return addressRepository.findById(organization.getAddressId()).orElse(null);
    }

    public Iterable<Long> affiliations(Organization organization) {
        List<Long> affiliationIds = new ArrayList<>();
        if (organization.getAffiliationIds() == null) {
            return affiliationIds;
        }
        for (String sectorId: organization.getAffiliationIds().split("\\^")) {
            if (sectorId.length() > 0) {
                affiliationIds.add(Long.parseLong(sectorId));
            }
        }
        return affiliationIds;
    }

    public Iterable<Long> sectors(Organization organization) {
        List<Long> sectorIds = new ArrayList<>();
        if (organization.getSectorIds() == null) {
            return sectorIds;
        }
        for (String sectorId: organization.getSectorIds().split("\\^")) {
            if (sectorId.length() > 0) {
                sectorIds.add(Long.parseLong(sectorId));
            }
        }
        return sectorIds;
    }

    public Iterable<Contact> contacts(Organization organization) {
        return contactRepository.findContactByOrganizationId(organization.getId());
    }
}
