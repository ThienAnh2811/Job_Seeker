package com.backend.controller.admin;

import com.backend.entity.*;
import com.backend.service.CategoryService;
import com.backend.service.Impl.ProgramingLanguageServiceImpl;
import com.backend.service.LocationService;
import com.backend.service.PostService;
import com.backend.service.UserService;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDate;
import java.util.*;
import java.util.stream.Collectors;

@RestController
public class HighChartController {


    private final PostService postService;
    private final UserService userService;

    public HighChartController(PostService postService, UserService userService) {
        this.postService = postService;
        this.userService = userService;
    }

    @GetMapping("/get-data")
    public ResponseEntity<Map<String, List<Map<String, Object>>>> getPieChart(@RequestParam String type, @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate fromDate, @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate toDate) {
        List<Post> posts = postService.getAllPosts();
        posts = posts.stream()
                .filter(post -> !post.getDatePosted().isBefore(fromDate.atStartOfDay()) && !post.getDatePosted().isAfter(toDate.atTime(23, 59, 59)))
                .collect(Collectors.toList());
        Map<String, List<Map<String, Object>>> graphData = new HashMap<>();

        for (Post post : posts) {
            String key = "";
            switch (type) {
                case "category":
                    StringBuilder categoryNames = new StringBuilder();
                    for (Category category : post.getCategories()) {
                        categoryNames.append(category.getName()).append(", ");
                    }
                    key = categoryNames.toString();
                    break;
                case "location":
                    key = post.getLocation().getName();
                    break;
                case "language":
                    StringBuilder programingLanguagesNames = new StringBuilder();
                    for (ProgramingLanguage language : post.getProgramingLanguages()) {
                        programingLanguagesNames.append(language.getName()).append(", ");
                    }
                    key = programingLanguagesNames.toString();
                    break;
            }

            if (!graphData.containsKey(key)) {
                graphData.put(key, new ArrayList<>());
            }

            Map<String, Object> postData = new HashMap<>();
            postData.put("datePosted", post.getDatePosted());
            postData.put("maxSalary", post.getMaxSalary());
            postData.put("location" , post.getLocation()) ;
            graphData.get(key).add(postData);
        }

        return new ResponseEntity<>(graphData, HttpStatus.OK);
    }
    @GetMapping("/applicationStatusCounts")
    @ResponseBody
    public Map<String, Integer> getApplicationStatusCounts(Authentication authentication) {

        User userLoggedIn = userService.getUserbyEmail(authentication.getName());
        Map<String, Integer> statusCounts = new HashMap<>();
        for (Application application : userLoggedIn.getApplications()) {
            String status = application.getStatus();
            statusCounts.put(status, statusCounts.getOrDefault(status, 0) + 1);
        }
        return statusCounts;
    }
}