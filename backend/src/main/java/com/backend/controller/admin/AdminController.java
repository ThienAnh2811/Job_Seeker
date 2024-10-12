package com.backend.controller.admin;


import com.backend.dto.CompaniesDto;
import com.backend.dto.CompanyDto;
import com.backend.dto.UniversityDto;
import com.backend.dto.UserDto;
import com.backend.entity.Companies;
import com.backend.entity.Company;
import com.backend.entity.University;
import com.backend.entity.User;
import com.backend.repository.CompaniesRepository;
import com.backend.repository.CompanyRepository;
import com.backend.repository.UniversityRepository;
import com.backend.repository.UserRepository;
import com.backend.service.*;
import com.backend.service.Impl.CompaniesService;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

import static org.springframework.data.jpa.domain.AbstractPersistable_.id;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private UserRepository userRepository;
    @Autowired
    private CompaniesRepository companiesRepository;
    @Autowired
    private CompaniesService companiesService;
    @Autowired
    private UniversityRepository universityRepository;

    @Autowired
    private UniversityService universityService;
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private ProgrammingLanguageService programmingLanguageService;
    @Autowired
    private LevelService levelService;
    @Autowired
    private UserService userService;

    @GetMapping("/users")
    public String getUsers(Model model) {
        model.addAttribute("users", userRepository.findAll());
        model.addAttribute("userDto", new User()); // Add this line
        return "Admin/user";
    }
    @PostMapping("/users/edit/{id}")
    public String updateUser(@PathVariable int id, @ModelAttribute UserDto userDto) {
        userDto.setID(id);
        userService.updateUser(userDto);
        return "redirect:/admin/users";
    }
    @PostMapping("/users/delete/{id}")
    public String deleteUser(@PathVariable int id) {
        userRepository.deleteById(id);
        return "redirect:/admin/users";
    }
    @GetMapping("/companies")
    public String getCompanies(Model model) {
        model.addAttribute("companies", companiesRepository.findAll());
        return "Admin/companies";
    }

    @PostMapping("/companies/add")
    public String addCompany() {
        Companies company = new Companies();
        companiesRepository.save(company);
        return "redirect:/admin/companies";
    }
    @PostMapping("/companies/save/{id}")
    public String saveCompany(@PathVariable int id, @RequestParam("name") String name, @RequestParam("image1") MultipartFile image) {
        try {
            CompaniesDto companyDto = companiesService.createCompanyDto(id, name, image);
            companiesService.saveCompany(companyDto);
            return "redirect:/admin/companies";
        } catch (Exception e) {
            return "redirect:/admin/companies";
        }
    }

    @GetMapping("/companies/delete/{id}")
    public String deleteCompany(@PathVariable int id) {
        companiesRepository.deleteById(id);
        return "redirect:/admin/companies";
    }

    @GetMapping("/universities")
    public String getUniversities(Model model) {
        model.addAttribute("universities", universityRepository.findAll());
        return "Admin/university";
    }
    @PostMapping("/universities/save/{id}")
    public String saveUniversities(@PathVariable int id, @RequestParam("name") String name, @RequestParam("image") MultipartFile image) {
        try {
            UniversityDto universityDto = universityService.createUniversityDto(id, name, image);
            universityService.saveUniversity(universityDto);
            return "redirect:/admin/universities";
        } catch (Exception e) {
            return "redirect:/admin/universities";
        }
    }

    @PostMapping("/universities/add")
    public String addUniversity() {
        University university = universityService.createNewUniversity();
        universityRepository.save(university);
        return "redirect:/admin/universities";
    }

    @PostMapping("/users/add")
    public String addUser(@ModelAttribute User user) {
        userRepository.save(user);
        return "redirect:/admin/users";
    }
    @PostMapping("/universities/delete/{id}")
    public String deleteUniversity(@PathVariable int id) {
        universityRepository.deleteById(id);
        return "redirect:/admin/universities";
    }
    @GetMapping("/update")
    public String updateAllQuantities() {
        categoryService.updateCategoryQuantities();
        programmingLanguageService.updateProgramingLanguageQuantities();
        levelService.updateLevelQuantities();
        return "redirect:/admin/universities";
    }
}