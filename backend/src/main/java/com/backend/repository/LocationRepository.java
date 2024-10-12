package com.backend.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.stereotype.Repository;

import com.backend.entity.Location;
import com.backend.entity.User;

@Repository
@EnableJpaRepositories
public interface LocationRepository extends JpaRepository<Location, Integer> {
    @Query(
            value = "select * from post_location",
            nativeQuery = true)
    List<Location> getAllLocation();
    Location getLocationById(int id);
}
