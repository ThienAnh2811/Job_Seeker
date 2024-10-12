package com.backend.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.backend.entity.ProgramingLanguage;

@Service
public interface ProgrammingLanguageService {
    List<ProgramingLanguage> getAllProgramingLanguages();
    List<ProgramingLanguage> getProgramingLanguageByIds(List<Integer> ids);
    void updateProgramingLanguageQuantities();
}