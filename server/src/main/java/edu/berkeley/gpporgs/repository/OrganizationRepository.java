package edu.berkeley.gpporgs.repository;

import edu.berkeley.gpporgs.model.Organization;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface OrganizationRepository extends CrudRepository<Organization, Long>, OrganizationRepositoryCustom {}
