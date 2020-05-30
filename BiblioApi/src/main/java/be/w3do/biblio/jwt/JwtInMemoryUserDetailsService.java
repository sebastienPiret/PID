package be.w3do.biblio.jwt;


import be.w3do.biblio.model.Bibliothecaire;
import be.w3do.biblio.model.Emprunteur;
import be.w3do.biblio.repository.BibliothecaireRepository;
import be.w3do.biblio.repository.EmprunteurRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.Optional;


@Service
public class JwtInMemoryUserDetailsService implements UserDetailsService {

  @Autowired
  EmprunteurRepository studentRepository;

	@Autowired
	BibliothecaireRepository bibliothecaireRepository;
	
	
  //static List<JwtUserDetails> inMemoryUserList = new ArrayList<>();

  //static {
  //  inMemoryUserList.add(new JwtUserDetails(1L, "toto",
  //      "$2a$10$Bi7DWJTLZp4fjT8oT96q0erNCzQD5QtR62uT1v7QFWddmp3c9.g.G", "ADMIN"));
  //}

  @Override
  public UserDetails loadUserByUsername(String studentMail) throws UsernameNotFoundException {
    
	  Optional<Emprunteur> stu = studentRepository.findByMail(studentMail);
	  Optional<Bibliothecaire> bib = bibliothecaireRepository.findByMail(studentMail);
	    
	  Optional<JwtUserDetails> user = Optional.empty();
	  
	  if(stu.isPresent()) {
		  user = Optional.of(new JwtUserDetails(stu.get().getIdEmprunteur(),stu.get().getMail(),stu.get().getMdp(),stu.get().getRole()));
	  } else if (bib.isPresent()) {
		  user = Optional.of(new JwtUserDetails(bib.get().getIdBibliothecaire(),bib.get().getMail(),bib.get().getMdp(),
				  bib.get().getRole()));
	  }
	  
	  //Optional<JwtUserDetails> findFirst = inMemoryUserList.stream()
      //  .filter(user -> user.getUsername().equals(username)).findFirst();

	  if (!user.isPresent()) {
		  throw new UsernameNotFoundException(String.format("USER_NOT_FOUND '%s'.", studentMail));
	  }

	  return user.get();
  }

}
