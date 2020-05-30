package be.w3do.biblio.model;

import javax.persistence.*;
import javax.validation.constraints.Max;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.PastOrPresent;
import java.util.Date;

@Entity
@Table(name="question", schema = "biblio")
public class Question {
    private int idQuestion;
    @NotBlank(message = "Ne peut pas être vide")
    @Max(value = 100, message = "ne doit pas dépasser 100 charactères")
    private String titre;
    @NotBlank(message = "Ne peut pas être vide")
    private String contenu;
    @PastOrPresent(message = "La date doit être valide")
    private Date date;
    private String reponse;
    private Bibliothecaire bibliothecaireByIdBibliothecaire;
    private Emprunteur emprunteurByIdEmprunteur;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_question", nullable = false)
    public int getIdQuestion() {
        return idQuestion;
    }

    public void setIdQuestion(int idQuestion) {
        this.idQuestion = idQuestion;
    }

    @Basic
    @Column(name = "titre", nullable = false, length = 100)
    public String getTitre() {
        return titre;
    }

    public void setTitre(String titre) {
        this.titre = titre;
    }

    @Basic
    @Column(name = "contenu", nullable = false, length = 2147483647)
    public String getContenu() {
        return contenu;
    }

    public void setContenu(String contenu) {
        this.contenu = contenu;
    }

    @Basic
    @Temporal(TemporalType.DATE)
    @Column(name = "date", nullable = false)
    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    @Basic
    @Column(name = "reponse", nullable = true, length = 2147483647)
    public String getReponse() {
        return reponse;
    }

    public void setReponse(String reponse) {
        this.reponse = reponse;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Question question = (Question) o;

        if (idQuestion != question.idQuestion) return false;
        if (titre != null ? !titre.equals(question.titre) : question.titre != null) return false;
        if (contenu != null ? !contenu.equals(question.contenu) : question.contenu != null) return false;
        if (date != null ? !date.equals(question.date) : question.date != null) return false;
        if (reponse != null ? !reponse.equals(question.reponse) : question.reponse != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = idQuestion;
        result = 31 * result + (titre != null ? titre.hashCode() : 0);
        result = 31 * result + (contenu != null ? contenu.hashCode() : 0);
        result = 31 * result + (date != null ? date.hashCode() : 0);
        result = 31 * result + (reponse != null ? reponse.hashCode() : 0);
        return result;
    }

    @ManyToOne
    @JoinColumn(name = "id_bibliothecaire", referencedColumnName = "id_bibliothecaire", nullable = false)
    public Bibliothecaire getBibliothecaireByIdBibliothecaire() {
        return bibliothecaireByIdBibliothecaire;
    }

    public void setBibliothecaireByIdBibliothecaire(Bibliothecaire bibliothecaireByIdBibliothecaire) {
        this.bibliothecaireByIdBibliothecaire = bibliothecaireByIdBibliothecaire;
    }

    @ManyToOne
    @JoinColumn(name = "id_emprunteur", referencedColumnName = "id_emprunteur", nullable = false)
    public Emprunteur getEmprunteurByIdEmprunteur() {
        return emprunteurByIdEmprunteur;
    }

    public void setEmprunteurByIdEmprunteur(Emprunteur emprunteurByIdEmprunteur) {
        this.emprunteurByIdEmprunteur = emprunteurByIdEmprunteur;
    }
}
