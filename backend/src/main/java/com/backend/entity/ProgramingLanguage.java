package com.backend.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "programming_languages")
@Data
@NoArgsConstructor
public class ProgramingLanguage {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "name",nullable = false)
    private String name;

    @Column(name = "quantity",nullable = false)
    private int quantity;


    public ProgramingLanguage(int iD, String Name , int Quantity){
        id = iD ;
        name = Name;
        quantity = Quantity;
    }
}
