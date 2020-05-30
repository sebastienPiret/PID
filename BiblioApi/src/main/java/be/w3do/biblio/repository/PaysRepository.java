package be.w3do.biblio.repository;

import be.w3do.biblio.model.Pays;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

@RepositoryRestResource(collectionResourceRel = "pays", path = "pays")
public interface PaysRepository extends JpaRepository<Pays, Integer> {
}
