package be.w3do.biblio.repository;

import be.w3do.biblio.model.Exemplaire;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.data.rest.core.annotation.RestResource;

import java.util.Optional;

@RepositoryRestResource(collectionResourceRel = "exemplaires", path = "exemplaires")
public interface ExemplaireRepository extends JpaRepository<Exemplaire, Integer> {

    @RestResource(path = "byBiblio", rel="biblioFindMethod")
    Optional<Exemplaire> findByBibliothequeByIdBibliotheque_Nom(@Param("biblio") String nom);
}
