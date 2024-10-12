package com.backend.entity;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "education_detail")
@Data
@NoArgsConstructor
public class Education {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @ManyToOne
    @JoinColumn(name = "user_id", insertable = true)
    private User user;

    @Column(name = "certificate_degree_name")
    private String certificateDegreeName;

    @Column(name = "major")
    private String major;

    @ManyToOne
    @JoinColumn(name = "university_id")
    private University university;

    @Column(name= "start_date")
    private String startDate;

    @Column(name= "grad_date")
    private String gradDate;
}
