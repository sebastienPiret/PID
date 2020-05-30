package be.w3do.biblio.repository;

import be.w3do.biblio.model.Emprunt;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

@RepositoryRestResource(collectionResourceRel = "emprunts", path = "emprunts")
public interface EmpruntRepository extends JpaRepository<Emprunt, Integer> {
}
