package com.mycom.myboard;

public class Users {
	private int id;
	private String email;
	private String password;
	private int enabled;
	
	public Users() {}
	
	public Users(int id, String email, String password, int enabled) {
		this.id = id;
		this.email = email;
		this.password = password;
		this.enabled = enabled;
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
	
	@Override
	public String toString() {
		return "Users [id=" + id + ", email=" + email + ", password=" + password + ", enabled=" + enabled + "]";
	}
}