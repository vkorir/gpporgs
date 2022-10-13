package edu.berkeley.gpporgs.repository;

import edu.berkeley.gpporgs.model.Address;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AddressRepository extends JpaRepository<Address, Long> { }
