package be.w3do.biblio.repository;

import be.w3do.biblio.model.Bibliothecaire;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import java.util.Optional;

@RepositoryRestResource(collectionResourceRel = "bibliothecaires", path = "bibliothecaires")
public interface BibliothecaireRepository extends JpaRepository<Bibliothecaire, Long> {

    Optional<Bibliothecaire> findByMail(String mail);
}
