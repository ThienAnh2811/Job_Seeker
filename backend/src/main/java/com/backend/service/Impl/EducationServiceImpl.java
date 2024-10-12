package com.backend.service.Impl;

import com.backend.entity.Education;
import com.backend.entity.University;
import com.backend.entity.User;
import com.backend.repository.EducationRepository;
import com.backend.service.EducationService;
import com.backend.service.UniversityService;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service
public class EducationServiceImpl  implements EducationService {
    private final EducationRepository educationRepository;
    private final UniversityService universityService;

    public EducationServiceImpl(EducationRepository educationRepository,  UniversityService universityService) {
        this.educationRepository = educationRepository;
        this.universityService = universityService;
    }

    @Override
    public void save(Education education) {
        educationRepository.save(education);
    }

    @Override
    public void delete(int id) {
        educationRepository.deleteById(id);
    }

    @Override
    public Education createAndSaveEducation(Integer universityId, User currentUser, String majorUni, String degree, String startDate, String endDate) {
        University university = universityService.findById(universityId);
        Education education = new Education();
        education.setUniversity(university);
        education.setUser(currentUser);
        education.setMajor(majorUni);
        education.setCertificateDegreeName(degree);
        education.setStartDate(startDate);
        education.setGradDate(endDate);
        save(education);
        return education;
    }
}
