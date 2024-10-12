package com.backend.repository;

import com.backend.entity.NiceToHaves;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface NiceToHavesRepository extends JpaRepository<NiceToHaves, Integer> {
    @Query(value = "select * from nice_to_haves", nativeQuery = true)
    List<NiceToHaves> getAllNiceToHaves();
    NiceToHaves getNiceToHavesById(int id);
    @Query("SELECT n FROM NiceToHaves n WHERE n.id IN (:ids)")
    List<NiceToHaves> getNiceToHavesByIds(@Param("ids") List<Integer> ids);

}
