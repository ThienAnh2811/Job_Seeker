package com.backend.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.backend.entity.Category;
@Repository
@EnableJpaRepositories
public interface CategoryRepository extends JpaRepository<Category, Integer> {
    @Query(value = "select * from category", nativeQuery = true)
    List<Category> getAllCategories();

    @Query("SELECT c FROM Category c WHERE c.id IN (:ids)")
    List<Category> findByIdsList(@Param("ids") List<Integer> ids);
}
