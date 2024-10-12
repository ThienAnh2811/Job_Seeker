package com.backend.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

import java.io.Serializable;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ApplicationDTO implements Serializable {
    private Integer postId;
    private String fullName;
    private String emailAddress;
    private String phoneNumber;
    private String jobTitle;
    private String linkedInUrl;
    private String portfolioUrl;
    private String additionalInformation;
    private MultipartFile resume;
}