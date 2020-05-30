package be.w3do.biblio.repository;

import be.w3do.biblio.model.Avis;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

@RepositoryRestResource(collectionResourceRel = "avis", path = "avis")
public interface AvisRepository extends JpaRepository<Avis, Integer> {
}
