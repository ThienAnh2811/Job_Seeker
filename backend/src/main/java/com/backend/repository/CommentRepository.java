package com.backend.repository;

import com.backend.entity.Comment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.stereotype.Repository;

@Repository
@EnableJpaRepositories
public interface CommentRepository extends JpaRepository<Comment, Long>{
    @Query("SELECT c FROM Comment c WHERE c.id = ?1")
    Comment findCommentById(Long id);
}