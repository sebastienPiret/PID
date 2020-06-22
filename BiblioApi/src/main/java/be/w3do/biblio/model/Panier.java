package be.w3do.biblio.model;

import javax.persistence.*;
import java.math.BigDecimal;

@Entity
@Table(name="Panier", schema = "biblio")
public class Panier {
    private int idPanier;
    private int cotisation;
    private BigDecimal amende;
    private Exemplaire exemplaire;
    private Emprunteur emprunteurById;


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_panier", nullable = false)
    public int getIdPanier() {
        return idPanier;
    }

    public void setIdPanier(int idPanier) {
        this.idPanier = idPanier;
    }

    @Basic
    @Column(name = "cotisation", nullable = true)
    public int getCotisation() {
        return cotisation;
    }

    public void setCotisation(int cotisation) {
        this.cotisation = cotisation;
    }

    @Basic
    @Column(name = "amende", nullable = true)
    public BigDecimal getAmende() {
        return amende;
    }

    public void setAmende(BigDecimal amende) {
        this.amende = amende;
    }

    @ManyToOne()
    @JoinColumn(name = "emprunteurById", referencedColumnName = "id_emprunteur", nullable = false)
    public Emprunteur getEmprunteurById() {
        return emprunteurById;
    }

    public void setEmprunteurById(Emprunteur emprunteurById) {
        this.emprunteurById = emprunteurById;
    }


    @OneToOne()
    @JoinColumn(name = "id_exemplaire", referencedColumnName = "id_exemplaire", nullable = false)
    public Exemplaire getExemplaire() {
        return exemplaire;
    }

    public void setExemplaire(Exemplaire exemplaire) {
        this.exemplaire = exemplaire;
    }
}
