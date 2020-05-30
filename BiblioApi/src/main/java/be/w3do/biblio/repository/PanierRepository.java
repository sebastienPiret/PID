package be.w3do.biblio.repository;

import be.w3do.biblio.model.Panier;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

@RepositoryRestResource(collectionResourceRel = "paniers", path = "paniers")
public interface PanierRepository extends JpaRepository<Panier, Integer> {
}
