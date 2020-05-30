package be.w3do.biblio.service;

import be.w3do.biblio.model.Bibliothecaire;
import be.w3do.biblio.model.Emprunteur;
import be.w3do.biblio.repository.BibliothecaireRepository;
import be.w3do.biblio.repository.EmprunteurRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

@Service
public class UserService {
    @Autowired
    private EmprunteurRepository empRep;

    @Autowired
    private BibliothecaireRepository biblioRep;

    public Set<Emprunteur> getSetEmprunteurs() {
        Set<Emprunteur> emp = new HashSet<Emprunteur>((Collection<Emprunteur>) empRep.findAll());
        return emp;
    }

    public Emprunteur addEmprunteur(Emprunteur emp){
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (!(authentication instanceof AnonymousAuthenticationToken)) {
            String currentUserName = authentication.getName();
            System.out.println(currentUserName);
        }
        System.out.println(emp.getUsername());
        Password pw = new Password(emp.getMdp());
        pw.firstHash();
        emp.setMdp(pw.getHash());
        System.out.println(emp.getMdp());
        try{
            empRep.save(emp);
        }
        catch(DataIntegrityViolationException e )
        {
            System.out.println(emp.getRole());
            System.out.println(e.getClass());
            throw e;
        }catch (Exception ex) {
            System.out.println(ex.getMessage());
        }

        return emp;
    }

    public Bibliothecaire addBibliothecaire(Bibliothecaire bibliothecaire){
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (!(authentication instanceof AnonymousAuthenticationToken)) {
            String currentUserName = authentication.getName();
            System.out.println(currentUserName);
        }
        Password pw = new Password(bibliothecaire.getMdp());
        pw.firstHash();
        bibliothecaire.setMdp(pw.getHash());
        try{
            System.out.println(bibliothecaire.getNom());
            biblioRep.save(bibliothecaire);
        }
        catch(DataIntegrityViolationException e )
        {

            System.out.println(e.getClass());
            throw e;
        }

        return bibliothecaire;
    }

    public Emprunteur getEmprunteur(long id){
        Emprunteur emp  = empRep.findById(id).get();
        return emp;
    }
}
