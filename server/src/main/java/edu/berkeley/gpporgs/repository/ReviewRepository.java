package edu.berkeley.gpporgs.repository;

import edu.berkeley.gpporgs.model.Review;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ReviewRepository extends CrudRepository<Review, Long> {
    Iterable<Review> findAllByOrganizationIdOrderBySubmittedDesc(Long organizationId);
}
