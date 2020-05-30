package be.w3do.biblio.model;

import javax.persistence.*;
import javax.validation.constraints.Digits;
import javax.validation.constraints.NotBlank;
import java.math.BigDecimal;

@Entity
@Table(name="exemplaire", schema = "biblio")
public class Exemplaire {
    private int idExemplaire;
    @NotBlank(message = "ne peut pas être vide")
    private String etat;
    @Digits(integer = 5, fraction = 2)
    private BigDecimal prixAchat;
    @NotBlank(message = "ne peut pas être vide")
    private String format;
    private short enStock;
    private short actif;
    private Edition editionByIdEdition;
    private Bibliotheque bibliothequeByIdBibliotheque;
    private Emprunteur emprunteurByIdEmprunteur;
    private Emprunt empruntByIdEmprunt;


    private Panier panierById;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_exemplaire", nullable = false)
    public int getIdExemplaire() {
        return idExemplaire;
    }

    public void setIdExemplaire(int idExemplaire) {
        this.idExemplaire = idExemplaire;
    }

    @Basic
    @Column(name = "etat", nullable = false, length = 15)
    public String getEtat() {
        return etat;
    }

    public void setEtat(String etat) {
        this.etat = etat;
    }

    @Basic
    @Column(name = "prix_achat", nullable = true, precision = 2)
    public BigDecimal getPrixAchat() {
        return prixAchat;
    }

    public void setPrixAchat(BigDecimal prixAchat) {
        this.prixAchat = prixAchat;
    }

    @Basic
    @Column(name = "format", nullable = false, length = 15)
    public String getFormat() {
        return format;
    }

    public void setFormat(String format) {
        this.format = format;
    }

    @Basic
    @Column(name = "en_stock", nullable = false)
    public short getEnStock() {
        return enStock;
    }

    public void setEnStock(short enStock) {
        this.enStock = enStock;
    }

    @Basic
    @Column(name = "actif", nullable = false)
    public short getActif() {
        return actif;
    }

    public void setActif(short actif) {
        this.actif = actif;
    }

    @OneToOne(mappedBy = "exemplaire")
    public Panier getPanierById() {
        return panierById;
    }

    public void setPanierById(Panier panierById) {
        this.panierById = panierById;
    }


    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Exemplaire that = (Exemplaire) o;

        if (idExemplaire != that.idExemplaire) return false;
        if (enStock != that.enStock) return false;
        if (actif != that.actif) return false;
        if (etat != null ? !etat.equals(that.etat) : that.etat != null) return false;
        if (prixAchat != null ? !prixAchat.equals(that.prixAchat) : that.prixAchat != null) return false;
        if (format != null ? !format.equals(that.format) : that.format != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = idExemplaire;
        result = 31 * result + (etat != null ? etat.hashCode() : 0);
        result = 31 * result + (prixAchat != null ? prixAchat.hashCode() : 0);
        result = 31 * result + (format != null ? format.hashCode() : 0);
        result = 31 * result + (int) enStock;
        result = 31 * result + (int) actif;
        return result;
    }

    @ManyToOne
    @JoinColumn(name = "id_edition", referencedColumnName = "id_edition", nullable = false)
    public Edition getEditionByIdEdition() {
        return editionByIdEdition;
    }

    public void setEditionByIdEdition(Edition editionByIdEdition) {
        this.editionByIdEdition = editionByIdEdition;
    }

    @ManyToOne
    @JoinColumn(name = "id_bibliotheque", referencedColumnName = "id_bibliotheque", nullable = false)
    public Bibliotheque getBibliothequeByIdBibliotheque() {
        return bibliothequeByIdBibliotheque;
    }

    public void setBibliothequeByIdBibliotheque(Bibliotheque bibliothequeByIdBibliotheque) {
        this.bibliothequeByIdBibliotheque = bibliothequeByIdBibliotheque;
    }

    @ManyToOne
    @JoinColumn(name = "id_emprunteur", referencedColumnName = "id_emprunteur")
    public Emprunteur getEmprunteurByIdEmprunteur() {
        return emprunteurByIdEmprunteur;
    }

    public void setEmprunteurByIdEmprunteur(Emprunteur emprunteurByIdEmprunteur) {
        this.emprunteurByIdEmprunteur = emprunteurByIdEmprunteur;
    }

    @ManyToOne
    @JoinColumn(name = "id_emprunt", referencedColumnName = "id_emprunt")
    public Emprunt getEmpruntByIdEmprunt() {
        return empruntByIdEmprunt;
    }

    public void setEmpruntByIdEmprunt(Emprunt empruntByIdEmprunt) {
        this.empruntByIdEmprunt = empruntByIdEmprunt;
    }
}
