package com.backend.service;

import com.backend.dto.UniversityDto;
import com.backend.entity.University;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

@Service
public interface UniversityService {
    List<University> getAllUniversities();
    University findById(int id);
    UniversityDto createUniversityDto(int id, String name, MultipartFile image) throws IOException;
    void saveUniversity(UniversityDto universityDto);
    University createNewUniversity() ;
}
