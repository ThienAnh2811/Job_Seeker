package com.backend.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.backend.dto.LanguageDto;
import com.backend.entity.Language;
import com.backend.entity.Location;
import com.backend.repository.LanguageRepository;
import com.backend.repository.LocationRepository;

@Service
public interface LanguageService {
    public List<Language> getAllLanguages() ; 
    LanguageDto convertToDto(Language language);
}    
