package edu.berkeley.gpporgs.repository;

import edu.berkeley.gpporgs.model.Review;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ReviewRepository extends JpaRepository<Review, Long> {
    Iterable<Review> findAllByOrganizationIdOrderByCreatedDesc(Long organizationId);
}
