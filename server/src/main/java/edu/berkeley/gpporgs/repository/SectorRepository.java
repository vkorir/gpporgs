package edu.berkeley.gpporgs.repository;

import edu.berkeley.gpporgs.model.Sector;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SectorRepository extends JpaRepository<Sector, Long> { }
