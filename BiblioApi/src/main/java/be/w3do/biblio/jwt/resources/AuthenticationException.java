package be.w3do.biblio.jwt.resources;
public class AuthenticationException extends RuntimeException {


	/**
	 * 
	 */
	private static final long serialVersionUID = -848952006273989963L;

	public AuthenticationException(String message, Throwable cause) {
        super(message, cause);
    }
}

