package com.backend.service;

import com.backend.dto.ApplicationDTO;
import com.backend.entity.Application;
import com.backend.entity.User;
import com.backend.repository.ApplicationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

@Service
public interface ApplicationService {
    List<Application> findByPostId(int id);
    Application findById(int id) ;
    List<Application> findAllByUser(User user);
    List<Application> findAllByPostCompany(int companyId);
    void save(Application application);
    String createStyledResume(String fullName, String emailAddress, String phoneNumber, String jobTitle, String additionalInformation);
     Map<String, Integer> getStatisticsByCompanyAndTimePeriod(int companyId, LocalDateTime startDate, LocalDateTime endDate) ;
     int countApplicationsByStatusAndCompanyAndTimePeriod(String status, int companyId, LocalDateTime startDate, LocalDateTime endDate) ;
    int countApplicationsByCompanyAndTimePeriod(int companyId, LocalDateTime startDate, LocalDateTime endDate) ;
    Map<String, Integer> getApplicationCountsByLevelAndCompany(int companyId);
    void updateStatus(int id, String status);
    Map<String, Integer> countApplicationStatuses(List<Application> applications);
    void updateApplicationStatus(Application application, String status, String interviewDate, String interviewTime);
    void createAndSaveApplication(ApplicationDTO jobApplicationDto, User userLoggedIn, Integer postId) throws IOException ;
}
