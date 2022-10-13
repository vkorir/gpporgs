package edu.berkeley.gpporgs.repository;

import edu.berkeley.gpporgs.model.Country;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CountryRepository extends JpaRepository<Country, String> { }
