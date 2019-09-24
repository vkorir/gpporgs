package edu.berkeley.gpporgs.repository;

import edu.berkeley.gpporgs.model.Language;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface LanguageRepository extends CrudRepository<Language, String> { }
