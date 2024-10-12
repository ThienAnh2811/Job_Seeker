package com.backend.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.backend.entity.ProgramingLanguage;


@Repository
@EnableJpaRepositories
public interface ProgramingLanguageRepository extends JpaRepository<ProgramingLanguage, Integer>{
    List<ProgramingLanguage> findAll(); 
    @Query("SELECT p FROM ProgramingLanguage p WHERE p.id IN (:ids)")
    List<ProgramingLanguage> findByIdsList(@Param("ids") List<Integer> ids);
}