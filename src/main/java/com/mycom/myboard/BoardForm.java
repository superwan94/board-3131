package com.mycom.myboard;

import javax.validation.constraints.NotBlank;

public class BoardForm {
	
	@NotBlank
	private String title;
	
	@NotBlank
	private String message;
	
	@NotBlank
	private String email;
	
	@NotBlank
	private String password;
	
	@NotBlank
	private String authority;

	public BoardForm() {
	}
	
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}
			
	
}
