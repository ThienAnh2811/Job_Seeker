package com.backend.service.Impl;

import com.backend.dto.ExperienceDto;
import com.backend.entity.Experience;
import com.backend.entity.User;
import com.backend.repository.ExperienceRepository;
import com.backend.service.ExperienceService;
import org.springframework.stereotype.Service;

@Service
public class ExperienceServiceImpl implements ExperienceService {
    private final ExperienceRepository experienceRepository;

    public ExperienceServiceImpl(ExperienceRepository experienceRepository) {
        this.experienceRepository = experienceRepository;
    }

    @Override
    public void saveExperience(Experience experience) {
        experienceRepository.save(experience);
    }

    @Override
    public Experience dtoToExperience(ExperienceDto experienceDto, User currentUser, com.backend.service.CompaniesService companiesService) {
        Experience experience = new Experience();
        if (experienceDto.getCompanyId() != 0) {
            experience.setCompany(companiesService.findById(experienceDto.getCompanyId()));
        }
        experience.setTitle(experienceDto.getTitle());
        experience.setStartDate(experienceDto.getStartDate());
        experience.setEndDate(experienceDto.getEndDate());
        experience.setUser(currentUser);
        return experience;
    }

    @Override
    public void saveExperience(ExperienceDto experienceDto, User currentUser, com.backend.service.CompaniesService companiesService) {
        Experience experience = dtoToExperience(experienceDto, currentUser, companiesService);
        experienceRepository.save(experience);
    }

    @Override
    public void deleteExperience(int id) {
        experienceRepository.deleteById(id);
    }
}
