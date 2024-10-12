package com.backend.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.io.Serializable;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserDto implements Serializable {
    private int ID;
    private String Email;
    private String UserDisplayName;
    private String Password;
    private String CheckPass;
    private String Role ;
    public UserDto(String email, String userDisplayName, String password , String role) {
        Email = email;
        UserDisplayName = userDisplayName;
        Password = password;
        Role =role ;
    }
    private String bio;
    private String location;
    private String github;
    private String linkedin;
    private String major;
    private String contactNumber;
    private String socialLink;
}
