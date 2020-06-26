package be.w3do.biblio.model;

import javax.persistence.*;
import java.util.*;

@Entity
@Table(name="emprunt", schema = "biblio")
public class Emprunt {
    private int idEmprunt;
    private String dateEmprunt;
    private String dateRetour;
    private Emprunteur emprunteurByIdEmprunteur;
    private short isActif = 1;
    private Exemplaire exemplairesByIdEmprunt;


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_emprunt", nullable = false)
    public int getIdEmprunt() {
        return idEmprunt;
    }

    public void setIdEmprunt(int idEmprunt) {
        this.idEmprunt = idEmprunt;
    }

    @Basic
    @Column(name = "date_emprunt", nullable = false)
    public String getDateEmprunt() {
        return dateEmprunt;
    }

    public void setDateEmprunt(String dateEmprunt) {

        this.dateEmprunt = dateEmprunt;
    }

    @Basic
    @Column(name = "date_retour", nullable = false)
    public String getDateRetour() {
        return dateRetour;
    }

    public void setDateRetour(String dateRetour) {

        this.dateRetour = dateRetour;
    }

    @Basic
    @Column(name = "isActif", nullable = false, columnDefinition = "integer default 1")
    public short getIsActif() {
        return isActif;
    }

    public void setIsActif(short isActif) {
        this.isActif = isActif;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Emprunt emprunt = (Emprunt) o;

        if (idEmprunt != emprunt.idEmprunt) return false;
        if (dateEmprunt != null ? !dateEmprunt.equals(emprunt.dateEmprunt) : emprunt.dateEmprunt != null) return false;
        if (dateRetour != null ? !dateRetour.equals(emprunt.dateRetour) : emprunt.dateRetour != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = idEmprunt;
        result = 31 * result + (dateEmprunt != null ? dateEmprunt.hashCode() : 0);
        result = 31 * result + (dateRetour != null ? dateRetour.hashCode() : 0);
        return result;
    }

    @ManyToOne
    @JoinColumn(name = "emprunteurByIdEmprunteur", referencedColumnName = "id_emprunteur", nullable = false)
    public Emprunteur getEmprunteurByIdEmprunteur() {
        return emprunteurByIdEmprunteur;
    }

    public void setEmprunteurByIdEmprunteur(Emprunteur emprunteurByIdEmprunteur) {
        this.emprunteurByIdEmprunteur = emprunteurByIdEmprunteur;
    }

    @OneToOne()
    @JoinColumn(name = "exemplairesByIdEmprunt", referencedColumnName = "id_exemplaire", nullable = false)
    public Exemplaire getExemplairesByIdEmprunt() {
        return exemplairesByIdEmprunt;
    }

    public void setExemplairesByIdEmprunt(Exemplaire exemplairesByIdEmprunt) {
        this.exemplairesByIdEmprunt = exemplairesByIdEmprunt;
    }

}
