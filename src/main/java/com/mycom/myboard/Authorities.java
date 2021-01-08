package com.mycom.myboard;

public class Authorities {
	private String email;
	private String authority;
	
	public Authorities() {}
	
	public Authorities(String email, String authority) {
		this.email = email;
		this.authority = authority;
	}
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}
	
	@Override
	public String toString() {
		return "Authorities [email=" + email + ", authority =" + authority + "]";
	}
}