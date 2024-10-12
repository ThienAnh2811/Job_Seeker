package com.backend.controller.navbar;

import com.backend.entity.Application;
import com.backend.entity.Company;
import com.backend.entity.User;
import com.backend.service.ApplicationService;
import com.backend.service.CompanyService;
import com.backend.service.UserService;
import lombok.AllArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Controller
@AllArgsConstructor
public class ApplicationController {
    private final ApplicationService applicationService;
    private final CompanyService companyService;
    private final UserService userService;

    @GetMapping("/viewApplicants")
    public String viewApplicants(Model model , @RequestParam("id") Integer id ) {
        User user = userService.getLoggedInUser();
        Company company = user.getCompany() ;
        if (id == null) {
            return "error";
        }
        model.addAttribute("Applicants" , applicationService.findByPostId(id));
        model.addAttribute("currentPost" , companyService.getCompanyById(id)) ;
        model.addAttribute("userLoggedIn" , user);
        model.addAttribute("company", company);
        return "Company/applicants-table-view";
    }

    @GetMapping("/applicant")
    public String viewApplicant(Model model , @RequestParam("id") Integer id ) {
        User user = userService.getLoggedInUser();
        Company company = user.getCompany() ;
        if (id == null) {
            return "error";
        }
        Application application = applicationService.findById(id);
        model.addAttribute("applyForm" , application);
        model.addAttribute("company", company);
        return "Company/applicant-profile";
    }
    @PostMapping("/applicant")
    public String postApplicant(@ModelAttribute("applyForm") Application application) {
        applicationService.save(application);
        return "redirect:/applicant?id=" + application.getId();
    }

    @PostMapping("/updateStatus")
    public String updateStatus(@RequestParam("id") int id, @RequestParam(value = "status", required = false) String status, @RequestParam(value = "interviewDate" , required = false) String interviewDate, @RequestParam(value = "interviewTime" , required = false) String interviewTime) {
        Application application = applicationService.findById(id);
        applicationService.updateApplicationStatus(application, status, interviewDate, interviewTime);
        return "redirect:/applicant?id=" + id;
    }
}
