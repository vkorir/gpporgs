package edu.berkeley.gpporgs.repository;

import edu.berkeley.gpporgs.model.Sector;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SectorRepository extends CrudRepository<Sector, Long> { }
