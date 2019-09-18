package edu.berkeley.gpporgs.repository;

import edu.berkeley.gpporgs.model.Affiliation;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AffiliationRepository extends CrudRepository<Affiliation, Long> { }
