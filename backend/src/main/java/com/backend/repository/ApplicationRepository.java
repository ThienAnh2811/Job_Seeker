package com.backend.repository;

import com.backend.entity.Application;
import com.backend.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

@Repository
@EnableJpaRepositories
public interface ApplicationRepository extends JpaRepository<Application, Integer> {
    List<Application> findByPostId(int id);

    Application findById(int id);

    List<Application> findAllByUser(User user);
;

    @Query("SELECT a FROM Application a WHERE a.post IN (SELECT p FROM Post p WHERE p.company.id = :companyId)")
    List<Application> findAllByPostCompany(@Param("companyId") int companyId);

    @Query("SELECT COUNT(a) FROM Application a WHERE a.status = :status AND a.post.company.id = :companyId AND a.timeApplied >= :startDate AND a.timeApplied <= :endDate")
    int countByStatusAndCompanyAndTimePeriod(@Param("status") String status, @Param("companyId") int companyId, @Param("startDate") LocalDateTime startDate, @Param("endDate") LocalDateTime endDate);

    @Query("SELECT COUNT(a) FROM Application a WHERE a.post.company.id = :companyId AND a.timeApplied >= :startDate AND a.timeApplied <= :endDate")
    int countByCompanyAndTimePeriod(@Param("companyId") int companyId, @Param("startDate") LocalDateTime startDate, @Param("endDate") LocalDateTime endDate);

    @Query("SELECT COUNT(a) FROM Application a WHERE a.post.level.name = :levelName AND a.post.company.id = :companyId")
    int countByCompanyAndPostLevel(@Param("levelName") String levelName, @Param("companyId") int companyId);
    @Query("SELECT a FROM Application a WHERE a.interviewStartTime > CURRENT_DATE AND a.post.company.id = :companyId AND a.status = 'Interview'")
    List<Application> findUpcomingApplicationsByCompany(@Param("companyId") int companyId);
    @Query("SELECT a FROM Application a WHERE a.interviewStartTime >= :startDate AND a.interviewStartTime < :endDate AND a.post.company.id = :companyId")
    List<Application> findApplicationsByDateAndCompany(@Param("startDate") LocalDateTime startDate, @Param("endDate") LocalDateTime endDate, @Param("companyId") Integer companyId);
}