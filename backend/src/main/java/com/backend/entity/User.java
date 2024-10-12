package com.backend.entity;


import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "user")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class User implements Serializable {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int ID;

    @Column(name = "email",nullable = false)
    private String email;

    @Column(name = "full_name",nullable = false)
    private String UserDisplayName;


    @Column(name = "password",nullable = false)
    private String Password;

    @OneToMany(mappedBy = "user")
    private List<Application> applications;

    @Column(name = "role",nullable = false)
    private String Role;

    @OneToOne
    @JoinColumn(name = "company_id")
    private Company company;
//
//    @ManyToMany(mappedBy = "applicants")
//    private List<Post> appliedPosts;

    @Column(name="dob")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date dob;

    @Column(name = "gender" )
    private Integer gender;

    @OneToOne
    @JoinColumn(name = "location")
    private Location location ;

    @Column(name = "bio" , length = 1000)
    private String bio;

    @Column(name = "photo")
    private byte[] photo;

    @Column(name= "social_links")
    private String socialLink;

    @Column(name= "experience_in_year")
    private Integer experienceInYears;

    @Column(name= "github")
    private String github;

    @Column(name= "linkedin")
    private String linkedin;

    @Column(name= "major")
    private String major;

    @Column(name= "contact_number")
    private String contactNumber;

    @ManyToMany
    @JoinTable(name = "user_nicetohaves", joinColumns = @JoinColumn(name = "user_id"), inverseJoinColumns = @JoinColumn(name = "nicetohave_id"))
    private List<NiceToHaves> niceToHaves;

    @OneToMany(mappedBy = "user")
    private List<Experience> experienceDetail;


    @OneToMany(mappedBy = "user")
    private List<Education> educationDetail;

    public User(String Email, String userDisplayName, String password, String role) {
        email = Email;
        UserDisplayName = userDisplayName;
        Password = password;
        Role = role;
    }
}
