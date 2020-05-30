package be.w3do.biblio.repository;

import be.w3do.biblio.model.Editeur;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

@RepositoryRestResource(collectionResourceRel = "editeurs", path = "editeurs")
public interface EditeurRepository extends JpaRepository<Editeur, Integer> {
}
