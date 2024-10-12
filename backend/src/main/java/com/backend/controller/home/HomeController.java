package com.backend.controller.home;

import java.time.DayOfWeek;
import java.time.LocalDateTime;
import java.time.temporal.TemporalAdjusters;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.backend.entity.*;
import com.backend.repository.ApplicationRepository;
import com.backend.service.*;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.backend.dto.UserDto;
import com.backend.repository.PostRepository;

import lombok.AllArgsConstructor;
import org.springframework.web.servlet.handler.AbstractUrlHandlerMapping;

@Controller
@AllArgsConstructor
@SessionAttributes("userdto")
public class HomeController {
    private final LocationService locationService;
    private final LevelService levelService;
    private final CategoryService categoryService;
    private final PostService postService;
    private final UserService userService;
    private final ApplicationService applicationService;
    private final ApplicationRepository applicationRepository;

    @ModelAttribute("userdto")
    public UserDto userDto() {
        return new UserDto();
    }

    @GetMapping("/error")
    public String showErrorPage() {
        return "error";
    }
    @GetMapping("/home")
    public String showHomeForm(@ModelAttribute("userdto") UserDto userDto, Model model) {
        List<Location> locations = locationService.getAllLocations();
        List<Level> levels = levelService.getAllLevel();
        List<Category> categories = categoryService.getAllCategories();
        List<Post> posts = postService.getPostsAndSetDefaults();
        List<Post> posts_newest = postService.getAllPostsOrderByDatetime();
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null && authentication.getPrincipal() instanceof UserDetails userDetails) {
            User userLoggedIn = userService.getUserbyEmail(userDetails.getUsername());
            model.addAttribute("userLoggedIn", userLoggedIn);
        }
        model.addAttribute("posts", posts);
        model.addAttribute("locations", locations);
        model.addAttribute("categories", categories);
        model.addAttribute("levels", levels);
        model.addAttribute("posts_newest", posts_newest);
        return "index";
    }

    @GetMapping("/dashboard")
    public String showDashboard(@ModelAttribute("userdto") UserDto userDto, Model model) {
        Authentication authen = SecurityContextHolder.getContext().getAuthentication();
        User userLoggedIn = null;
        if (authen != null && authen.getPrincipal() instanceof UserDetails userDetails) {
            userLoggedIn = userService.getUserbyEmail(userDetails.getUsername());
        }
        if (userLoggedIn == null) {
            userLoggedIn = new User();
        }

        int numberInterview = 0;
        int numberUnsuitable = 0;
        int numberLive = 0;
        int numberAccepted = 0;
        int numberInterviewCompany = 0;
        int numberUnsuitableCompany = 0;
        int numberLiveCompany = 0;
        int numberAcceptedCompany = 0;


        for (Application application : userLoggedIn.getApplications()) {
            if ("Interview".equals(application.getStatus())) {
                numberInterview++;
            } else if ("Unsuitable".equals(application.getStatus())) {
                numberUnsuitable++;
            }
            else if("Live".equals(application.getStatus())){
                numberLive++;
            }
            else if("Accepted".equals(application.getStatus())){
                numberAccepted++;
            }

        }
        for (Post post : postService.getAllPosts()) {
            if (post.getLocation() == null) {
                post.setLocation(new Location());
            }
            if (post.getLocation().getName() == null) {
                post.getLocation().setName("N/A");
            }
        }
            model.addAttribute("numberAccepted", numberAccepted);
            model.addAttribute("numberLive", numberLive);
            model.addAttribute("numberInterview", numberInterview);
            model.addAttribute("numberUnsuitable", numberUnsuitable);
            model.addAttribute("userLoggedIn", userLoggedIn);
            if (userLoggedIn.getRole().equals("company")) {
                List<Application> applications = applicationService.findAllByPostCompany(userLoggedIn.getCompany().getId());

                for (Application application : applications) {
                    if ("Interview".equals(application.getStatus())) {
                        numberInterviewCompany++;
                    } else if ("Unsuitable".equals(application.getStatus())) {
                        numberUnsuitableCompany++;
                    } else if ("Live".equals(application.getStatus())) {
                        numberLiveCompany++;
                    } else if ("Accepted".equals(application.getStatus())) {
                        numberAcceptedCompany++;
                    }
                }
                LocalDateTime now = LocalDateTime.now();
                LocalDateTime startOfWeek = now.with(TemporalAdjusters.previousOrSame(DayOfWeek.MONDAY));
                LocalDateTime endOfWeek = now.with(TemporalAdjusters.nextOrSame(DayOfWeek.SUNDAY));
                Map<String, Integer> weeklyStatistics = applicationService.getStatisticsByCompanyAndTimePeriod(userLoggedIn.getCompany().getId(), startOfWeek, endOfWeek);

                LocalDateTime startOfMonth = now.with(TemporalAdjusters.firstDayOfMonth());
                LocalDateTime endOfMonth = now.with(TemporalAdjusters.lastDayOfMonth());
                Map<String, Integer> monthlyStatistics = applicationService.getStatisticsByCompanyAndTimePeriod(userLoggedIn.getCompany().getId(), startOfMonth, endOfMonth);

                LocalDateTime startOfYear = now.with(TemporalAdjusters.firstDayOfYear());
                LocalDateTime endOfYear = now.with(TemporalAdjusters.lastDayOfYear());
                Map<String, Integer> yearlyStatistics = applicationService.getStatisticsByCompanyAndTimePeriod(userLoggedIn.getCompany().getId(), startOfYear, endOfYear);

                model.addAttribute("weeklyStatistics", weeklyStatistics);
                model.addAttribute("monthlyStatistics", monthlyStatistics);
                model.addAttribute("yearlyStatistics", yearlyStatistics);

                model.addAttribute("numberAcceptedCompany", numberAcceptedCompany);
                model.addAttribute("numberLiveCompany", numberLiveCompany);
                model.addAttribute("numberInterviewCompany", numberInterviewCompany);
                model.addAttribute("numberUnsuitableCompany", numberUnsuitableCompany);
                Map<String, Integer> applicationCountsByLevel = applicationService.getApplicationCountsByLevelAndCompany(userLoggedIn.getCompany().getId());
                model.addAttribute("applicationCountsByLevel", applicationCountsByLevel);
                return "Company/index";
            }
            List<Application> upComingInterviews = userService.upComingInterviews(userLoggedIn);
            model.addAttribute("upComingInterviews", upComingInterviews);
            System.out.println("Upcoming Interviews are : " + upComingInterviews.size());
            return "applicant";
        }
    @GetMapping("/profile")
    public String showAboutPage(Authentication authentication, Model model) {
        User user = userService.getUserbyEmail(authentication.getName());
        model.addAttribute("user", user);
        if(user.getRole().equals("company"))
        {
            return "Company/profile";
        }

        return "profile";
    }

    @GetMapping("/allApplicants")
    public String showAllApplicants(Model model , Authentication auth) {
        User user = userService.getUserbyEmail(auth.getName());
        List<Application> applications = applicationService.findAllByPostCompany(user.getCompany().getId());
        model.addAttribute("applications", applications);
        model.addAttribute("user", user);
        return "Company/all-applicants";
    }

}
