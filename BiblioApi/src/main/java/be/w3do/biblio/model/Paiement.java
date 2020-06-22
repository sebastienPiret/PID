package be.w3do.biblio.model;

import javax.persistence.*;
import javax.validation.constraints.Digits;
import javax.validation.constraints.PastOrPresent;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

@Entity
@IdClass(PaiementId.class)
@Table(name="paiement", schema = "biblio")
public class Paiement implements Serializable {

     long idEmprunteur;

     int idBibliotheque;
    @PastOrPresent(message = "La date doit être valide")
    private Date dateCoti;
    private short enOrdreCoti;
    @Digits(integer = 5, fraction = 0)
    private Short amende;
    @Digits(integer = 5, fraction = 2)
    private BigDecimal montantAmende;
    private Emprunteur emprunteurByIdEmprunteur;
    private Bibliotheque biblioByIdBibliotheque;

    /*
    @Id
    @Column(name = "id_emprunteur", nullable = false)
    public long getIdEmprunteur() {
        return idEmprunteur;
    }

    public void setIdEmprunteur(long idEmprunteur) {
        this.idEmprunteur = idEmprunteur;
    }

    @Id
    @Column(name = "id_bibliotheque", nullable = false)
    public int getIdBibliotheque() {
        return idBibliotheque;
    }

    public void setIdBibliotheque(int idBibliotheque) {
        this.idBibliotheque = idBibliotheque;
    }

     */

    @Basic
    @Temporal(TemporalType.DATE)
    @Column(name = "date_coti", nullable = false)
    public Date getDateCoti() {
        return dateCoti;
    }

    public void setDateCoti(Date dateCoti) {
        this.dateCoti = dateCoti;
    }

    @Basic
    @Column(name = "en_ordre_coti", nullable = false)
    public short getEnOrdreCoti() {
        return enOrdreCoti;
    }

    public void setEnOrdreCoti(short enOrdreCoti) {
        this.enOrdreCoti = enOrdreCoti;
    }

    @Basic
    @Column(name = "amende", nullable = true)
    public Short getAmende() {
        return amende;
    }

    public void setAmende(Short amende) {
        this.amende = amende;
    }

    @Basic
    @Column(name = "montant_amende", nullable = true, precision = 2)
    public BigDecimal getMontantAmende() {
        return montantAmende;
    }

    public void setMontantAmende(BigDecimal montantAmende) {
        this.montantAmende = montantAmende;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Paiement paiement = (Paiement) o;

        if (idEmprunteur != paiement.idEmprunteur) return false;
        if (idBibliotheque != paiement.idBibliotheque) return false;
        if (enOrdreCoti != paiement.enOrdreCoti) return false;
        if (dateCoti != null ? !dateCoti.equals(paiement.dateCoti) : paiement.dateCoti != null) return false;
        if (amende != null ? !amende.equals(paiement.amende) : paiement.amende != null) return false;
        if (montantAmende != null ? !montantAmende.equals(paiement.montantAmende) : paiement.montantAmende != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        /*
        int result = idEmprunteur;
        result = 31 * result + idBibliotheque;
        result = 31 * result + (dateCoti != null ? dateCoti.hashCode() : 0);
        result = 31 * result + (int) enOrdreCoti;
        result = 31 * result + (amende != null ? amende.hashCode() : 0);
        result = 31 * result + (montantAmende != null ? montantAmende.hashCode() : 0);
        return result;

         */
        return 0;
    }

    @Id
    @ManyToOne
    @JoinColumn(name = "id_emprunteur", referencedColumnName = "id_emprunteur", nullable = false)
    public Emprunteur getEmprunteurByIdEmprunteur() {
        return emprunteurByIdEmprunteur;
    }

    public void setEmprunteurByIdEmprunteur(Emprunteur emprunteurByIdEmprunteur) {
        this.emprunteurByIdEmprunteur = emprunteurByIdEmprunteur;
    }

    @Id
    @ManyToOne
    @JoinColumn(name = "id_bibliotheque", referencedColumnName = "id_bibliotheque", nullable = false)
    public Bibliotheque getBiblioByIdBibliotheque() {
        return biblioByIdBibliotheque;
    }

    public void setBiblioByIdBibliotheque(Bibliotheque biblioByIdBibliotheque) {
        this.biblioByIdBibliotheque = biblioByIdBibliotheque;
    }
}
