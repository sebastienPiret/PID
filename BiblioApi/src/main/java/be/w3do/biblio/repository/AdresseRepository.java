package be.w3do.biblio.repository;

import be.w3do.biblio.model.Adresse;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

@RepositoryRestResource(collectionResourceRel = "adresses", path = "adresses")
public interface AdresseRepository extends JpaRepository<Adresse, Integer> {
}
