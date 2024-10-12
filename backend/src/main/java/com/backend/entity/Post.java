package com.backend.entity;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "post")
@Data
@NoArgsConstructor
public class Post {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "company_id")
    private int companyId;

    @Column(name = "title" )
    private String title;

    @ManyToOne
    @JoinColumn(name = "company_id", insertable = false, updatable = false)
    private Company company;

    @Column(name = "max_salary")
    private BigDecimal maxSalary;

    @Column(name = "min_salary")
    private BigDecimal minSalary;

    @Column(name = "phone_number")
    private String phoneNumber;

    @Column(name = "email")
    private String email;

    @Column(name = "content", columnDefinition = "TEXT")
    private String content;

    @Column(name = "images")
    private byte[] images;

    @Column(name = "experience")
    private int experience;

    @Column(name = "date_posted")
    private LocalDateTime datePosted;

    @OneToOne
    @JoinColumn(name = "level_id")
    private Level level;

    @OneToOne
    @JoinColumn(name = "languages_id")
    private Language language;

    @OneToOne
    @JoinColumn(name = "location_id")
    private Location location;

    @Column(name = "is_live")
    private boolean isLive = true;

    @ManyToMany
    @JoinTable(
            name = "applications",
            joinColumns = @JoinColumn(name = "post_id"),
            inverseJoinColumns = @JoinColumn(name = "user_id"))
    private List<User> applicants;

    @OneToMany(mappedBy = "post", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Application> applications = new ArrayList<>();

    @ManyToMany
    @JoinTable(name = "post_category", joinColumns = @JoinColumn(name = "post_id"), inverseJoinColumns = @JoinColumn(name = "category_id"))
    private List<Category> categories;

    @ManyToMany
    @JoinTable(name = "post_programming_languages", joinColumns = @JoinColumn(name = "post_id"), inverseJoinColumns = @JoinColumn(name = "programming_languages_id"))
    private List<ProgramingLanguage> programingLanguages;

    @ManyToMany
    @JoinTable(name = "post_nice_to_haves", joinColumns = @JoinColumn(name = "post_id"), inverseJoinColumns = @JoinColumn(name = "nth_id"))
    private List<NiceToHaves> niceToHaves;


    @OneToMany(mappedBy = "post", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Comment> comments;

    public Post(int CompanyId, BigDecimal maxSalary, BigDecimal minSalary, String phoneNumber, String email,
            String content, byte[] images, int experience) {
        this.companyId = CompanyId;
        this.maxSalary = maxSalary;
        this.minSalary = minSalary;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.content = content;
        this.images = images;
        this.experience = experience;
    }
}