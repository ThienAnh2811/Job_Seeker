package com.backend.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PostDto {
    private int id; 
    private int companyId;
    private String title ;
    private BigDecimal maxSalary;
    private BigDecimal minSalary;
    private String phoneNumber;
    private String email;
    private String content;
    private byte[] images;
    private int experience;
    private int locationId;
    private int levelId;
    private int languageId; 
    private List<Integer> categoryIds;
    private List<Integer> programmingLanguageIds;
}
