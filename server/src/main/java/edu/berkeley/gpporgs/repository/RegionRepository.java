package edu.berkeley.gpporgs.repository;

import edu.berkeley.gpporgs.model.Region;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RegionRepository extends JpaRepository<Region, Long> { }
