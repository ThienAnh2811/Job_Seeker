package com.backend.service;

import com.backend.dto.ExperienceDto;
import com.backend.entity.Experience;
import com.backend.entity.User;
import org.springframework.stereotype.Service;

@Service
public interface ExperienceService {
    void saveExperience(Experience experience) ;
    Experience dtoToExperience(ExperienceDto experienceDto, User currentUser, CompaniesService companiesService);
    void saveExperience(ExperienceDto experienceDto, User currentUser, CompaniesService companiesService);
    void deleteExperience(int id);
}
