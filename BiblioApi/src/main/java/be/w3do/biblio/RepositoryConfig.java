package be.w3do.biblio;

import be.w3do.biblio.model.Auteur;
import be.w3do.biblio.model.Livre;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.rest.core.config.RepositoryRestConfiguration;
import org.springframework.data.rest.webmvc.config.RepositoryRestConfigurerAdapter;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.metamodel.Type;
import java.util.stream.Collectors;

@Configuration
public class RepositoryConfig extends RepositoryRestConfigurerAdapter {

    // @Autowired
    // private EntityManager entityManager;

    @Override
    public void configureRepositoryRestConfiguration(RepositoryRestConfiguration config) {

        config.exposeIdsFor(Livre.class, Auteur.class);
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
