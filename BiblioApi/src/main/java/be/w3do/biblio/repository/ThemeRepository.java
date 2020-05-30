package be.w3do.biblio.repository;

import be.w3do.biblio.model.Theme;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

@RepositoryRestResource(collectionResourceRel = "themes", path = "themes")
public interface ThemeRepository extends JpaRepository<Theme, Integer> {
}
