package be.w3do.biblio;

import be.w3do.biblio.model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.rest.core.config.RepositoryRestConfiguration;
import org.springframework.data.rest.webmvc.config.RepositoryRestConfigurerAdapter;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;
import org.springframework.web.filter.CorsFilter;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.metamodel.Type;
import java.util.stream.Collectors;

@Configuration
public class RepositoryConfig extends RepositoryRestConfigurerAdapter {

    // @Autowired
    // private EntityManager entityManager;
    @Bean
    public CorsFilter corsFilter() {
        UrlBasedCorsConfigurationSource source =
                new UrlBasedCorsConfigurationSource();
        CorsConfiguration config = new CorsConfiguration();
        config.setAllowCredentials(true);
        config.addAllowedOrigin("*");
        config.addExposedHeader("Content-Type");
        config.addExposedHeader("Authorization");
        config.addExposedHeader("Accept");
        config.addExposedHeader("Origin");
        config.addAllowedHeader("*");
        config.addAllowedMethod("*");
        source.registerCorsConfiguration("/**", config);
        return new CorsFilter(source);
    }

    @Override
    public void configureRepositoryRestConfiguration(RepositoryRestConfiguration config) {

        config.exposeIdsFor(Livre.class, Auteur.class, Emprunteur.class, Adresse.class, Pays.class, Avis.class,
                Bibliothecaire.class, Bibliotheque.class, Editeur.class, Edition.class, Emprunt.class,
                Exemplaire.class, Genre.class, Log.class, Paiement.class, Panier.class, Question.class,
                Role.class, Tag.class, Theme.class);
        /*
        config.exposeIdsFor(
                entityManager.getMetamodel().getEntities()
                        .stream()
                        .map(Type::getJavaType)
                        .collect(Collectors.toList())
                        .toArray(new Class[0]));

         */


    }


}
