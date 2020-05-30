package be.w3do.biblio.repository;

import be.w3do.biblio.model.Auteur;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import java.util.List;

@RepositoryRestResource(collectionResourceRel = "auteurs", path = "auteurs")
public interface AuteurRepository extends JpaRepository<Auteur, Integer> {
    List<Auteur> findByPaysByIdPays_Nom(@Param("nom") String name);
    
}
