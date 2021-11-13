package com.udacity.jdnd.course3.critter.services;

import com.udacity.jdnd.course3.critter.entity.Pet;
import com.udacity.jdnd.course3.critter.exception.NotFoundException;
import com.udacity.jdnd.course3.critter.repository.PetRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
public class PetService {

    @Autowired
    private PetRepository petRepository;

    public Pet save(Pet pet) {
        return petRepository.save(pet);
    }

    public Pet findById(Long id) {
        return petRepository.findById(id).orElseThrow(() -> new NotFoundException("Pet not found. ID = " + id));
    }

    public List<Pet> findAll() {
        return petRepository.findAll();
    }

    public List<Pet> findAllById(List<Long> id) {
        return petRepository.findAllById(id);
    }

}
