package com.backend.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.backend.dto.CategoryDto;
import com.backend.dto.LevelDto;
import com.backend.dto.LocationDto;
import com.backend.dto.UserDto;
import com.backend.entity.Location;
import com.backend.repository.LocationRepository;
import com.backend.repository.UserRepository;

@Controller
@SessionAttributes("userdto")
public class AdminUserController {

    @ModelAttribute("userdto")
    public UserDto userDto() {
        return new UserDto();
    }

    @ModelAttribute("location")
    public LocationDto locationDto() {
        return new LocationDto();
    }
    @ModelAttribute("level")
    public LevelDto levelDto() {
        return new LevelDto();
    }

    @ModelAttribute("category")
    public CategoryDto categoryDto() {
        return new CategoryDto();
    }
    
}
