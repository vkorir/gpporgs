package edu.berkeley.gpporgs.repository;

import edu.berkeley.gpporgs.model.Country;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CountryRepository extends CrudRepository<Country, String> { }
