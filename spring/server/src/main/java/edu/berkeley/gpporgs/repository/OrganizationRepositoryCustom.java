package edu.berkeley.gpporgs.repository;

import edu.berkeley.gpporgs.model.Area;
import edu.berkeley.gpporgs.model.Organization;

import java.util.List;

public interface OrganizationRepositoryCustom {
    List<Organization> filterOrganizations(Area area, List<Long> sectorIds, Integer offset, Integer limit);
}
