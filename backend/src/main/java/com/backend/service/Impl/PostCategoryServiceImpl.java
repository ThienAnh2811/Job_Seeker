package com.backend.service.Impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.backend.entity.Category;
import com.backend.entity.Post;
import com.backend.entity.PostCategory;
import com.backend.repository.PostCategoryRepository;
import com.backend.repository.PostRepository;
import com.backend.service.PostCategoryService;

@Service
public class PostCategoryServiceImpl implements PostCategoryService {
    private PostRepository postRepository;
    private PostCategoryRepository postCategoryRepository;
    private PostCategory postCategory;

    @Override
    public void addCategoryToPost(Post post, Category category) {
        postCategory = new PostCategory(
                post.getId(),
                category.getId());
        postCategoryRepository.save(postCategory);
    }

    @Override
    public List<Category> getCategoriesOfPost(Post post) {
        return postCategoryRepository.getCategoriesOfAnPost(post.getId());
    }

    @Override
    public void removeCategoryFromPost() {
        postCategoryRepository.delete(postCategory);
    }

}
