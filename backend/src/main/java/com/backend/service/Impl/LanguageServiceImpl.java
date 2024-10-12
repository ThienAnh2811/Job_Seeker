package com.backend.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.backend.dto.LanguageDto;
import com.backend.entity.Language;
import com.backend.repository.LanguageRepository;
import com.backend.service.LanguageService;

@Service
public class LanguageServiceImpl implements LanguageService {

    @Autowired LanguageRepository languageRepository;
    
      @Override
    public LanguageDto convertToDto(Language language) {
        return new LanguageDto(language.getId(), language.getName());
    }
    

    @Override
    public List<Language> getAllLanguages() {
        return languageRepository.findAll();
    }
    
}
