package be.w3do.biblio.model;

import javax.persistence.*;
import java.util.Collection;

@Entity
@Table(name="pays", schema = "biblio")
public class Pays {
    private Integer idPays;
    private String nom;
    private Collection<Adresse> adressesByIdPays;
    private Collection<Auteur> auteursByIdPays;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_pays", nullable = false)
    public Integer getIdPays() {
        return idPays;
    }

    public void setIdPays(Integer idPays) {
        this.idPays = idPays;
    }

    @Column(name = "nom", nullable = false, length = 50)
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

        Pays pays = (Pays) o;

        if (idPays != null ? !idPays.equals(pays.idPays) : pays.idPays != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        return idPays != null ? idPays.hashCode() : 0;
    }

    @OneToMany(mappedBy = "paysByIdPays")
    public Collection<Adresse> getAdressesByIdPays() {
        return adressesByIdPays;
    }

    public void setAdressesByIdPays(Collection<Adresse> adressesByIdPays) {
        this.adressesByIdPays = adressesByIdPays;
    }

    @OneToMany(mappedBy = "paysByIdPays")
    public Collection<Auteur> getAuteursByIdPays() {
        return auteursByIdPays;
    }

    public void setAuteursByIdPays(Collection<Auteur> auteursByIdPays) {
        this.auteursByIdPays = auteursByIdPays;
    }
}
