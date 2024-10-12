package com.backend.service;

import java.io.IOException;
import java.util.List;

import org.springframework.stereotype.Service;

import com.backend.entity.Company;
import org.springframework.web.multipart.MultipartFile;

@Service
public interface CompanyService {
    void saveCompany(Company company);
    List<Company> getAllCompanies();
    Company getCompanyById(int id);
    Company updateCompany(Company company);
    void deleteCompany(int id);
    List<Company> searchCompany(String keyword);
    void updateCompany(Company existingCompany, Company formCompany, MultipartFile avatarFile) throws IOException;
}
