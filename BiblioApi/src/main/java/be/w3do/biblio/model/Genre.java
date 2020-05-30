package be.w3do.biblio.model;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

@Entity
@Table(name="genre", schema = "biblio")
public class Genre implements Serializable {
    private Integer idGenre;
    private String nom;
    private List<Livre> livresByNom;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_genre", nullable = false)
    public Integer getIdGenre() {
        return idGenre;
    }
    public void setIdGenre(Integer id) {
        this.idGenre = id;
    }

    @Column(name = "nom", nullable = false, length = 60)
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

        Genre genre = (Genre) o;

        if (nom != null ? !nom.equals(genre.nom) : genre.nom != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        return nom != null ? nom.hashCode() : 0;
    }

    @OneToMany(mappedBy = "genreByNom")
    public List<Livre> getLivresByNom() {
        return livresByNom;
    }

    public void setLivresByNom(List<Livre> livresByNom) {
        this.livresByNom = livresByNom;
    }

}
