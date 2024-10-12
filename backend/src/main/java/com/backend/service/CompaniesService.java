package com.backend.service;

import com.backend.dto.CompaniesDto;
import com.backend.entity.Companies;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@Service
public interface CompaniesService {
    List<Companies> findAll();
    Companies findById(int id);
    void saveCompany(CompaniesDto companies);
    CompaniesDto createCompanyDto(int id, String name, MultipartFile image) throws IOException;
}
