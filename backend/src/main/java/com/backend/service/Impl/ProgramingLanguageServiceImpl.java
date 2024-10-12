package com.backend.service.Impl;

import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;

import com.backend.entity.Post;
import com.backend.repository.PostRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.backend.entity.ProgramingLanguage;
import com.backend.repository.ProgramingLanguageRepository;
import com.backend.service.ProgrammingLanguageService;

@Service
public class ProgramingLanguageServiceImpl implements ProgrammingLanguageService{
    @Autowired
    ProgramingLanguageRepository programingLanguageRepository;
    @Autowired
    private PostRepository postRepository;

    @Override
    public List<ProgramingLanguage> getAllProgramingLanguages() {
        return programingLanguageRepository.findAll();
    }
    @Override
    public List<ProgramingLanguage> getProgramingLanguageByIds(List<Integer> ids) {
        return programingLanguageRepository.findByIdsList(ids);
    }

    @Override
    public void updateProgramingLanguageQuantities() {
        List<Post> posts = postRepository.findAll();

        Map<ProgramingLanguage, Long> postCountByProgramingLanguage = posts.stream()
                .flatMap(post -> post.getProgramingLanguages().stream())
                .collect(Collectors.groupingBy(Function.identity(), Collectors.counting()));

        postCountByProgramingLanguage.forEach((programingLanguage, count) -> {
            programingLanguage.setQuantity(count.intValue());
            programingLanguageRepository.save(programingLanguage);
        });
    }



}
