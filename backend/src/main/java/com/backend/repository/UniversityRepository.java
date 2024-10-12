package com.backend.repository;


import com.backend.entity.University;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.stereotype.Repository;

@Repository
@EnableJpaRepositories
public interface UniversityRepository extends JpaRepository<University, Integer> {
    @Query("SELECT u FROM University u WHERE u.id = ?1")
    University findUniversityById(int id);
}
