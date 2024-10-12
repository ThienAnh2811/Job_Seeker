package com.backend.service;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import com.backend.entity.Post;
import com.backend.repository.PostRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.backend.entity.Level;
import com.backend.repository.LevelRepository;

@Service
public class LevelService {

    @Autowired
    private LevelRepository levelRepository;
    @Autowired
    private PostRepository postRepository;

    public List<Level> getAllLevel() {
        return levelRepository.getAllLevel();
    }
    public Level getLevelById(int id) {
        return levelRepository.getLevelById(id);
    }
    public void updateLevelQuantities() {
        List<Post> posts = postRepository.findAll();
        Map<Level, Long> postCountByLevel = posts.stream()
                .collect(Collectors.groupingBy(Post::getLevel, Collectors.counting()));
        postCountByLevel.forEach((level, count) -> {
            level.setQuantity(count.intValue());
            levelRepository.save(level);
        });
    }
}
