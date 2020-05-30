package be.w3do.biblio.model;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name="theme", schema = "biblio")
public class Theme {
    private Integer idTheme;
    private String nom;
    private List<Livre> livres;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name= "id_theme", nullable = false)
    public Integer getIdTheme() {
        return idTheme;
    }

    public void setIdTheme(Integer id) {
        this.idTheme = id;
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

        Theme theme = (Theme) o;

        if (nom != null ? !nom.equals(theme.nom) : theme.nom != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        return nom != null ? nom.hashCode() : 0;
    }

    @ManyToMany
    @JoinTable(name="organisation", schema = "biblio", joinColumns = @JoinColumn(name = "nom"), inverseJoinColumns = @JoinColumn(name = "id_livre"))
    public List<Livre> getLivres() {
        return this.livres;
    }

    public void setLivres(List<Livre> livres) {
        this.livres = livres;
    }
}
