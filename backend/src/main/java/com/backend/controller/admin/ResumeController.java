package com.backend.controller.admin;
import com.itextpdf.html2pdf.HtmlConverter;

import com.backend.entity.Application;
import com.backend.entity.User;
import com.backend.repository.UserRepository;
import com.backend.service.ApplicationService;
import com.backend.service.UniversityService;
import com.backend.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.thymeleaf.context.Context;
import org.thymeleaf.context.WebContext;
import org.thymeleaf.spring6.SpringTemplateEngine;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;

@Controller
public class ResumeController {
    private final UserService userService;

    public ResumeController( UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/resume")
    public String resume(@RequestParam("id") Integer id,  Model model) {
        User user = userService.findById(id) ;
        model.addAttribute("app", user);
        return "resume";
    }
//    @Autowired
//    private SpringTemplateEngine templateEngine;
//
//    @Autowired
//    private ServletContext servletContext;
//
//    @GetMapping("/resumePdf")
//    public ResponseEntity<InputStreamResource> resumePdf(@RequestParam("id") Integer id, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
//        User user = userService.findById(id);
//
//        WebContext context = new WebContext(request, response, servletContext);
//        context.setVariable("app", user);
//        String html = templateEngine.process("resume", context);
//
//        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
//        HtmlConverter.convertToPdf(html, outputStream);
//        byte[] pdfBytes = outputStream.toByteArray();
//
//        return ResponseEntity.ok()
//                .contentType(MediaType.APPLICATION_PDF)
//                .body(new InputStreamResource(new ByteArrayInputStream(pdfBytes)));
//    }
}
