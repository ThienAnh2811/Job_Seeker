package com.backend.controller.admin;

import com.backend.service.ExperienceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ExperienceController {

    private final ExperienceService experienceService;

    @Autowired
    public ExperienceController(ExperienceService experienceService) {
        this.experienceService = experienceService;
    }

    @DeleteMapping ("deleteExperience/{id}")
    public ResponseEntity<Void> deleteExperience(@PathVariable("id") int id) {
        experienceService.deleteExperience(id);
        return ResponseEntity.noContent().build();
    }
}