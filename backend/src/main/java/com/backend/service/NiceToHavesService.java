package com.backend.service;

import com.backend.entity.NiceToHaves;
import com.backend.repository.NiceToHavesRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface NiceToHavesService {
    List<NiceToHaves> getAllNiceToHaves() ;
    NiceToHaves getNiceToHavesById(int id);
    List<NiceToHaves> getNiceToHavesByIds(List<Integer> ids);
}
