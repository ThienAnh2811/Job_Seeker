package com.backend.controller.navbar;

import java.math.BigDecimal;
import java.util.List;

import com.backend.entity.*;
import com.backend.service.*;
import org.springframework.boot.actuate.autoconfigure.metrics.SystemMetricsAutoConfiguration;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.backend.dto.PostDto;
import com.backend.dto.UserDto;

import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@AllArgsConstructor
public class PostAJobsController {
    private final SystemMetricsAutoConfiguration systemMetricsAutoConfiguration;
    private final LanguageService languageService;
    private final NiceToHavesService niceToHavesService;

    @ModelAttribute("userdto")
    public UserDto userDto() {
        return new UserDto();
    }
    @ModelAttribute("postdto")
    public PostDto postDto() {
        return new PostDto();
    }
    private UserService userService;
    private PostService postService;
    private CategoryService categoryService;
    private LocationService locationService;
    private LevelService levelService;
    private ProgrammingLanguageService programingLanguageService ;

    @GetMapping("/postjobs")
    public String getPostJobsForm(@ModelAttribute("userdto") UserDto userDto , Model model) {
        List<Level> levels = levelService.getAllLevel();
        List<Category> categories = categoryService.getAllCategories();
        List<Location> locations = locationService.getAllLocations();
        List<NiceToHaves> niceToHaves = niceToHavesService.getAllNiceToHaves();
        List<ProgramingLanguage> programingLanguages = programingLanguageService.getAllProgramingLanguages() ;
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        User userLoggedIn = userService.getLoggedInUser();
        model.addAttribute("user", userLoggedIn);
        model.addAttribute("locations", locations);
        model.addAttribute("niceToHaves", niceToHaves);
        model.addAttribute("levels", levels);
        model.addAttribute("categories", categories);
        model.addAttribute("programingLanguages" , programingLanguages) ;
        return "Company/post-a-job";
}
    @PostMapping("/postjobs")
    public String postJobs(@ModelAttribute("postdto") PostDto postDto,
                           @RequestParam("categoriesID") List<Integer> categoriesID,
                           @RequestParam("programmingLanguagesID") List<Integer> programmingLanguagesID,
                           @RequestParam("niceToHavesID") List<Integer> niceToHavesID,
                           BindingResult result, RedirectAttributes redirectAttributes, Model model) {
        User userLoggedIn = null;

        userLoggedIn = userService.getLoggedInUser();
        try {
            postService.createAndSavePost(postDto, userLoggedIn, categoriesID, programmingLanguagesID, niceToHavesID);
            model.addAttribute("successMessage", "Job posted successfully");
            return STR."redirect:/jobdetails?id=\{postService.getAllPosts().getLast().getId()}";
        } catch (Exception e) {
            model.addAttribute("errorMessage", "An error occurred while posting the job");
            return "redirect:/home";
        }
    }
}
