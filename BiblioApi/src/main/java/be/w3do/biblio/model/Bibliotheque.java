package be.w3do.biblio.model;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name="bibliotheque", schema = "biblio")
public class Bibliotheque {
    private int idBibliotheque;
    private String nom;
    private short actif;
    private Adresse adresseByIdAdresse;
    private List<Exemplaire> exemplairesByIdBibliotheque;
    private List<Paiement> paiementsByIdBibliotheque;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_bibliotheque", nullable = false)
    public int getIdBibliotheque() {
        return idBibliotheque;
    }

    public void setIdBibliotheque(int idBibliotheque) {
        this.idBibliotheque = idBibliotheque;
    }

    @Basic
    @Column(name = "nom", nullable = false, length = 45)
    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    @Basic
    @Column(name = "actif", nullable = false)
    public short getActif() {
        return actif;
    }

    public void setActif(short actif) {
        this.actif = actif;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Bibliotheque that = (Bibliotheque) o;

        if (idBibliotheque != that.idBibliotheque) return false;
        if (actif != that.actif) return false;
        if (nom != null ? !nom.equals(that.nom) : that.nom != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = idBibliotheque;
        result = 31 * result + (nom != null ? nom.hashCode() : 0);
        result = 31 * result + (int) actif;
        return result;
    }

    @ManyToOne
    @JoinColumn(name = "id_adresse", referencedColumnName = "id_adresse", nullable = false)
    public Adresse getAdresseByIdAdresse() {
        return adresseByIdAdresse;
    }

    public void setAdresseByIdAdresse(Adresse adresseByIdAdresse) {
        this.adresseByIdAdresse = adresseByIdAdresse;
    }

    @OneToMany(mappedBy = "bibliothequeByIdBibliotheque")
    public List<Exemplaire> getExemplairesByIdBibliotheque() {
        return exemplairesByIdBibliotheque;
    }

    public void setExemplairesByIdBibliotheque(List<Exemplaire> exemplairesByIdBibliotheque) {
        this.exemplairesByIdBibliotheque = exemplairesByIdBibliotheque;
    }

    @OneToMany(mappedBy = "biblioByIdBibliotheque")
    public List<Paiement> getPaiementsByIdBibliotheque() {
        return paiementsByIdBibliotheque;
    }

    public void setPaiementsByIdBibliotheque(List<Paiement> paiementsByIdBibliotheque) {
        this.paiementsByIdBibliotheque = paiementsByIdBibliotheque;
    }
}
