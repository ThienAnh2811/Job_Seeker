package com.backend.controller.navbar;

import com.backend.dto.ApplicationDTO;
import com.backend.entity.*;
import com.backend.service.ApplicationService;
import com.backend.service.PostService;
import com.backend.service.UserService;
import lombok.AllArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.IOException;
import java.util.List;

@Controller
@AllArgsConstructor
public class JobDetailsController {

    private final UserService userService;
    private final PostService postService;
    private final ApplicationService applicationService;

    @GetMapping("/jobdetails")
    public String JobDetailsForm(@ModelAttribute("ApplicationDTO") ApplicationDTO jobApplicationDto, Model model, @RequestParam("id") Integer id) {
        if (id == null) {
            return "job-descriptions";
        }
        User userLoggedIn = userService.getLoggedInUser();
        List<Comment> comments = postService.getPostById(id).getComments();
        model.addAttribute("comments", comments);
        model.addAttribute("userLoggedIn", userLoggedIn);
        try {
            Post post = postService.getPostAndSetDefaults(id);
            model.addAttribute("post", post);
            return "job-descriptions";
        } catch (Exception e) {
            model.addAttribute("errorMessage", e.getMessage());
            return "error";
        }
    }
    @PostMapping("/jobdetails")
    public String applyJob(@ModelAttribute("ApplicationDTO") ApplicationDTO jobApplicationDto , @RequestParam("id") Integer postId) throws IOException {
        User userLoggedIn = userService.getLoggedInUser();
        applicationService.createAndSaveApplication(jobApplicationDto, userLoggedIn, postId);
        return "redirect:/jobdetails?id=" + postId;
    }
}
