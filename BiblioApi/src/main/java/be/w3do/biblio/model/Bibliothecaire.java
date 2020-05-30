package be.w3do.biblio.model;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import java.util.Collection;

@Entity
@Table(name="bibliothecaire", schema = "biblio")
public class Bibliothecaire {
    private long idBibliothecaire;
    @NotBlank(message = "ne peut pas être vide")
    private String nom;
    private String prenom;
    @NotBlank(message = "ne peut pas être vide")
    @Email(message = "doit être valide")
    private String mail;
    @NotBlank(message = "ne peut pas être vide")
    private String mdp;
    private short actif;

    private String role = "ADMIN";
    private Role roleByIdRole;
    private Collection<Question> questionsByIdBibliothecaire;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_bibliothecaire", nullable = false)
    public long getIdBibliothecaire() {
        return idBibliothecaire;
    }

    public void setIdBibliothecaire(long idBibliothecaire) {
        this.idBibliothecaire = idBibliothecaire;
    }

    @Transient
    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
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
    @Column(name = "mail", nullable = false, length = 100)
    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    @Basic
    @Column(name = "mdp", nullable = false, length = 100)
    public String getMdp() {
        return mdp;
    }

    public void setMdp(String mdp) {
        this.mdp = mdp;
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

        Bibliothecaire that = (Bibliothecaire) o;

        if (idBibliothecaire != that.idBibliothecaire) return false;
        if (actif != that.actif) return false;
        if (nom != null ? !nom.equals(that.nom) : that.nom != null) return false;
        if (prenom != null ? !prenom.equals(that.prenom) : that.prenom != null) return false;
        if (mail != null ? !mail.equals(that.mail) : that.mail != null) return false;
        if (mdp != null ? !mdp.equals(that.mdp) : that.mdp != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        long result = idBibliothecaire;
        result = 31 * result + (nom != null ? nom.hashCode() : 0);
        result = 31 * result + (prenom != null ? prenom.hashCode() : 0);
        result = 31 * result + (mail != null ? mail.hashCode() : 0);
        result = 31 * result + (mdp != null ? mdp.hashCode() : 0);
        result = 31 * result + (long) actif;
        return (int)result;
    }

    @ManyToOne
    @JoinColumn(name = "id_role", referencedColumnName = "id_role", nullable = true)
    public Role getRoleByIdRole() {
        return roleByIdRole;
    }

    public void setRoleByIdRole(Role roleByIdRole) {
        this.roleByIdRole = roleByIdRole;
    }

    @OneToMany(mappedBy = "bibliothecaireByIdBibliothecaire")
    public Collection<Question> getQuestionsByIdBibliothecaire() {
        return questionsByIdBibliothecaire;
    }

    public void setQuestionsByIdBibliothecaire(Collection<Question> questionsByIdBibliothecaire) {
        this.questionsByIdBibliothecaire = questionsByIdBibliothecaire;
    }
}
