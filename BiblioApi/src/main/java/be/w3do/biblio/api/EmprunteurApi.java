package be.w3do.biblio.api;


import be.w3do.biblio.model.Emprunteur;
import be.w3do.biblio.repository.EmprunteurRepository;
import be.w3do.biblio.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.annotation.Secured;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;


@RestController
public class EmprunteurApi {
	@Autowired
	private EmprunteurRepository empRep;
	
	@Autowired
	private UserService service;
	
	@Secured("USER")
    @GetMapping(value="/apistudents", produces = "application/json")
    public List<Emprunteur> students() {
    	List<Emprunteur> stuList = (List<Emprunteur>) empRep.findAll();
        return stuList;
    }

    /*

    @GetMapping(value="/apistudentsj", produces = "application/json")
    public String studentsj() {
    	List<Emprunteur> stuList = (List<Emprunteur>) stuRep.findAll();


    	ExclusionStrategy strategy = new ExclusionStrategy() {
    	    @Override
    	    public boolean shouldSkipField(FieldAttributes field) {
    	        if (field.getDeclaringClass() == Set.class && field.getName().equals("subjects")) {
    	            return true;
    	        }
    	        return false;
    	    }

    	    @Override
    	    public boolean shouldSkipClass(Class<?> clazz) {
    	        return false;
    	    }


    	};


    	//Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();

    	Gson gson  =  new GsonBuilder().addSerializationExclusionStrategy(strategy).create();
    	String js = gson.toJson(stuList);
    	return js;
    }


     */
    
    
    

//    @GetMapping("/student/{id}")
//    public String getStudent(@PathVariable String id,Model model) {
//    	Student stu = service.getStudent(Long.parseLong(id));
//    	//service.notSubscribed();
//    	model.addAttribute("stu",stu);
//        return "student";
//    }
//    
//    //
//    @GetMapping("/addstu")
//    public String addStudent(Model model) {
//        model.addAttribute("stu", new Student());
//        return "stuform";
//    }
//
    @PostMapping("/apiaddstu")
    public  Emprunteur stuformSubmit(@RequestBody Emprunteur emprunteur) {
    	
    	//System.out.println(student.getStudentFirstname()+" "+student.getSubjects().iterator().next().getSubjectName());

		System.out.println(emprunteur.getUsername());
    	 
    	 
    	 
    	 try {
			 emprunteur = service.addEmprunteur(emprunteur);
			 System.out.println("user= " + emprunteur);
    	 }
     	catch (Exception exc) {
            throw new ResponseStatusException(
              HttpStatus.I_AM_A_TEAPOT, emprunteur.getMail() +" already exists", exc);
    	}
    	
    	 
    	 //catch(Exception e){
    	//	 Error er = new Error("Student"+student.getStudentMail()+"already exist");
    	//	 throw er;
    	// }

    	//model.addAttribute("students", service.getSetStudents());
        return emprunteur;
    }
    
}
