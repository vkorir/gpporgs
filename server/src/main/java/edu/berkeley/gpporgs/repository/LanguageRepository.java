package edu.berkeley.gpporgs.repository;

import edu.berkeley.gpporgs.model.Language;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface LanguageRepository extends JpaRepository<Language, String> { }
