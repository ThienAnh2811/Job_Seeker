package com.backend.service.Impl;

import com.backend.dto.UniversityDto;
import com.backend.entity.University;
import com.backend.repository.UniversityRepository;
import com.backend.service.UniversityService;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

@Service
public class UniversityServiceImpl implements UniversityService {
    private final UniversityRepository universityRepository;

    public UniversityServiceImpl(UniversityRepository universityRepository) {
        this.universityRepository = universityRepository;
    }

    @Override
    public List<University> getAllUniversities() {
        return universityRepository.findAll();
    }

    @Override
    public University findById(int id) {
        return universityRepository.findUniversityById(id);
    }

    @Override
    public UniversityDto createUniversityDto(int id, String name, MultipartFile image) throws IOException {
        UniversityDto universityDto = new UniversityDto();
        universityDto.setId(id);
        universityDto.setName(name);
        if (image != null && !image.isEmpty()) {
            universityDto.setPhoto(image.getBytes());
        }
        return universityDto;
    }

    @Override
    public void saveUniversity(UniversityDto universityDto) {
        University university = universityRepository.findById(universityDto.getId()).orElse(new University());
        university.setName(universityDto.getName());
        if (universityDto.getPhoto() != null && universityDto.getPhoto().length > 0) {
            university.setPhoto(universityDto.getPhoto());
        } else {
            university.setPhoto(new byte[0]);
        }
        universityRepository.save(university);
    }
    @Override
    public University createNewUniversity() {
        University university = new University();
        university.setName("New University");
        university.setPhoto(new byte[0]);
        return university;
    }
}