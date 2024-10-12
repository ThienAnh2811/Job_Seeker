package com.backend.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.backend.entity.Level;

@Repository
public interface LevelRepository extends JpaRepository<Level, Integer> {
    @Query(value = "select * from level", nativeQuery = true)
    List<Level> getAllLevel();
    Level getLevelById(int id);
}
