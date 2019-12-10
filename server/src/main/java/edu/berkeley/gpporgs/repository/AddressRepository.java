package edu.berkeley.gpporgs.repository;

import edu.berkeley.gpporgs.model.Address;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AddressRepository extends CrudRepository<Address, Long> { }
