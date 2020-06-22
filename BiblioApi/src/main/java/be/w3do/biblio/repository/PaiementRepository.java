package be.w3do.biblio.repository;

import be.w3do.biblio.model.Paiement;
import be.w3do.biblio.model.PaiementId;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

@RepositoryRestResource(collectionResourceRel = "paiements", path = "paiements")
public interface PaiementRepository extends JpaRepository<Paiement, PaiementId> {
}
