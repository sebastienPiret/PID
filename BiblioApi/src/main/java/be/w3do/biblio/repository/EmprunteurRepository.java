package be.w3do.biblio.repository;

import be.w3do.biblio.model.Emprunteur;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import java.util.Optional;

@RepositoryRestResource(collectionResourceRel = "emprunteurs", path = "emprunteurs")
public interface EmprunteurRepository extends JpaRepository<Emprunteur, Long> {

    Optional<Emprunteur> findByMail(String mail);

}
