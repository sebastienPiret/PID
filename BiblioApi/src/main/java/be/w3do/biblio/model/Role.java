package be.w3do.biblio.model;

import javax.persistence.*;
import java.util.Collection;

@Entity
@Table(name="role", schema = "biblio")
public class Role {
    private int idRole;
    private String nom;
    private Collection<Bibliothecaire> bibliothecairesByIdRole;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_role", nullable = false)
    public int getIdRole() {
        return idRole;
    }

    public void setIdRole(int idRole) {
        this.idRole = idRole;
    }


    @Basic
    @Column(name = "nom", nullable = false)
    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }


    @OneToMany(mappedBy = "roleByIdRole")
    public Collection<Bibliothecaire> getBibliothecairesByIdRole() {
        return bibliothecairesByIdRole;
    }

    public void setBibliothecairesByIdRole(Collection<Bibliothecaire> bibliothecairesByIdRole) {
        this.bibliothecairesByIdRole = bibliothecairesByIdRole;
    }
}
