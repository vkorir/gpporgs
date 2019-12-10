package edu.berkeley.gpporgs.repository;

import edu.berkeley.gpporgs.model.Region;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RegionRepository extends CrudRepository<Region, Long> { }
