package com.backend.controller.navbar;

import com.backend.entity.Application;
import com.backend.entity.Company;
import com.backend.entity.User;
import com.backend.repository.ApplicationRepository;
import com.backend.service.ApplicationService;
import com.backend.service.UserService;
import lombok.AllArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;

@Controller
@AllArgsConstructor
public class InterviewController {
    private final UserService userService;
    private final ApplicationService applicationService;
    private final ApplicationRepository applicationRepository;

    @GetMapping("/interview")
    public String showInterviewForm(Model model , @RequestParam("id") Integer id ) {
        User user = userService.getLoggedInUser();
        Company company = user.getCompany() ;
        if (id == null) {
            return "error";
        }
        List<Application> applications = applicationRepository.findAll();
        List<Application> interviewApplications = applications.stream()
                .filter(application -> "Interview".equals(application.getStatus()))
                .collect(Collectors.toList());

        model.addAttribute("interviewApplications", interviewApplications);
        Application application = applicationService.findById(id);
        model.addAttribute("user", user);
        model.addAttribute("applyForm" , application);
        model.addAttribute("company", company);
        return "Company/applicant-interview";
    }
    @GetMapping("/interviewSchedule")
    public String showInterviewScheduleForm(@RequestParam(value = "date" , required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate date, Model model) {

        User user = userService.getLoggedInUser();

        LocalDateTime startDateTime;
        LocalDateTime endDateTime;

        if (date == null) {
            startDateTime = LocalDate.now().atStartOfDay();
            endDateTime = LocalDateTime.of(2030, 1, 1, 0, 0);
        } else {
            startDateTime = date.atStartOfDay();
            endDateTime = date.plusDays(1).atStartOfDay();
        }

        model.addAttribute("user", user);
        List<Application> upcomingApplications = applicationRepository.findApplicationsByDateAndCompany(startDateTime, endDateTime, user.getCompany().getId());
        model.addAttribute("upcomingApplications", upcomingApplications);
        return "Company/interview-schedule";
    }
    @PostMapping("/storeInterviewDetails")
    public ResponseEntity<String> storeInterviewDetails(@RequestParam String interviewDate, @RequestParam String interviewTime) {

        return ResponseEntity.ok("Interview details stored successfully");
    }
    @GetMapping("/viewProfile")
    public String viewProfile(Model model , @RequestParam("id") Integer id ) {
        User user = userService.getLoggedInUser();
        Company company = user.getCompany() ;
        if (id == null) {
            return "error";
        }
        Application application = applicationService.findById(id);
        User user1 = application.getUser();
        model.addAttribute("applyForm" , application);
        model.addAttribute("company", company);
        model.addAttribute("user", user1);
        return "Company/applicant-profile-details";
    }
}
