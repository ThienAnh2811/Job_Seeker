// PostController.java
package com.backend.controller.admin;

import com.backend.entity.Post;
import com.backend.repository.PostRepository;
import com.backend.service.PostService;
import org.springframework.http.ResponseEntity;
import org.springframework.social.ResourceNotFoundException;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/posts")
public class PostController {

    private final PostService postService;
    private final PostRepository postRepository;

    public PostController(PostService postService, PostRepository postRepository) {
        this.postService = postService;
        this.postRepository = postRepository;
    }

    @GetMapping
    public List<Post> getAllPosts() {
        return postService.getAllPosts();
    }
    @DeleteMapping("/post/{id}")
    public ResponseEntity<?> deletePost(@PathVariable Integer id) {
        postService.deletePost(id);
        return ResponseEntity.ok().build();
    }
    @PutMapping("/post/{id}/inactive")
    public ResponseEntity<?> setPostInactive(@PathVariable Integer id) {
        postService.setPostInactive(id);
        return ResponseEntity.ok().build();
    }
    @PutMapping("/post/{id}/active")
    public ResponseEntity<?> setPostActive(@PathVariable Integer id) {
        postService.setPostActive(id);
        return ResponseEntity.ok().build();
    }
}