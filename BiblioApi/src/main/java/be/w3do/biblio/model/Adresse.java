package be.w3do.biblio.model;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name="adresse", schema = "biblio")
public class Adresse {
    private int idAdresse;
    private String rue;
    private String numero;
    private String cp;
    private String localite;
    private Pays paysByIdPays;
    private List<Bibliotheque> bibliothequesByIdAdresse;
    private List<Emprunteur> emprunteursByIdAdresse;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_adresse", nullable = false)
    public int getIdAdresse() {
        return idAdresse;
    }

    public void setIdAdresse(int idAdresse) {
        this.idAdresse = idAdresse;
    }

    @Basic
    @Column(name = "rue", nullable = true, length = 100)
    public String getRue() {
        return rue;
    }

    public void setRue(String rue) {
        this.rue = rue;
    }

    @Basic
    @Column(name = "numero", nullable = true, length = 4)
    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    @Basic
    @Column(name = "cp", nullable = true, length = 5)
    public String getCp() {
        return cp;
    }

    public void setCp(String cp) {
        this.cp = cp;
    }

    @Basic
    @Column(name = "localite", nullable = true, length = 45)
    public String getLocalite() {
        return localite;
    }

    public void setLocalite(String localite) {
        this.localite = localite;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Adresse adresse = (Adresse) o;

        if (idAdresse != adresse.idAdresse) return false;
        if (rue != null ? !rue.equals(adresse.rue) : adresse.rue != null) return false;
        if (numero != null ? !numero.equals(adresse.numero) : adresse.numero != null) return false;
        if (cp != null ? !cp.equals(adresse.cp) : adresse.cp != null) return false;
        if (localite != null ? !localite.equals(adresse.localite) : adresse.localite != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = idAdresse;
        result = 31 * result + (rue != null ? rue.hashCode() : 0);
        result = 31 * result + (numero != null ? numero.hashCode() : 0);
        result = 31 * result + (cp != null ? cp.hashCode() : 0);
        result = 31 * result + (localite != null ? localite.hashCode() : 0);
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

    @OneToMany(mappedBy = "adresseByIdAdresse")
    public List<Bibliotheque> getBibliothequesByIdAdresse() {
        return bibliothequesByIdAdresse;
    }

    public void setBibliothequesByIdAdresse(List<Bibliotheque> bibliothequesByIdAdresse) {
        this.bibliothequesByIdAdresse = bibliothequesByIdAdresse;
    }

    @OneToMany(mappedBy = "adresseByIdAdresse")
    public List<Emprunteur> getEmprunteursByIdAdresse() {
        return emprunteursByIdAdresse;
    }

    public void setEmprunteursByIdAdresse(List<Emprunteur> emprunteursByIdAdresse) {
        this.emprunteursByIdAdresse = emprunteursByIdAdresse;
    }
}
