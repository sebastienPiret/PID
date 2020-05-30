package be.w3do.biblio.repository;

import be.w3do.biblio.model.Genre;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

@RepositoryRestResource(collectionResourceRel = "genres", path = "genres")
public interface GenreRepository extends JpaRepository<Genre, Integer> {
}
