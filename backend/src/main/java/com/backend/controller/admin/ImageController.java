package com.backend.controller.admin;
import com.openhtmltopdf.pdfboxout.PdfRendererBuilder;
import com.backend.entity.*;
import com.backend.repository.*;
import com.backend.service.Impl.CompaniesService;
import freemarker.template.Template;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.ConcurrentModel;
import org.springframework.ui.Model;
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

@RestController
public class ImageController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private PostRepository postRepository;

    @Autowired
    private ApplicationRepository applicationRepository;
    @Autowired
    private CompanyRepository companyRepository;
    @Autowired
    private UniversityRepository universityRepository;
    @Autowired
    private CompaniesService companiesService;
    @Autowired
    private FreeMarkerConfigurer freeMarkerConfigurer;

    @GetMapping("/company/image/{id}")
    public ResponseEntity<byte[]> getCompanyImage(@PathVariable int id) {
        Company company = companyRepository.findById(id).orElseThrow(() -> new IllegalArgumentException("Invalid user Id:" + id));
        byte[] image = company.getAvatar();

        HttpHeaders headers = new HttpHeaders();
        MediaType mediaType = getImageMediaType(image);
        headers.setContentType(mediaType);

        return new ResponseEntity<>(image, headers, HttpStatus.OK);
    }
    @GetMapping("/resume/pdf/{id}")
    public ResponseEntity<byte[]> getResumePdf(@PathVariable int id) {
        try {
            // Get the HTML content of the resume
            String htmlContent = getResumeHtml(id);

            // Convert the HTML content to a PDF
            ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
            PdfRendererBuilder builder = new PdfRendererBuilder();
            builder.withHtmlContent(htmlContent, "");
            builder.toStream(outputStream);
            builder.run();

            // Return the PDF as a byte array
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_PDF);
            headers.add("Content-Disposition", "inline; filename=resume.pdf");

            return new ResponseEntity<>(outputStream.toByteArray(), headers, HttpStatus.OK);
        } catch (IOException e) {
            // Handle the exception
            e.printStackTrace();
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    private String getResumeHtml(int id) {
        try {
            // Fetch the user's data from the database
            User user = userRepository.findById(id).orElseThrow(() -> new IllegalArgumentException("Invalid user Id:" + id));

            // Create a model with the user's data
            Model model = new ConcurrentModel();
            model.addAttribute("user", user);

            // Render the Thymeleaf template with the user's data
            Template template = freeMarkerConfigurer.getConfiguration().getTemplate("resume.html");
            String htmlContent = FreeMarkerTemplateUtils.processTemplateIntoString(template, model.asMap());

            return htmlContent;
        } catch (Exception e) {
            // Handle the exception
            e.printStackTrace();
            return "";
        }
    }
    @GetMapping("/companies/image/{id}")
    public ResponseEntity<byte[]> getCompaniesImage(@PathVariable int id) {
        Companies companies = companiesService.findById(id);
        byte[] image = companies.getImage();

        HttpHeaders headers = new HttpHeaders();
        MediaType mediaType = getImageMediaType(image);
        headers.setContentType(mediaType);

        return new ResponseEntity<>(image, headers, HttpStatus.OK);
    }
    @GetMapping("/application/image/{id}")
    public ResponseEntity<byte[]> getResumeImage(@PathVariable int id) {
        Application application = applicationRepository.findById(id);
        byte[] image = application.getResume();

        HttpHeaders headers = new HttpHeaders();
        MediaType mediaType = getImageMediaType(image);
        headers.setContentType(mediaType);

        return new ResponseEntity<>(image, headers, HttpStatus.OK);
    }

    @GetMapping("/user/image/{id}")
    public ResponseEntity<byte[]> getUserImage(@PathVariable int id) {
        User user = userRepository.findById(id).orElseThrow(() -> new IllegalArgumentException("Invalid user Id:" + id));
        byte[] image = user.getPhoto();

        HttpHeaders headers = new HttpHeaders();
        MediaType mediaType = getImageMediaType(image);
        headers.setContentType(mediaType);

        return new ResponseEntity<>(image, headers, HttpStatus.OK);
    }

    @GetMapping("/post/image/{id}")
    public ResponseEntity<byte[]> getPostImage(@PathVariable int id) {
        Post post = postRepository.findById(id).orElseThrow(() -> new IllegalArgumentException("Invalid post Id:" + id));
        byte[] image = post.getImages();

        HttpHeaders headers = new HttpHeaders();
        MediaType mediaType = getImageMediaType(image);
        headers.setContentType(mediaType);

        return new ResponseEntity<>(image, headers, HttpStatus.OK);
    }
    @GetMapping("/university/image/{id}")
    public ResponseEntity<byte[]> getUniversityImage(@PathVariable int id) {
        University university = universityRepository
                .findById(id).orElseThrow(() -> new IllegalArgumentException("Invalid post Id:" + id));
        byte[] image = university.getPhoto();

        HttpHeaders headers = new HttpHeaders();
        MediaType mediaType = getImageMediaType(image);
        headers.setContentType(mediaType);

        return new ResponseEntity<>(image, headers, HttpStatus.OK);
    }
    @GetMapping("/application/resume/{id}")
    public ResponseEntity<byte[]> getApplicationResume(@PathVariable int id) {
        Application application = applicationRepository.findById(id) ;
        byte[] resume = application.getResume();

        HttpHeaders headers = new HttpHeaders();
        MediaType mediaType = getImageMediaType(resume);
        headers.setContentType(mediaType);

        return new ResponseEntity<>(resume, headers, HttpStatus.OK);
    }
    private MediaType getImageMediaType(byte[] image) {
        if (startsWith(image, new byte[]{(byte) 0x89, (byte) 0x50, (byte) 0x4E, (byte) 0x47})) {
            return MediaType.IMAGE_PNG;
        } else if (startsWithAny(image, Arrays.asList(
                new byte[]{(byte) 0xFF, (byte) 0xD8, (byte) 0xFF, (byte) 0xE0},
                new byte[]{(byte) 0xFF, (byte) 0xD8, (byte) 0xFF, (byte) 0xE1}))) {
            return MediaType.IMAGE_JPEG;
//        } else if (startsWithAny(image, Arrays.asList(
//                new byte[]{(byte) 0x3C, (byte) 0x3F, (byte) 0x78, (byte) 0x6D, (byte) 0x6C},
//                new byte[]{(byte) 0x3C, (byte) 0x3F, (byte) 0x78, (byte) 0x6D, (byte) 0x6C, (byte) 0x20}))) {
//            return MediaType.IMAGE_SVG_XML;
        } else {
            return MediaType.IMAGE_JPEG; // Default to JPEG if format is unknown
        }
    }

    private boolean startsWith(byte[] source, byte[] prefix) {
        if (source.length < prefix.length) {
            return false;
        }
        for (int i = 0; i < prefix.length; i++) {
            if (source[i] != prefix[i]) {
                return false;
            }
        }
        return true;
    }

    private boolean startsWithAny(byte[] source, List<byte[]> prefixes) {
        for (byte[] prefix : prefixes) {
            if (startsWith(source, prefix)) {
                return true;
            }
        }
        return false;
    }
}