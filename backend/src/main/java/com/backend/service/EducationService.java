package com.backend.service;

import com.backend.entity.Education;
import com.backend.entity.User;
import org.springframework.stereotype.Service;

@Service
public interface EducationService {
    void save(Education education) ;
    void delete(int id);
    Education createAndSaveEducation(Integer universityId, User currentUser, String majorUni, String degree, String startDate, String endDate) ;
}
