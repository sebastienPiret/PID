package be.w3do.biblio.model;

import javax.persistence.*;
import javax.validation.constraints.*;
import java.sql.Date;

@Entity
@Table(name="avis", schema = "biblio")
public class Avis {
    private int idAvis;
    @NotBlank(message = "ne peut pas être vide")
    private String avis;
    @Min(value = 1, message = "doit être compris entre 1 et 10")
    @Max(value = 10, message = "doit être compris entre 1 et 10")
    private int note;
    private String commentaire;
    @FutureOrPresent(message = "La date doit être valide")
    private Date date;
    private Short dejaLu;
    private Integer pageAtteinte;
    private Emprunteur emprunteurByIdEmprunteur;
    private Edition editionByIdEdition;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_avis", nullable = false)
    public int getIdAvis() {
        return idAvis;
    }

    public void setIdAvis(int idAvis) {
        this.idAvis = idAvis;
    }

    @Basic
    @Column(name = "avis", nullable = false, length = 255)
    public String getAvis() {
        return avis;
    }

    public void setAvis(String avis) {
        this.avis = avis;
    }

    @Basic
    @Column(name = "note", nullable = false)
    public int getNote() {
        return note;
    }

    public void setNote(int note) {
        this.note = note;
    }

    @Basic
    @Column(name = "commentaire", nullable = true, length = 255)
    public String getCommentaire() {
        return commentaire;
    }

    public void setCommentaire(String commentaire) {
        this.commentaire = commentaire;
    }

    @Basic
    @Column(name = "date", nullable = false)
    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    @Basic
    @Column(name = "deja_lu", nullable = true)
    public Short getDejaLu() {
        return dejaLu;
    }

    public void setDejaLu(Short dejaLu) {
        this.dejaLu = dejaLu;
    }

    @Basic
    @Column(name = "page_atteinte", nullable = true)
    public Integer getPageAtteinte() {
        return pageAtteinte;
    }

    public void setPageAtteinte(Integer pageAtteinte) {
        this.pageAtteinte = pageAtteinte;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Avis avis1 = (Avis) o;

        if (idAvis != avis1.idAvis) return false;
        if (note != avis1.note) return false;
        if (avis != null ? !avis.equals(avis1.avis) : avis1.avis != null) return false;
        if (commentaire != null ? !commentaire.equals(avis1.commentaire) : avis1.commentaire != null) return false;
        if (date != null ? !date.equals(avis1.date) : avis1.date != null) return false;
        if (dejaLu != null ? !dejaLu.equals(avis1.dejaLu) : avis1.dejaLu != null) return false;
        if (pageAtteinte != null ? !pageAtteinte.equals(avis1.pageAtteinte) : avis1.pageAtteinte != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = idAvis;
        result = 31 * result + (avis != null ? avis.hashCode() : 0);
        result = 31 * result + note;
        result = 31 * result + (commentaire != null ? commentaire.hashCode() : 0);
        result = 31 * result + (date != null ? date.hashCode() : 0);
        result = 31 * result + (dejaLu != null ? dejaLu.hashCode() : 0);
        result = 31 * result + (pageAtteinte != null ? pageAtteinte.hashCode() : 0);
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

    @ManyToOne
    @JoinColumn(name = "id_edition", referencedColumnName = "id_edition", nullable = false)
    public Edition getEditionByIdEdition() {
        return editionByIdEdition;
    }

    public void setEditionByIdEdition(Edition editionByIdEdition) {
        this.editionByIdEdition = editionByIdEdition;
    }
}
