package be.w3do.biblio.repository;

import be.w3do.biblio.model.Emprunt;
import be.w3do.biblio.model.Emprunteur;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import java.util.Collection;
import java.util.Optional;

@RepositoryRestResource(collectionResourceRel = "emprunts", path = "emprunts")
public interface EmpruntRepository extends JpaRepository<Emprunt, Integer> {

    @Query(value="SELECT e FROM Emprunt e WHERE e.emprunteurByIdEmprunteur.idEmprunteur=?1")
    Collection<Emprunt> findByEmprunteurByIdEmprunteur(long emprunteurByIdEmprunteur);
}
