package com.backend.service;

import com.backend.entity.Post;
import com.backend.entity.Category;
import java.util.List;

public interface PostCategoryService {
    List<Category> getCategoriesOfPost(Post post);
    void addCategoryToPost(Post post, Category category);
    void removeCategoryFromPost();
}