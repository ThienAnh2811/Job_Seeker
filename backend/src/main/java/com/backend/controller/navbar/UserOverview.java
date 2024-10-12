package com.backend.controller.navbar;

import com.backend.entity.Location;
import com.backend.entity.User;
import com.backend.repository.ApplicationRepository;
import com.backend.service.ApplicationService;
import com.backend.service.LocationService;
import com.backend.service.UserService;
import lombok.AllArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;
import java.util.List;

@Controller
@AllArgsConstructor
public class UserOverview {
    private final UserService userService;
    private final LocationService locationService;
    private final ApplicationService applicationService;
    private final ApplicationRepository applicationRepository;

    @GetMapping("/jobApplied")
    public String getJobApplied( Authentication auth , Model model) {
        User user = userService.getUserbyEmail(auth.getName());
        model.addAttribute("user", user);
        return "applicant-history";
    }
    @PostMapping("/deleteApplication")
    public String deleteApplication(@RequestParam("applicationId") int applicationId) {
        applicationRepository.deleteById(applicationId);
        return "redirect:/jobApplied";
    }
}
