package be.w3do.biblio.model;

import com.fasterxml.jackson.annotation.*;

import javax.persistence.*;
import javax.validation.constraints.Max;
import javax.validation.constraints.NotBlank;
import java.util.List;

// TODO https://dzone.com/articles/spring-boot-with-spring-data-jpa
// TODO https://openclassrooms.com/fr/courses/4668056-construisez-des-microservices/5123130-renvoyez-les-bons-codes-et-filtrez-les-reponses
@Entity
@Table(name="livre", schema = "biblio")
public class Livre {
    private int idLivre;
    @NotBlank(message = "ne peut pas être vide")
    @Max(value = 100, message = "ne doit pas dépasser 100 charactères")
    private String titre;
    @NotBlank(message = "ne peut pas être vide")
    @Max(value = 150, message = "ne doit pas dépasser 150 charactères")
    private String sousTitre;
    @NotBlank(message = "ne peut pas être vide")
    private String resume;
    private List<Edition> editionsByIdLivre;
    private Genre genreByNom;
    private List<Theme> themeByNom;
    private List<Tag> tagByNom;
    private List<Auteur> auteurByNom;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_livre", nullable = false)
    public int getIdLivre() {
        return idLivre;
    }

    public void setIdLivre(int idLivre) {
        this.idLivre = idLivre;
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
    @Column(name = "sous_titre", nullable = true, length = 150)
    public String getSousTitre() {
        return sousTitre;
    }

    public void setSousTitre(String sousTitre) {
        this.sousTitre = sousTitre;
    }

    @Basic
    @Column(name = "resume", nullable = true, length = 2147483647)
    public String getResume() {
        return resume;
    }

    public void setResume(String resume) {
        this.resume = resume;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Livre livre = (Livre) o;

        if (idLivre != livre.idLivre) return false;
        if (titre != null ? !titre.equals(livre.titre) : livre.titre != null) return false;
        if (sousTitre != null ? !sousTitre.equals(livre.sousTitre) : livre.sousTitre != null) return false;
        if (resume != null ? !resume.equals(livre.resume) : livre.resume != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = idLivre;
        result = 31 * result + (titre != null ? titre.hashCode() : 0);
        result = 31 * result + (sousTitre != null ? sousTitre.hashCode() : 0);
        result = 31 * result + (resume != null ? resume.hashCode() : 0);
        return result;
    }


    @OneToMany(mappedBy = "livreByIdLivre")
    public List<Edition> getEditionsByIdLivre() {
        return editionsByIdLivre;
    }

    public void setEditionsByIdLivre(List<Edition> editionsByIdLivre) {
        this.editionsByIdLivre = editionsByIdLivre;
    }

    @ManyToOne
    @JoinColumn(name = "id_genre", referencedColumnName = "id_genre", nullable = false)
    public Genre getGenreByNom() {
        return genreByNom;
    }

    public void setGenreByNom(Genre genreByNom) {
        this.genreByNom = genreByNom;
    }


    @ManyToMany
    @JsonFormat(with = JsonFormat.Feature.ACCEPT_SINGLE_VALUE_AS_ARRAY)
    @JoinTable(name="organisation", schema = "biblio", joinColumns = @JoinColumn(name = "id_livre"), inverseJoinColumns = @JoinColumn(name = "id_theme"))
    public List<Theme> getThemeByNom() {
        return this.themeByNom;
    }

    public void setThemeByNom(List<Theme> themes) {
        this.themeByNom = themes;
    }

    @ManyToMany
    @JsonFormat(with = JsonFormat.Feature.ACCEPT_SINGLE_VALUE_AS_ARRAY)
    @JoinTable(name="etiquete", schema = "biblio", joinColumns = @JoinColumn(name = "id_livre"), inverseJoinColumns = @JoinColumn(name = "id_tag"))
    public List<Tag> getTagByNom() {
        return this.tagByNom;
    }

    public void setTagByNom(List<Tag> tags) {
        this.tagByNom = tags;
    }

    @ManyToMany
    @JsonFormat(with = JsonFormat.Feature.ACCEPT_SINGLE_VALUE_AS_ARRAY)
    @JoinTable(name="ecriture", schema = "biblio", joinColumns = @JoinColumn(name = "id_livre"), inverseJoinColumns = @JoinColumn(name = "id_auteur"))
    public List<Auteur> getAuteurByNom() {
        return this.auteurByNom;
    }

    public void setAuteurByNom(List<Auteur> auteurs) {
        this.auteurByNom = auteurs;
    }
}
