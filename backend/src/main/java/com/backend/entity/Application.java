package com.backend.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;


@Entity
@Table(name = "applications")
@NoArgsConstructor
@AllArgsConstructor
@Data
public class Application {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;



    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    @ManyToOne
    @JoinColumn(name = "post_id")
    private Post post;
    @Version
    private int version;
    @Column(name = "time_applied")
    private LocalDateTime timeApplied;

    @Column(name = "full_name")
    private String fullName;

    @Column(name = "email_address")
    private String emailAddress;

    @Column(name = "phone_number")
    private String phoneNumber;

    @Column(name = "current_previous_job_title")
    private String currentPreviousJobTitle;

    @Column(name = "linkedin_url")
    private String linkedinUrl;

    @Column(name = "github_url")
    private String githubUrl;

    @Column(name = "additional_information")
    private String additionalInformation;

    @Lob
    @Column(name = "resume" , columnDefinition = "LONGBLOB")
    private byte[] resume;

    @Column(name="status" , nullable = true)
    private String status = "Live" ; // Live , Rejected , Interviewing , Hired

    @Column(name="interview_start_time" , nullable = true)
    private LocalDateTime interviewStartTime;
    @Column(name="interview_end_time" , nullable = true)
    private LocalDateTime interviewEndTime;

    public long getDaysSinceApplied() {
        if (timeApplied == null) {
            return 0;
        }
        return ChronoUnit.DAYS.between(timeApplied.toLocalDate(), LocalDate.now());
    }

    public Application(User user , Post post, String fullName, String emailAddress, String phoneNumber, String currentPreviousJobTitle, String linkedinUrl, String githubUrl, String additionalInformation, byte[] resume) {
        this.user = user;
        this.post = post;
        this.fullName = fullName;
        this.emailAddress = emailAddress;
        this.phoneNumber = phoneNumber;
        this.currentPreviousJobTitle = currentPreviousJobTitle;
        this.linkedinUrl = linkedinUrl;
        this.githubUrl = githubUrl;
        this.additionalInformation = additionalInformation;
        this.resume = resume;
        this.timeApplied = LocalDateTime.now();
    }
}