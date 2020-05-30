package be.w3do.biblio.model;

import javax.persistence.*;
import javax.validation.constraints.Digits;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;
import java.util.Date;
import java.util.Arrays;
import java.util.List;

@Entity
@Table(name="edition", schema = "biblio")
public class Edition {
    private int idEdition;
    @Past(message = "La date doit être valide")
    private Date datePubli;
    @NotNull
    private String isbn;
    @Digits(integer = 5, fraction = 0)
    @Min(1)
    private int nbrePages;
    private byte[] image;
    private List<Avis> avisByIdEdition;
    private Livre livreByIdLivre;
    private Editeur editeurByIdEditeur;
    private List<Exemplaire> exemplairesByIdEdition;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_edition", nullable = false)
    public int getIdEdition() {
        return idEdition;
    }

    public void setIdEdition(int idEdition) {
        this.idEdition = idEdition;
    }

    @Basic
    @Temporal(TemporalType.DATE)
    @Column(name = "date_publi", nullable = false)
    public Date getDatePubli() {
        return datePubli;
    }

    public void setDatePubli(Date datePubli) {
        this.datePubli = datePubli;
    }

    @Basic
    @Column(name = "ISBN", nullable = false, length = 13)
    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    @Basic
    @Column(name = "nbre_pages", nullable = false)
    public int getNbrePages() {
        return nbrePages;
    }

    public void setNbrePages(int nbrePages) {
        this.nbrePages = nbrePages;
    }

    @Basic
    @Column(name = "image", nullable = true)
    public byte[] getImage() {
        return image;
    }

    public void setImage(byte[] image) {
        this.image = image;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Edition edition = (Edition) o;

        if (idEdition != edition.idEdition) return false;
        if (nbrePages != edition.nbrePages) return false;
        if (datePubli != null ? !datePubli.equals(edition.datePubli) : edition.datePubli != null) return false;
        if (isbn != null ? !isbn.equals(edition.isbn) : edition.isbn != null) return false;
        if (!Arrays.equals(image, edition.image)) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = idEdition;
        result = 31 * result + (datePubli != null ? datePubli.hashCode() : 0);
        result = 31 * result + (isbn != null ? isbn.hashCode() : 0);
        result = 31 * result + nbrePages;
        result = 31 * result + Arrays.hashCode(image);
        return result;
    }


    @OneToMany(mappedBy = "editionByIdEdition")
    public List<Avis> getAvisByIdEdition() {
        return avisByIdEdition;
    }

    public void setAvisByIdEdition(List<Avis> avisByIdEdition) {
        this.avisByIdEdition = avisByIdEdition;
    }


    @ManyToOne()
    @JoinColumn(name = "id_livre", referencedColumnName = "id_livre", nullable = false)
    public Livre getLivreByIdLivre() {
        return livreByIdLivre;
    }

    public void setLivreByIdLivre(Livre livreByIdLivre) {
        this.livreByIdLivre = livreByIdLivre;
    }


    @ManyToOne()
    @JoinColumn(name = "id_editeur", referencedColumnName = "id_editeur", nullable = false)
    public Editeur getEditeurByIdEditeur() {
        return editeurByIdEditeur;
    }

    public void setEditeurByIdEditeur(Editeur editeurByIdEditeur) {
        this.editeurByIdEditeur = editeurByIdEditeur;
    }


    @OneToMany(mappedBy = "editionByIdEdition")
    public List<Exemplaire> getExemplairesByIdEdition() {
        return exemplairesByIdEdition;
    }

    public void setExemplairesByIdEdition(List<Exemplaire> exemplairesByIdEdition) {
        this.exemplairesByIdEdition = exemplairesByIdEdition;
    }
}
