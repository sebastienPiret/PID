package be.w3do.biblio.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import javax.persistence.*;
import javax.validation.constraints.*;
import java.util.Collection;

@Entity
@Table(name="emprunteur", schema = "biblio")
public class Emprunteur implements UserDetails {
    private long idEmprunteur;
    @NotBlank(message = "ne peut pas être vide")
    private String nom;
    private String prenom;
    @NotBlank(message = "ne peut pas être vide")
    @Email(message = "doit être valide")
    private String mail;
    @NotBlank(message = "ne peut pas être vide")
    private String mdp;
    @Max(value = 100, message = "ne doit pas dépasser 100 charactères")
    private String pseudo;
    private String tel;
    private short actif;
    private String role = "USER";




    private Collection<Avis> avisByIdEmprunteur;

    private Collection<Emprunt> empruntsByIdEmprunteur;
    private Adresse adresseByIdAdresse;

    private Collection<Exemplaire> exemplairesByIdEmprunteur;

    private Collection<Paiement> paiementsByIdEmprunteur;

    private Collection<Question> questionsByIdEmprunteur;

    private Collection<Panier> panier;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_emprunteur", nullable = false)
    public long getIdEmprunteur() {
        return idEmprunteur;
    }

    public void setIdEmprunteur(long idEmprunteur) {
        this.idEmprunteur = idEmprunteur;
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
    @Column(name = "prenom", nullable = true, length = 60)
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
    @Column(name = "pseudo", nullable = true, length = 100)
    public String getPseudo() {
        return pseudo;
    }

    public void setPseudo(String pseudo) {
        this.pseudo = pseudo;
    }

    @Basic
    @Column(name = "tel", nullable = true, length = 15)
    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
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

        Emprunteur that = (Emprunteur) o;

        if (idEmprunteur != that.idEmprunteur) return false;
        if (actif != that.actif) return false;
        if (nom != null ? !nom.equals(that.nom) : that.nom != null) return false;
        if (mail != null ? !mail.equals(that.mail) : that.mail != null) return false;
        if (mdp != null ? !mdp.equals(that.mdp) : that.mdp != null) return false;
        if (pseudo != null ? !pseudo.equals(that.pseudo) : that.pseudo != null) return false;
        if (tel != null ? !tel.equals(that.tel) : that.tel != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        long result = idEmprunteur;
        result = 31 * result + (nom != null ? nom.hashCode() : 0);
        result = 31 * result + (mail != null ? mail.hashCode() : 0);
        result = 31 * result + (mdp != null ? mdp.hashCode() : 0);
        result = 31 * result + (pseudo != null ? pseudo.hashCode() : 0);
        result = 31 * result + (tel != null ? tel.hashCode() : 0);
        result = 31 * result + (int) actif;
        return (int)result;
    }

    @OneToMany(mappedBy = "emprunteurByIdEmprunteur")
    public Collection<Avis> getAvisByIdEmprunteur() {
        return avisByIdEmprunteur;
    }

    public void setAvisByIdEmprunteur(Collection<Avis> avisByIdEmprunteur) {
        this.avisByIdEmprunteur = avisByIdEmprunteur;
    }

    @OneToMany(mappedBy = "emprunteurByIdEmprunteur")
    public Collection<Emprunt> getEmpruntsByIdEmprunteur() {
        return empruntsByIdEmprunteur;
    }

    public void setEmpruntsByIdEmprunteur(Collection<Emprunt> empruntsByIdEmprunteur) {
        this.empruntsByIdEmprunteur = empruntsByIdEmprunteur;
    }

    @ManyToOne
    @JoinColumn(name = "id_adresse", referencedColumnName = "id_adresse", nullable = true)
    public Adresse getAdresseByIdAdresse() {
        return adresseByIdAdresse;
    }

    public void setAdresseByIdAdresse(Adresse adresseByIdAdresse) {
        this.adresseByIdAdresse = adresseByIdAdresse;
    }

    @OneToMany(mappedBy = "emprunteurByIdEmprunteur")
    public Collection<Exemplaire> getExemplairesByIdEmprunteur() {
        return exemplairesByIdEmprunteur;
    }

    public void setExemplairesByIdEmprunteur(Collection<Exemplaire> exemplairesByIdEmprunteur) {
        this.exemplairesByIdEmprunteur = exemplairesByIdEmprunteur;
    }

    @OneToMany(mappedBy = "emprunteurByIdEmprunteur")
    public Collection<Paiement> getPaiementsByIdEmprunteur() {
        return paiementsByIdEmprunteur;
    }

    public void setPaiementsByIdEmprunteur(Collection<Paiement> paiementsByIdEmprunteur) {
        this.paiementsByIdEmprunteur = paiementsByIdEmprunteur;
    }

    @OneToMany(mappedBy = "emprunteurByIdEmprunteur")
    public Collection<Question> getQuestionsByIdEmprunteur() {
        return questionsByIdEmprunteur;
    }

    public void setQuestionsByIdEmprunteur(Collection<Question> questionsByIdEmprunteur) {
        this.questionsByIdEmprunteur = questionsByIdEmprunteur;
    }

    @OneToMany(mappedBy = "emprunteurById")
    public Collection<Panier> getPanier() {
        return panier;
    }

    public void setPanier(Collection<Panier> panier) {
        this.panier = panier;
    }

    @Override
    @Transient
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return null;
    }

    @Override
    @Transient
    public String getPassword() {
        return this.mdp;
    }

    @Override
    @Transient
    public String getUsername() {
        return this.mail;
    }

    @Override
    @Transient
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    @Transient
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    @Transient
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    @Transient
    public boolean isEnabled() {
        return true;
    }

    @Transient
    public String getRole() {
        return this.role;
    }

    public void setRole(String role) {
        //this.role = role;
    }


}
