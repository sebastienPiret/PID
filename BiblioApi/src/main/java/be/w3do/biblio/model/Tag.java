package be.w3do.biblio.model;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name="tag", schema = "biblio")
public class Tag {
    private Integer idTag;
    private String nom;
    private List<Livre> livres;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_tag", nullable = false)
    public Integer getIdTag() {
        return idTag;
    }
    public void setIdTag(Integer id) {
        this.idTag = id;
    }

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

        Tag tag = (Tag) o;

        if (nom != null ? !nom.equals(tag.nom) : tag.nom != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        return nom != null ? nom.hashCode() : 0;
    }

    @ManyToMany
    @JoinTable(name="etiquete", schema = "biblio", joinColumns = @JoinColumn(name = "id_tag"), inverseJoinColumns = @JoinColumn(name = "id_livre"))
    public List<Livre> getLivres() {
        return this.livres;
    }

    public void setLivres(List<Livre> livres) {
        this.livres = livres;
    }
}
