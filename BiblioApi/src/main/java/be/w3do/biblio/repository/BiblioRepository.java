package be.w3do.biblio.repository;

import be.w3do.biblio.model.Bibliotheque;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

@RepositoryRestResource(collectionResourceRel = "biblios", path = "biblios")
public interface BiblioRepository extends JpaRepository<Bibliotheque, Integer> {

}
