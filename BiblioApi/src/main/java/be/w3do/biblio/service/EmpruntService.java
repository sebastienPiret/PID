package be.w3do.biblio.service;

import be.w3do.biblio.model.Emprunt;
import be.w3do.biblio.repository.EmpruntRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmpruntService {

    @Autowired
    private EmpruntRepository repository;

    public List<Emprunt> list() {
        return repository.findAll();
    }

    public Emprunt add(Emprunt emprunt) {
        return repository.save(emprunt);
    }
}
