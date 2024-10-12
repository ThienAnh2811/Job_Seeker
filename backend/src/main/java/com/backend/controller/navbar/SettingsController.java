package com.backend.controller.navbar;

import com.backend.dto.ExperienceDto;
import com.backend.entity.*;
import com.backend.service.*;
import com.backend.service.Impl.CompaniesService;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

    @Controller
    public class SettingsController {

        private final UserService userService;
        private final LocationService locationService;
        private final CompanyService companyService;
        private final UniversityService universityService;
        private final EducationService educationService;
        private final CompaniesService companiesService;
        private final ExperienceService experienceService;

        public SettingsController(UserService userService, LocationService locationService, CompanyService companyService, UniversityService universityService, EducationService educationService, CompaniesService companiesService, ExperienceService experienceService) {
            this.userService = userService;
            this.locationService = locationService;
            this.companyService = companyService;
            this.universityService = universityService;
            this.educationService = educationService;
            this.companiesService = companiesService;
            this.experienceService = experienceService;
        }

        @GetMapping("/settings")
        public String getSettings(Model model , @ModelAttribute("experience")ExperienceDto experienceDto){
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            List<University> universities = universityService.getAllUniversities();
            List<Companies> companies = companiesService.findAll();
            model.addAttribute("companies", companies);
            model.addAttribute("UniversityId", universities.get(1).getId());
            if (authentication != null && authentication.getPrincipal() instanceof UserDetails userDetails) {
                User userLoggedIn = userService.getLoggedInUser();
                if (userLoggedIn.getRole().equals("company")) {
                    model.addAttribute("companyLoggedIn", userLoggedIn.getCompany());
                    return "Company/settings-overview";
                } else {
                    List<Location> locations = locationService.getAllLocations();
                    model.addAttribute("universities", universities);
                    model.addAttribute("user", userLoggedIn);
                    model.addAttribute("locations", locations);
                    return "settings-account-settings";
                }
            }
            return "redirect:/login";
        }
        @PostMapping("/settings")
        public String postSettings(@ModelAttribute("companyLoggedIn") Company formCompany, @ModelAttribute("user") User user,
                                   Authentication auth, @RequestParam(value = "avatarFile" ,required = false) MultipartFile avatarFile, Model model,
                                   @RequestParam(value = "UniversityId" ,required = false) Integer UniversityId,
                                   @RequestParam(value = "MajorUni" ,required = false) String MajorUni,
                                   @RequestParam(value = "Degree" ,required = false) String Degree,
                                   @RequestParam(value = "startDate" ,required = false) String startDate,
                                   @RequestParam(value = "endDate" ,required = false) String endDate,
                                   @ModelAttribute("experience")ExperienceDto experienceDto) throws IOException, IOException {
            User currentUser = userService.getLoggedInUser();
            if (avatarFile != null && !avatarFile.isEmpty()) {
                currentUser.setPhoto(avatarFile.getBytes());
            }
            if (currentUser.getRole().equals("company")) {
                Company existingCompany = currentUser.getCompany();
                companyService.updateCompany(existingCompany, formCompany, avatarFile);
                model.addAttribute("successMessage", "Company settings saved successfully");
            } else {
                if (UniversityId != null) {
                    Education education = educationService.createAndSaveEducation(UniversityId, currentUser, MajorUni, Degree, startDate, endDate);
                    if (user.getEducationDetail() != null) {
                        user.getEducationDetail().add(education);
                    } else {
                        List<Education> educationList = new ArrayList<>();
                        educationList.add(education);
                        user.setEducationDetail(educationList);
                    }
                }
                else {
                    System.out.print("UniversityId is null");
                }
                userService.updateUser(currentUser, user);
                try {
                    Companies company = companiesService.findById(experienceDto.getCompanyId());
                    if (company != null) {
                        experienceService.saveExperience(experienceDto, currentUser, companiesService);
                    }
                } catch (Exception e) {
                    //TODO : Handle exception
                }

                userService.save(currentUser);
                model.addAttribute("successMessage", "User settings saved successfully");
            }

            return "redirect:/profile";
        }
    }

