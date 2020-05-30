package be.w3do.biblio.model;

import javax.persistence.*;
import java.util.Collection;

@Entity
@Table(name="editeur", schema = "biblio")
public class Editeur {
    private int idEditeur;
    private String nom;
    private Collection<Edition> editionsByIdEditeur;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_editeur", nullable = false)
    public int getIdEditeur() {
        return idEditeur;
    }

    public void setIdEditeur(int idEditeur) {
        this.idEditeur = idEditeur;
    }

    @Basic
    @Column(name = "nom", nullable = false, length = 100)
    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Editeur editeur = (Editeur) o;

        if (idEditeur != editeur.idEditeur) return false;
        if (nom != null ? !nom.equals(editeur.nom) : editeur.nom != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = idEditeur;
        result = 31 * result + (nom != null ? nom.hashCode() : 0);
        return result;
    }

    @OneToMany(mappedBy = "editeurByIdEditeur")
    public Collection<Edition> getEditionsByIdEditeur() {
        return editionsByIdEditeur;
    }

    public void setEditionsByIdEditeur(Collection<Edition> editionsByIdEditeur) {
        this.editionsByIdEditeur = editionsByIdEditeur;
    }
}
