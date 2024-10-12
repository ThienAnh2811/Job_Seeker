package com.backend.controller.admin;

import com.backend.service.EducationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@RestController
public class EducationController {

    private final EducationService educationService;

    @Autowired
    public EducationController(EducationService educationService) {
        this.educationService = educationService;
    }

    @DeleteMapping("/deleteEducation/{id}")
    public ResponseEntity<Void> deleteEducation(@PathVariable("id") int id) {
        educationService.delete(id);
        return ResponseEntity.noContent().build();
    }
}