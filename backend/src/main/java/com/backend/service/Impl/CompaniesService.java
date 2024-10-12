package com.backend.service.Impl;

import com.backend.dto.CompaniesDto;
import com.backend.dto.CompanyDto;
import com.backend.entity.Companies;
import com.backend.repository.CompaniesRepository;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@Service
public class CompaniesService implements com.backend.service.CompaniesService {
    private final CompaniesRepository companiesRepository;

    public CompaniesService(CompaniesRepository companiesRepository) {
        this.companiesRepository = companiesRepository;
    }

    @Override
    public List<Companies> findAll() {
        return companiesRepository.findAll();
    }

    @Override
    public Companies findById(int id) {
        return companiesRepository.findById(id);
    }

    @Override
    public void saveCompany(CompaniesDto companyDto)  {
        Companies company = companiesRepository.findById(companyDto.getId());
        if (company == null) {
            company = new Companies();
        }
        company.setName(companyDto.getName());
        if (companyDto.getImage() != null && companyDto.getImage().length > 0) {
            company.setImage(companyDto.getImage());
        } else {
            company.setImage(new byte[0]);
        }
        companiesRepository.save(company);
    }

    @Override
    public CompaniesDto createCompanyDto(int id, String name, MultipartFile image) throws IOException {
        CompaniesDto companyDto = new CompaniesDto();
        companyDto.setId(id);
        companyDto.setName(name);
        if (image != null && !image.isEmpty()) {
            companyDto.setImage(image.getBytes());
        }
        return companyDto;
    }
}
