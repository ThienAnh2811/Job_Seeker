package com.backend.repository;

import java.util.List;

import com.backend.entity.*;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
@EnableJpaRepositories
public interface PostRepository extends JpaRepository<Post, Integer> , JpaSpecificationExecutor<Post> {
    @Query(
            value = "select * from post",
            nativeQuery = true)
    List<Post> getAllPost();
    List<Post> findAllByCompany(Company company);
    List<Post> findAllByOrderByDatePostedDesc();
    List<Category> getCategoryById(@Param("id") Integer id);
    List<Post> findAllByOrderByMaxSalaryDesc();
    List<Post> findAllByOrderByMaxSalaryAsc();
    Post findPostById(int id);
    @Query(
            value = "select u.* from user u inner join applications a on u.id = a.user_id where a.post_id = :id",
            nativeQuery = true)
    List<User> getUserApplicantsByPostId(int id);
    @Query("SELECT p FROM Post p " +
            "JOIN p.categories c " +
            "WHERE c.name IN :filterCategory")
    Page<Post> findAll(Pageable pageable,
                       @Param("filterCategory") List<String> filterCategory);
    // In PostRepository.java
    @Query("SELECT p.title, p.location.name, c.name, p.level.name FROM Post p JOIN p.categories c WHERE " +
            "LOWER(p.title) LIKE LOWER(CONCAT('%', :query, '%')) OR " +
            "LOWER(p.location.name) LIKE LOWER(CONCAT('%', :query, '%')) OR " +
            "LOWER(c.name) LIKE LOWER(CONCAT('%', :query, '%')) OR " +
            "LOWER(p.level.name) LIKE LOWER(CONCAT('%', :query, '%'))")
    List<String> findPostDetailsByQuery(@Param("query") String query);


}