package com.backend.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@AllArgsConstructor
@Setter
@Getter
public class PredictionForm {
    private int experience;
    private int levelNumber;
    public PredictionForm(Post post) {
        // Initialize all features to 0
        this.experience = post.getExperience();
        this.levelNumber = post.getLevel().getId();
    }
}