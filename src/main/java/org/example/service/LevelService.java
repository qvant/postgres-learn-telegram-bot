package org.example.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.example.domain.Level;
import org.example.repository.LevelRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
@Slf4j
public class LevelService {
    private final LevelRepository repository;

    public List<Level> findAll(){return  repository.findAll();}

    public Optional <Level> getLevel(Long id){
        return repository.findById(id);
    }
}
