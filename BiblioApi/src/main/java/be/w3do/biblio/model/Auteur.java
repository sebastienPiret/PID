package be.w3do.biblio.model;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.List;

@Entity
@Table(name="auteur", schema = "biblio")
public class Auteur {
    private int idAuteur;
    @NotNull
    @Size(min = 1, max=100, message="entre 1 et 100 lettres")
    private String nom;
    @Size(min = 1, max=100, message="entre 1 et 100 lettres")
    private String prenom;
    @Size(min = 1, max=100, message="entre 1 et 100 lettres")
    private String pseudo;
    private Pays paysByIdPays;
    private List<Livre> livres;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_auteur", nullable = false)
    public int getIdAuteur() {
        return idAuteur;
    }

    public void setIdAuteur(int idAuteur) {
        this.idAuteur = idAuteur;
    }

    @Basic
    @Column(name = "nom", nullable = false, length = 100)
    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    @Basic
    @Column(name = "prenom", nullable = true, length = 100)
    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    @Basic
    @Column(name = "pseudo", nullable = true, length = 100)
    public String getPseudo() {
        return pseudo;
    }

    public void setPseudo(String pseudo) {
        this.pseudo = pseudo;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Auteur auteur = (Auteur) o;

        if (idAuteur != auteur.idAuteur) return false;
        if (nom != null ? !nom.equals(auteur.nom) : auteur.nom != null) return false;
        if (prenom != null ? !prenom.equals(auteur.prenom) : auteur.prenom != null) return false;
        if (pseudo != null ? !pseudo.equals(auteur.pseudo) : auteur.pseudo != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = idAuteur;
        result = 31 * result + (nom != null ? nom.hashCode() : 0);
        result = 31 * result + (prenom != null ? prenom.hashCode() : 0);
        result = 31 * result + (pseudo != null ? pseudo.hashCode() : 0);
        return result;
    }

    @ManyToOne
    @JoinColumn(name = "id_pays", referencedColumnName = "id_pays", nullable = false)
    public Pays getPaysByIdPays() {
        return paysByIdPays;
    }

    public void setPaysByIdPays(Pays paysByIdPays) {
        this.paysByIdPays = paysByIdPays;
    }

    @ManyToMany
    @JoinTable(name="ecriture", schema = "biblio", joinColumns = @JoinColumn(name = "id_auteur"), inverseJoinColumns = @JoinColumn(name = "id_livre"))
    public List<Livre> getLivres() {
        return this.livres;
    }

    public void setLivres(List<Livre> livres) {
        this.livres = livres;
    }
}
