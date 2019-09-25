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
    private AffiliationRepository affiliationRepository;

    @Autowired
    private TypeRepository typeRepository;

    @Autowired
    private SectorRepository sectorRepository;

    @Autowired
    private ContactRepository contactRepository;

    @Value("${mysql_data_delimiter}")
    private String dataDelimiter;

    public Address getAddress(Organization organization) {
        return addressRepository.findById(organization.getAddressId()).orElse(null);
    }

    public Iterable<String> getAffiliations(Organization organization) {
        List<String> affiliations = new ArrayList<>();
        affiliationRepository.findAllById(getLongIds(organization.getAffiliationIds())).forEach(affiliation -> {
            affiliations.add(affiliation.getName());
        });
        return affiliations;
    }

    public Type getType(Organization organization) {
        return typeRepository.findById(organization.getTypeId()).orElse(null);
    }

    public Iterable<String> getSectors(Organization organization) {
        List<String> sectors = new ArrayList<>();
        sectorRepository.findAllById(getLongIds(organization.getSectorIds())).forEach(sector -> {
            sectors.add(sector.getName());
        });
        return sectors;
    }

    public Iterable<Contact> getContacts(Organization organization) {
        return contactRepository.findContactByOrganizationId(organization.getId());
    }

    private Iterable<Long> getLongIds(String stringIds) {
        List<Long> longIds = new ArrayList<>();
        for (String stringId: stringIds.split(dataDelimiter)) {
            longIds.add(Long.parseLong(stringId));
        }
        return longIds;
    }
}
