package com.backend.service.Impl;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.backend.entity.Company;
import com.backend.repository.CompanyRepository;
import com.backend.service.CompanyService;
import org.springframework.web.multipart.MultipartFile;

@Service
public class CompanyServiceImpl implements CompanyService {
    @Autowired
    private CompanyRepository companyRepository;

    @Override
    public void saveCompany(Company company) {
        companyRepository.save(company);
    }

    @Override
    public List<Company> getAllCompanies() {
        return companyRepository.findAll();
    }

    @Override
    public Company getCompanyById(int id) {
        return companyRepository.findById(id).orElse(null);
    }

    @Override
    public Company updateCompany(Company company) {
        return companyRepository.save(company);
    }

    @Override
    public void deleteCompany(int id) {
        companyRepository.deleteById(id);
    }

    @Override
    public List<Company> searchCompany(String keyword) {
        return companyRepository.findAll((root, query, criteriaBuilder) ->
                criteriaBuilder.like(criteriaBuilder.lower(root.get("name")), "%" + keyword.toLowerCase() + "%")
        );
    }

    @Override
    public void updateCompany(Company existingCompany, Company formCompany, MultipartFile avatarFile) throws IOException {
        existingCompany.setCompanyWebsite(formCompany.getCompanyWebsite());
        existingCompany.setAvatar(avatarFile.getBytes());
        existingCompany.setName(formCompany.getName());
        existingCompany.setProfileDescription(formCompany.getProfileDescription());
        saveCompany(existingCompany);
    }
}
