package be.w3do.biblio.api;

import be.w3do.biblio.model.Emprunt;
import be.w3do.biblio.service.EmpruntService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class EmpruntApi {
    @Autowired
    private EmpruntService service;

    @PostMapping("/addEmprunt")
    public Emprunt addEmprunt(@RequestBody Emprunt emprunt) {
        System.out.println("emprunt Api:");
        // System.out.println(emprunt.getExemplairesByIdEmprunt().get(0));
        service.add(emprunt);

        return emprunt;
    }
}
