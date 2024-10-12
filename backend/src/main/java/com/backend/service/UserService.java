package com.backend.service;


import java.io.IOException;
import java.util.List;

import com.backend.entity.Application;
import org.springframework.stereotype.Service;

import com.backend.dto.UserDto;
import com.backend.entity.User;

@Service
public interface UserService {
    void save(UserDto userDto) throws IOException;
    Boolean checkPasswordUser(String email,String password);
    Boolean checkUserbyEmail(String email);
    User getUserbyEmail(String email);
    List<User> getAllUsers();
    void save(User user);
    User findById(int id);
    List<Application> upComingInterviews(User user);
    User getLoggedInUser();
    User updateUser(User currentUser, User user);
    void updateUser(User user);
    void updateUser(UserDto userDto);
}
