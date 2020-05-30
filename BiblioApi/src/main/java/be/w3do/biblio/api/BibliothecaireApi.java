package be.w3do.biblio.api;

import be.w3do.biblio.model.Bibliothecaire;
import be.w3do.biblio.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

@RestController
public class BibliothecaireApi {
    @Autowired
    private UserService service;

    @PostMapping("/apiaddbibliothecaire")
    public Bibliothecaire stuformSubmit(@RequestBody Bibliothecaire bibliothecaire) {

        //System.out.println(student.getStudentFirstname()+" "+student.getSubjects().iterator().next().getSubjectName());

        System.out.println(bibliothecaire.getNom());



        try {
            bibliothecaire = service.addBibliothecaire(bibliothecaire);}
        catch (Exception exc) {
            throw new ResponseStatusException(
                    HttpStatus.I_AM_A_TEAPOT, bibliothecaire.getMail() +" already exists", exc);
        }


        //catch(Exception e){
        //	 Error er = new Error("Student"+student.getStudentMail()+"already exist");
        //	 throw er;
        // }

        //model.addAttribute("students", service.getSetStudents());
        return bibliothecaire;
    }
}
