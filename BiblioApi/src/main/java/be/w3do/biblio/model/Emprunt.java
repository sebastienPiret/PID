package be.w3do.biblio.model;

import javax.persistence.*;
import javax.validation.constraints.Future;
import javax.validation.constraints.FutureOrPresent;
import java.util.Date;
import java.util.Collection;

@Entity
@Table(name="emprunt", schema = "biblio")
public class Emprunt {
    private int idEmprunt;
    @FutureOrPresent(message = "La date doit être valide")
    private Date dateEmprunt;
    @Future(message = "La date doit être valide")
    private Date dateRetour;
    private Emprunteur emprunteurByIdEmprunteur;
    private Collection<Exemplaire> exemplairesByIdEmprunt;

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
    @Temporal(TemporalType.DATE)
    @Column(name = "date_emprunt", nullable = false)
    public Date getDateEmprunt() {
        return dateEmprunt;
    }

    public void setDateEmprunt(Date dateEmprunt) {
        this.dateEmprunt = dateEmprunt;
    }

    @Basic
    @Temporal(TemporalType.DATE)
    @Column(name = "date_retour", nullable = false)
    public Date getDateRetour() {
        return dateRetour;
    }

    public void setDateRetour(Date dateRetour) {
        this.dateRetour = dateRetour;
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
    @JoinColumn(name = "id_emprunteur", referencedColumnName = "id_emprunteur", nullable = false)
    public Emprunteur getEmprunteurByIdEmprunteur() {
        return emprunteurByIdEmprunteur;
    }

    public void setEmprunteurByIdEmprunteur(Emprunteur emprunteurByIdEmprunteur) {
        this.emprunteurByIdEmprunteur = emprunteurByIdEmprunteur;
    }

    @OneToMany(mappedBy = "empruntByIdEmprunt")
    public Collection<Exemplaire> getExemplairesByIdEmprunt() {
        return exemplairesByIdEmprunt;
    }

    public void setExemplairesByIdEmprunt(Collection<Exemplaire> exemplairesByIdEmprunt) {
        this.exemplairesByIdEmprunt = exemplairesByIdEmprunt;
    }
}
