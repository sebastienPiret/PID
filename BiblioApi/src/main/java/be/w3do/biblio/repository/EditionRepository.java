package be.w3do.biblio.repository;

import be.w3do.biblio.model.Edition;
import be.w3do.biblio.model.Livre;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.data.rest.core.annotation.RestResource;

import java.util.Optional;

@RepositoryRestResource(collectionResourceRel = "editions", path = "editions")
public interface EditionRepository extends JpaRepository<Edition, Integer> {

    @RestResource(path = "byIsbn", rel="isbnFindMethod")
    Optional<Livre> findByIsbn(@Param("Isbn") String nom);

}
