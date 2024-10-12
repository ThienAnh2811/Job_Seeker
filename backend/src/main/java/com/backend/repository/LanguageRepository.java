package com.backend.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.backend.entity.Language;

@Repository
public interface LanguageRepository extends JpaRepository<Language, Integer>{
        
}    

