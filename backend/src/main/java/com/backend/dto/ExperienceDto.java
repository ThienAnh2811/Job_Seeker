package com.backend.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ExperienceDto {
    private int id;
    private String title;
    private int companyId;
    private String location;
    private String startDate;
    private String endDate;
}
