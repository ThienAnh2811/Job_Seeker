package com.backend.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;

import com.backend.entity.Post;
import com.backend.repository.PostRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import com.backend.entity.Category;
import com.backend.repository.CategoryRepository;

@Service
public class CategoryService {
    @Autowired
    private CategoryRepository categoryRepository;
    @Autowired
    private PostRepository postRepository;
    private PostService postService;

    @Autowired
    public void setPostService(@Lazy PostService postService) {
        this.postService = postService;
    }

    public List<Category> getAllCategories() {
        return categoryRepository.findAll();
    }
    public List<Category> getCategoriesByIds(List<Integer> ids){
        return categoryRepository.findByIdsList(ids);
    }
    public void updateCategoryQuantities() {
        List<Post> posts = postRepository.findAll();

        Map<Category, Long> postCountByCategory = posts.stream()
                .flatMap(post -> post.getCategories().stream())
                .collect(Collectors.groupingBy(Function.identity(), Collectors.counting()));

        postCountByCategory.forEach((category, count) -> {
            category.setQuantity(count.intValue());
            categoryRepository.save(category);
        });
    }
}
