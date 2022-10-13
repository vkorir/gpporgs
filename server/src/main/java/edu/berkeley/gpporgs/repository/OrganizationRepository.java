package edu.berkeley.gpporgs.repository;

import edu.berkeley.gpporgs.model.Organization;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface OrganizationRepository extends JpaRepository<Organization, Long> {
    Iterable<Organization> findByApproved(Boolean approved);
}
