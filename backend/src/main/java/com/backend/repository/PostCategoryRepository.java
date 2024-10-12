package com.backend.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.backend.entity.Category;
import com.backend.entity.PostCategory;

@Repository
public interface PostCategoryRepository extends JpaRepository<PostCategory, Integer> {
    @Query(value = "select * from post_category", nativeQuery = true)
    List<PostCategory> getAllPostCategory();

    @Query(value = "select * from post_category where post_id = ?1", nativeQuery = true)
    List<Category> getCategoriesOfAnPost(int id);
}