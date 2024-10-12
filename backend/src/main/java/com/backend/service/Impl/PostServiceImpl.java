package com.backend.service.Impl;

import java.util.ArrayList;
import java.util.List;
import java.math.BigDecimal;

import com.backend.dto.PostDto;
import com.backend.repository.ApplicationRepository;
import com.backend.repository.LocationRepository;
import com.backend.entity.*;
import com.backend.service.*;
import jakarta.persistence.criteria.Predicate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Lazy;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.social.ResourceNotFoundException;
import org.springframework.stereotype.Service;

import com.backend.repository.PostRepository;

@Service
public class PostServiceImpl implements PostService {

    @Autowired
    private PostRepository postRepository;
    @Autowired
    private LocationRepository locationRepository;
    @Autowired
    private LocationService locationService;
    @Autowired
    private LevelService levelService;

    private CategoryService categoryService;

    @Autowired
    public void setCategoryService(@Lazy CategoryService categoryService) {
        this.categoryService = categoryService;
    }
    @Autowired
    private ProgramingLanguageServiceImpl programingLanguageServiceImpl;
    @Autowired
    private NiceToHavesService niceToHavesService;
    @Autowired
    private ApplicationRepository applicationRepository;
    @Autowired
    private MailService mailService;

    @Override
    public List<Post> getAllPosts() {
        return postRepository.getAllPost();
    }
    @Override
    public List<Post> getAllPostsOrderByDatetime() {
        return postRepository.findAllByOrderByDatePostedDesc();
    }
    @Override
    public void deletePost(Long id) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'deletePost'");
    }  

    @Override
    public Page<Post> getAllPosts(Pageable pageable) {
        return postRepository.findAll(pageable);
    }

    @Override
    public List<Post> getAllPostsOrderBySalaryDes() {
        return postRepository.findAllByOrderByMaxSalaryDesc();
    }


    @Override
    public List<Post> getAllPostsOrderBySalaryAsc() {
       return postRepository.findAllByOrderByMaxSalaryAsc();
    }
    @Override
    public List<Post> getPostByCompany(Company company) {
        return postRepository.findAllByCompany(company);
    }

    @Override
    public Post getPostById(int id) {
       return postRepository.findPostById(id);
    }

    @Override
    public void save(Post post) {
        postRepository.save(post);
    }

    @Override
    public void delete(Post post) {
        postRepository.delete(post);
        for (Application application : post.getApplications()) {
            application.setPost(null);
        }
    }

    @Override
    public void deletePost(int id) {
        Post post = postRepository.findPostById(id);
        List<Application> applications = applicationRepository.findByPostId(post.getId());

        for (Application application : applications) {
            User user = application.getUser();
            String companyName = post.getCompany().getName(); // Get company name

            String subject = "Job Posting Removal Notification - " + post.getTitle();

            String text = String.format(
                    "Dear %s,<br/><br/>" +
                            "We regret to inform you that the job posting for %s at %s has been removed.<br/><br/>" +
                            "We apologize for any inconvenience this may cause. We encourage you to explore other opportunities on our platform.<br/><br/>" +
                            "Thank you for your understanding.<br/><br/>" +
                            "Sincerely,<br/>" +
                            "The %s Team",
                    user.getUserDisplayName(), post.getTitle(), companyName, companyName
            );

            mailService.sendSimpleMessage(user.getEmail(), subject, text);
            applicationRepository.delete(application);
        }

        postRepository.delete(post);
    }


    @Override
    public Page<Post> getAllPosts(Pageable pageable, List<String> filterCategory, List<String> filterLevel, List<String> filterSalary, String keySearch, String location) {
        return postRepository.findAll((root, query, cb) -> {
            List<jakarta.persistence.criteria.Predicate> predicates = new ArrayList<>();

            if (keySearch != null && !keySearch.isEmpty()) {
                predicates.add(cb.like(root.get("content"), "%" + keySearch + "%"));
            }

            if (filterCategory != null && !filterCategory.isEmpty()) {
                // Create a disjunction (OR) condition for multiple categories
                Predicate[] categoryPredicates = filterCategory.stream()
                        .map(category -> cb.equal(root.join("categories").get("name"), category))
                        .toArray(Predicate[]::new);
                predicates.add(cb.or(categoryPredicates));
            }

            if (filterLevel != null && !filterLevel.isEmpty()) {
                Predicate[] levelPredicates = filterLevel.stream()
                        .map(level -> cb.equal(root.get("level").get("name"), level))
                        .toArray(Predicate[]::new);
                predicates.add(cb.or(levelPredicates));
            }

            if (filterSalary != null && !filterSalary.isEmpty()) {
                for (String salaryRange : filterSalary) {
                    if (salaryRange.contains("or above")) {
                        String minSalaryStr = salaryRange.replace("M", "").replace(" or above", "").trim();
                        BigDecimal minSalary = new BigDecimal(minSalaryStr).multiply(BigDecimal.valueOf(1000000));
                        predicates.add(cb.greaterThanOrEqualTo(root.get("maxSalary"), minSalary));
                    } else {
                        String[] parts = salaryRange.replace("M", "").split("->");
                        BigDecimal minSalary = new BigDecimal(parts[0].trim()).multiply(BigDecimal.valueOf(1000000));
                        BigDecimal maxSalary = new BigDecimal(parts[1].trim()).multiply(BigDecimal.valueOf(1000000));
                        predicates.add(cb.between(root.get("maxSalary"), minSalary, maxSalary));
                    }
                }
            }

            if (location != null && !location.isEmpty()) {
                predicates.add(cb.equal(root.get("location").get("name"), location));
            }

            return cb.and(predicates.toArray(new Predicate[0]));
        }, pageable);
    }
    @Override
    public List<String> getPostDetailsContaining(String query) {
        return postRepository.findPostDetailsByQuery(query);
    }

    @Override
    public List<Post> getPostsAndSetDefaults() {
        List<Post> posts = getAllPosts();
        for (Post post : posts) {
            if(post.getCategories().isEmpty()){
                Category category1 = new Category();
                category1.setName("N/A");
                post.getCategories().add(category1);

                Category category2 = new Category();
                category2.setName("N/A");
                post.getCategories().add(category2);
            }
            else if(post.getCategories().size() == 1){
                Category category = post.getCategories().get(0);
                if(category.getName() == null){
                    category.setName("N/A");
                }

                Category category2 = new Category();
                category2.setName("N/A");
                post.getCategories().add(category2);
            }
            if (post.getLocation() == null) {
                post.setLocation(new Location());
            }
            if (post.getLocation().getName() == null) {
                post.getLocation().setName("N/A");
            }
        }
        return posts;
    }

    @Override
    public Post getPostAndSetDefaults(Integer id) {
        Post post = getPostById(id);
        if (post.getLocation() == null) {
            post.setLocation(new Location());
        }
        if (post.getLocation().getName() == null) {
            post.getLocation().setName("N/A");
        }
        return post;
    }

    @Override
    public Post createAndSavePost(PostDto postDto, User userLoggedIn, List<Integer> categoriesID, List<Integer> programmingLanguagesID, List<Integer> niceToHavesID) {
        Post post = new Post(
                userLoggedIn.getCompany().getId(),
                postDto.getMaxSalary().multiply(BigDecimal.valueOf(1000000)),
                postDto.getMinSalary().multiply(BigDecimal.valueOf(1000000)),
                postDto.getPhoneNumber(),
                postDto.getEmail(),
                postDto.getContent(),
                postDto.getImages(),
                postDto.getExperience()
        );
        post.setLocation(locationService.getLocationById(postDto.getLocationId()));
        post.setDatePosted(java.time.LocalDateTime.now());
        post.setTitle(postDto.getTitle());
        post.setLevel(levelService.getLevelById(postDto.getLevelId()));
        List<Category> categoriesSelected = categoryService.getCategoriesByIds(categoriesID);

        List<ProgramingLanguage> languages = programingLanguageServiceImpl.getProgramingLanguageByIds(programmingLanguagesID);
        post.setProgramingLanguages(languages);
        List<NiceToHaves> niceToHavesSelected = niceToHavesService.getNiceToHavesByIds(niceToHavesID);

        post.setContent(postDto.getContent());
        if (categoriesSelected == null) {
            categoriesSelected.add(categoryService.getAllCategories().get(0));
            post.setCategories(categoriesSelected);
        }
        if (languages == null) {
            languages.add(programingLanguageServiceImpl.getAllProgramingLanguages().get(0));
            post.setProgramingLanguages(languages);
        }
        if (niceToHavesSelected == null) {
            niceToHavesSelected.add(niceToHavesService.getAllNiceToHaves().get(0));
            post.setNiceToHaves(niceToHavesSelected);
        }
        save(post);
        return post;
    }

    @Override
    public void setPostInactive(int id) {
        Post post = getPostById(id);
        post.setLive(false);
        save(post);
    }

    @Override
    public void setPostActive(int id) {
        Post post = getPostById(id);
        post.setLive(true);
        save(post);
    }
}
