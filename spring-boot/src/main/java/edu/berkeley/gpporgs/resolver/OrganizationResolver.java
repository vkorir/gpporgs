package edu.berkeley.gpporgs.resolver;

import com.coxautodev.graphql.tools.GraphQLResolver;
import edu.berkeley.gpporgs.model.*;
import edu.berkeley.gpporgs.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
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

    public Optional<Address> getAddress(Organization organization) {
        return addressRepository.findById(organization.getAddressId());
    }

    public Iterable<Affiliation> getAffiliations(Organization organization) {
        return affiliationRepository.findAllById(getLongIds(organization.getAffiliationIds()));
    }

    public Type getType(Organization organization) {
        return typeRepository.findById(organization.getTypeId()).get();
    }

    public Iterable<Sector> getSectors(Organization organization) {
        return sectorRepository.findAllById(getLongIds(organization.getSectorIds()));
    }

    public Iterable<Contact> getContacts(Organization organization) {
        return contactRepository.findByOrOrganizationId(organization.getId());
    }

    private Iterable<Long> getLongIds(String stringIds) {
        List<Long> longIds = new ArrayList<>();
        for (String stringId: stringIds.split(dataDelimiter)) {
            longIds.add(Long.parseLong(stringId));
        }
        return longIds;
    }
}
