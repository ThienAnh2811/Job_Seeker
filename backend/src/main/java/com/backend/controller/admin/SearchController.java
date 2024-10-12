package com.backend.controller.admin;

import com.backend.service.PostService;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Conditional;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class SearchController {
    private final PostService postService;

    public SearchController(PostService postService) {
        this.postService = postService;
    }
    @GetMapping("/search")
    public ResponseEntity<List<String>> getSearchRecommendations(@RequestParam String query) {
        List<String> recommendations = postService.getPostDetailsContaining(query);
        return ResponseEntity.ok(recommendations);
    }
}
