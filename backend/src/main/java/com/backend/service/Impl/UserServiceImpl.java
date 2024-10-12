package com.backend.service.Impl;

import com.backend.entity.Application;
import com.backend.repository.ApplicationRepository;
import com.backend.service.LocationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import com.backend.dto.UserDto;
import com.backend.entity.Company;
import com.backend.entity.User;
import com.backend.repository.CompanyRepository;
import com.backend.repository.UserRepository;
import com.backend.service.UserService;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository userRepository;
    @Autowired
    private CompanyRepository companyRepository;
    @Autowired
    private ApplicationRepository applicationRepository;
    @Autowired
    private LocationService locationService;

    @Override
    public void save(UserDto userDto) throws IOException {
        LocalDateTime Date = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd.MM.yyyy");
        String creationDate = Date.format(formatter);
        User user = new User(userDto.getEmail(),
                userDto.getUserDisplayName(),
                userDto.getPassword(),
                userDto.getRole());
        userRepository.save(user);        
        if ("company".equals(userDto.getRole())) {
            Company company = new Company();
            File fi = new File("src/main/resources/static/images/defaultCompanyLogo.jpg");
            byte[] fileContent = Files.readAllBytes(fi.toPath());
            company.setAvatar(fileContent);
            company.setUser(user);
            user.setCompany(company);
            companyRepository.save(company);
        }
        
    }

    @Override
    public Boolean checkPasswordUser(String email, String password) {
        User user = userRepository.findUserByEmail(email);
        return user != null && user.getPassword().equals(password);
    }

    @Override
    public Boolean checkUserbyEmail(String email) {
        return userRepository.findUserByEmail(email) != null;
    }

    @Override
    public User getUserbyEmail(String email) {
        return userRepository.getUserByEmail(email);
    }

    @Override
    public java.util.List<User> getAllUsers() {
        return userRepository.getAllUser();
    }
    @Override
    public void save(User user) {
        userRepository.save(user);
    }
    @Override
    public User findById(int id) {
        return userRepository.findById(id).orElse(null);
    }

    @Override
    public List<Application> upComingInterviews(User user) {
        LocalDateTime now = LocalDateTime.now();

        List<Application> allApplications = applicationRepository.findAllByUser(user);

        return allApplications.stream()
                .filter(application -> application.getInterviewStartTime() != null && application.getInterviewStartTime().isAfter(now) && application.getStatus().equals("Interview"))
                .collect(Collectors.toList());
    }

    @Override
    public User getLoggedInUser() {
        Authentication authen = SecurityContextHolder.getContext().getAuthentication();
        User userLoggedIn = null;
        if (authen != null && authen.getPrincipal() instanceof UserDetails userDetails) {
            userLoggedIn = getUserbyEmail(userDetails.getUsername());
        }
        if (userLoggedIn == null) {
            userLoggedIn = new User();
        }
        return userLoggedIn;
    }

    @Override
    public User updateUser(User currentUser, User user) {
        if(user.getUserDisplayName() != null) {
            currentUser.setUserDisplayName(user.getUserDisplayName());
        }
        if(user.getContactNumber() != null) {
            currentUser.setContactNumber(user.getContactNumber());
        }
        if(user.getEmail() != null) {
            currentUser.setEmail(user.getEmail());
        }
        if(user.getDob() != null) {
            currentUser.setDob(user.getDob());
        }
        if(user.getGender() != null) {
            currentUser.setGender(user.getGender());
        }
        if(user.getGithub() != null) {
            currentUser.setGithub(user.getGithub());
        }
        if(user.getLinkedin() != null) {
            currentUser.setLinkedin(user.getLinkedin());
        }
        if(user.getMajor() != null) {
            currentUser.setMajor(user.getMajor());
        }
        if(user.getExperienceInYears() != null) {
            currentUser.setExperienceInYears(user.getExperienceInYears());
        }
        if(user.getLocation() != null ) {
            currentUser.setLocation(locationService.getLocationById(user.getLocation().getId()));
        }
        if(user.getRole() != null) {
            currentUser.setRole(user.getRole());
        }
        if(user.getBio() != null) {
            currentUser.setBio(user.getBio());
        }
        return currentUser;
    }
    @Override
    public void updateUser(User user) {
        User existingUser = userRepository.findById(user.getID()).orElseThrow(() -> new IllegalArgumentException("Invalid user Id:" + user.getID()));
        existingUser.setContactNumber(user.getContactNumber());
        existingUser.setRole(user.getRole());
        existingUser.setDob(user.getDob());
        existingUser.setGender(user.getGender());
        existingUser.setGithub(user.getGithub());
        existingUser.setLinkedin(user.getLinkedin());
        existingUser.setMajor(user.getMajor());
        existingUser.setExperienceInYears(user.getExperienceInYears());
        existingUser.setBio(user.getBio());

        userRepository.save(existingUser);
    }
    @Override
    public void updateUser(UserDto userDto) {
        User existingUser = userRepository.findById(userDto.getID()).orElseThrow(() -> new IllegalArgumentException("Invalid user Id:" + userDto.getID()));

        if (userDto.getBio() != null) {
            existingUser.setBio(userDto.getBio());
        }
        if (userDto.getGithub() != null) {
            existingUser.setGithub(userDto.getGithub());
        }
        if (userDto.getLinkedin() != null) {
            existingUser.setLinkedin(userDto.getLinkedin());
        }
        if (userDto.getMajor() != null) {
            existingUser.setMajor(userDto.getMajor());
        }
        if (userDto.getContactNumber() != null) {
            existingUser.setContactNumber(userDto.getContactNumber());
        }
        if (userDto.getSocialLink() != null) {
            existingUser.setSocialLink(userDto.getSocialLink());
        }
        if (userDto.getRole() != null) {
            existingUser.setRole(userDto.getRole());
        }

        userRepository.save(existingUser);
    }
}
