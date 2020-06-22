package be.w3do.biblio.api;

import be.w3do.biblio.model.Emprunteur;
import be.w3do.biblio.model.Panier;
import be.w3do.biblio.repository.PanierRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

@RestController
public class PanierApi {
    @Autowired
    private PanierRepository rep;

    @PostMapping("/apiAddPanier")
    public Panier panierSubmit(@RequestBody Panier panier) {

        //System.out.println(student.getStudentFirstname()+" "+student.getSubjects().iterator().next().getSubjectName());

        System.out.println(panier);
        System.out.println(panier.getExemplaire().getIdExemplaire());
        System.out.println(panier.getEmprunteurById().getMail());
        try{
            rep.save(panier);
        }
        catch (Exception ex) {
            System.out.println(ex.getMessage());
        }


        return panier;
    }
}
