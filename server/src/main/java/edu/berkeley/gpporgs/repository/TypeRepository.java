package edu.berkeley.gpporgs.repository;

import edu.berkeley.gpporgs.model.Type;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TypeRepository extends CrudRepository<Type, Long> { }
