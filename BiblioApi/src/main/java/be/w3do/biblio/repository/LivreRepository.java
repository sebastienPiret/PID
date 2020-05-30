package be.w3do.biblio.repository;

import be.w3do.biblio.model.Livre;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.data.rest.core.annotation.RestResource;

import java.util.Optional;


@RepositoryRestResource(collectionResourceRel = "livres", path = "livres")
public interface LivreRepository  extends JpaRepository<Livre, Integer> {

    @RestResource(path = "byTag", rel="customFindMethod")
    Optional<Livre> findByTagByNom(@Param("Tag") String nom);
    @RestResource(path = "byGenre", rel="genreFindMethod")
    Optional<Livre> findByGenreByNom(@Param("Genre") String nom);
    @RestResource(path = "byTheme", rel="themeFindMethod")
    Optional<Livre> findByThemeByNom(@Param("Theme") String nom);
    @RestResource(path = "byAuteur", rel="auteurFindMethod")
    Optional<Livre> findByAuteurByNom(@Param("Auteur") String nom);
    @RestResource(path = "byTitre", rel="titreFindMethod")
    Optional<Livre> findByTitre(@Param("Titre") String nom);
    @Query(value = "select b.titre from Livre b left join Edition e on e.idEdition = b.idLivre" +
            " left join Editeur r on r.idEditeur = e.idEdition where r.nom = ?1")
    Optional<Livre> findByEditeurName(@Param("editeur") String nomEditeur);
}
