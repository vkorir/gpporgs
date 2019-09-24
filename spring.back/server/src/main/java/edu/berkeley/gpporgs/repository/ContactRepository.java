package edu.berkeley.gpporgs.repository;

import edu.berkeley.gpporgs.model.Contact;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface ContactRepository extends CrudRepository<Contact, Long> {
    Iterable<Contact> findContactByOrganizationId(@Param("organizationId") Long organizationId);
}
