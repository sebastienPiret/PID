package be.w3do.biblio.repository;

import be.w3do.biblio.model.Log;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

@RepositoryRestResource(collectionResourceRel = "logs", path = "logs")
public interface LogRepository extends JpaRepository<Log, Integer> {
}
