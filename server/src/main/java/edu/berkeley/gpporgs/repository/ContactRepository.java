package edu.berkeley.gpporgs.repository;

import edu.berkeley.gpporgs.model.Contact;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ContactRepository extends JpaRepository<Contact, Long> { }
