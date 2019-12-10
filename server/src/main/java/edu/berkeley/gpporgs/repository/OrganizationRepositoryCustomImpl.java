package edu.berkeley.gpporgs.repository;

import edu.berkeley.gpporgs.model.Area;
import edu.berkeley.gpporgs.model.Organization;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.CriteriaBuilder;
import java.util.ArrayList;
import java.util.List;

@Service
public class OrganizationRepositoryCustomImpl implements OrganizationRepositoryCustom {

    @PersistenceContext
    private EntityManager entityManager;

    public List<Organization> filterOrganizations(Area area, List<Long> sectorIds, Integer offset, Integer limit) {
        CriteriaBuilder cb = entityManager.getCriteriaBuilder();
        return new ArrayList<>();
    }
}
