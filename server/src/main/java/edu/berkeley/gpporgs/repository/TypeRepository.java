package edu.berkeley.gpporgs.repository;

import edu.berkeley.gpporgs.model.Type;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TypeRepository extends JpaRepository<Type, Long> { }
