package edu.berkeley.gpporgs.repository;

import edu.berkeley.gpporgs.model.Affiliation;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AffiliationRepository extends JpaRepository<Affiliation, Long> { }
