package edu.berkeley.gpporgs.repository;

import edu.berkeley.gpporgs.model.Contact;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ContactRepository extends CrudRepository<Contact, Long> {
    @Query("select c from Contact c where c.organizationId=organizationId")
    List<Contact> findByOrOrganizationId(@Param("organizationId") Long organizationId);
}
