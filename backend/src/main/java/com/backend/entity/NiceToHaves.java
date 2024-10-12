package com.backend.entity;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;


@Entity
@Table(name = "nice_to_haves")
@Data
@NoArgsConstructor
public class NiceToHaves {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "name",nullable = false)
    private String name;

    public NiceToHaves(int iD, String Name){
        id = iD ;
        name = Name;
    }
}
