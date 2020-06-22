package be.w3do.biblio.model;

import lombok.Data;

import javax.persistence.Embeddable;
import java.io.Serializable;

@Data
@Embeddable
public class PaiementId implements Serializable {
     long emprunteurByIdEmprunteur;

     int biblioByIdBibliotheque;

    public PaiementId() {

    }
}
