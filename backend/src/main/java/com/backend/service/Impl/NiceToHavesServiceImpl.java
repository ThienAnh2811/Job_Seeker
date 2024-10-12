package com.backend.service.Impl;

import com.backend.entity.NiceToHaves;
import com.backend.repository.NiceToHavesRepository;
import com.backend.service.NiceToHavesService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NiceToHavesServiceImpl implements NiceToHavesService {
    private final NiceToHavesRepository niceToHavesRepository;

    public NiceToHavesServiceImpl(NiceToHavesRepository niceToHavesRepository) {
        this.niceToHavesRepository = niceToHavesRepository;
    }

    @Override
    public List<NiceToHaves> getAllNiceToHaves() {
        return niceToHavesRepository.findAll();
    }
    @Override
    public NiceToHaves getNiceToHavesById(int id) {
        return niceToHavesRepository.getNiceToHavesById(id);
    }
    @Override
    public List<NiceToHaves> getNiceToHavesByIds(List<Integer> ids) {
        return niceToHavesRepository.getNiceToHavesByIds(ids);
    }
}