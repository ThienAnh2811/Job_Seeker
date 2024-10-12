package com.backend.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@NoArgsConstructor
@Data
public class LevelDto {
    private String name ;
    private int quantity ;
    public LevelDto(String name, int quantity)
    {
        this.name = name;
        this.quantity = quantity;
    }
}

