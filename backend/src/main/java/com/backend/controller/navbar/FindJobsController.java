package com.backend.controller.navbar;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import com.backend.dto.ApplicationDTO;
import com.backend.entity.*;
import com.backend.repository.PostRepository;
import com.backend.service.*;
import jnr.ffi.Struct;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import com.backend.dto.UserDto;

import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.UriComponentsBuilder;

import static org.python.bouncycastle.asn1.ua.DSTU4145NamedCurves.params;

@Controller
@AllArgsConstructor
public class FindJobsController {
    private final ApplicationService applicationService;
    private final CompanyService companyService;
    private final CommentService commentService;
    private final PostRepository postRepository;
    private UserService userService;
    private PostService postService;
    private CategoryService categoryService;
    private LocationService locationService;
    private LevelService levelService;

    @ModelAttribute("userdto")
    public UserDto userResgistrationDto() {
        return new UserDto();
    }

    @PostMapping("/findjobs")
    public String showFindJobsForm(
            @RequestParam("keySearch") String keySearch,
            @RequestParam(name = "sort", required = false) String sort,
            @RequestParam(name = "filterCategory", required = false) String filterCategory,
            @RequestParam(name = "filterLevel", required = false) String filterLevel,
            @RequestParam(name = "filterSalary", required = false) String filterSalary,
            @RequestParam(name = "location", required = false) String location,
            @RequestParam(name = "page" , defaultValue = "1") int page,
            Model model) {

        StringBuilder redirectUrl = new StringBuilder("redirect:/findjobs?keySearch=").append(keySearch);

        if (sort != null) {
            redirectUrl.append("&sort=").append(sort);
        }
        if (filterCategory != null) {
            redirectUrl.append("&filterCategory=").append(filterCategory);
        }
        if (filterLevel != null) {
            redirectUrl.append("&filterLevel=").append(filterLevel);
        }
        if (filterSalary != null) {
            redirectUrl.append("&filterSalary=").append(filterSalary);
        }
        if (location != null) {
            redirectUrl.append("&location=").append(location);
        }
        redirectUrl.append("&page=").append(page);

        return redirectUrl.toString();
    }


    @GetMapping("/findjobs")
    public String showFindJobsForm(Model model,
                                   @RequestParam(defaultValue = "1") int page,
                                   @RequestParam(name = "sort" ,required = false) String sort,
                                   @RequestParam(name="filterCategory" , required = false) String filterCategory,
                                   @RequestParam(name="filterLevel" , required = false) String filterLevel,
                                   @RequestParam(name="filterSalary" , required = false) String filterSalary,
                                   @RequestParam(name="keySearch" , required = false) String keySearch,
                                   @RequestParam(name="location" , required = false) String location) {

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        model.addAttribute("authentication", authentication);
        List<String> categories = null;
        List<String> levels = null;
        List<String> salaries = null;
        if (filterCategory != null && !filterCategory.isEmpty()) {
            categories = Arrays.asList(filterCategory.split(","));
        }
        if (filterLevel != null && !filterLevel.isEmpty()) {
            levels = Arrays.asList(filterLevel.split(","));
        }
        if (filterSalary != null && !filterSalary.isEmpty()) {
            salaries = Arrays.asList(filterSalary.split(","));
        }
        try {
            Pageable pageable;
            if ("salary".equals(sort)) {
                pageable = PageRequest.of(page - 1, 6, Sort.by("maxSalary").descending());
            } else {
                pageable = PageRequest.of(page - 1, 6, Sort.by("datePosted").descending());
            }
            Page<Post> postPage = postService.getAllPosts(pageable, categories, levels, salaries, keySearch, location);
            postService.getPostsAndSetDefaults();
            List<Level> allLevels = levelService.getAllLevel();
            List<Category> allCategories = categoryService.getAllCategories();
            List<Location> locations = locationService.getAllLocations();
            model.addAttribute("categories", allCategories);
            model.addAttribute("page", postPage);
            model.addAttribute("locations", locations);
            model.addAttribute("levels", allLevels);
            return "find-jobs";
        } catch(Exception e) {
            model.addAttribute("errorMessage", e.getMessage());
            return "find-jobs";
        }
    }



    @PostMapping("/addComment")
    public String addComment(@RequestParam String content, @RequestParam Integer postId, Authentication authentication) {
        User user = userService.getUserbyEmail(authentication.getName());
        Post post = postService.getPostById(postId);

        Comment comment = new Comment();
        comment.setContent(content);
        comment.setUser(user);
        comment.setPost(post);

        commentService.saveComment(comment);

        return "redirect:/jobdetails?id=" + postId;
    }
    @PostMapping("/deleteComment")
    public String deleteComment(@RequestParam Long commentId, Authentication authentication) {
        User user = userService.getUserbyEmail(authentication.getName());
        Comment comment = commentService.getCommentById(commentId);

        commentService.deleteComment(comment);

        return "redirect:/jobdetails?id=" + comment.getPost().getId();
    }

    @PostMapping("/findCompany")
    public String searchCompany(@RequestParam(name ="query") String keySearch) {
        return "redirect:/findCompany?query=" + keySearch;
    }

    @GetMapping("/findCompany")
    public String findCompany(Model model, @RequestParam(name="query" , required = false) String keySearch) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        model.addAttribute("authentication", authentication);
        try {
            List<Company> companies;
            if (keySearch != null && !keySearch.isEmpty()) {
                companies = companyService.searchCompany(keySearch);
            } else {
                companies = companyService.getAllCompanies();
            }
            model.addAttribute("companies", companies);
            return "company-search";
        } catch (Exception e) {
            model.addAttribute("errorMessage", e.getMessage());
            return "error";
        }
    }
    @GetMapping("/")
    public String getHighChart() {
        return "chart";
    }

    @GetMapping("/aboutCompany")
    public String aboutCompany(Model model , @RequestParam("id") Integer id ) {
        if (id == null) {
            return "find-jobs";
        }
        try {
            Company company = companyService.getCompanyById(id);
            model.addAttribute("company", company);
            return "company-profile";
        } catch (Exception e) {
            model.addAttribute("errorMessage", e.getMessage());
            return "error";
        }
    }
}
