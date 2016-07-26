package com.pda.rebounz.model;

import java.io.Serializable;

/** Login Details Bean.
 * @author Manojsundar.G
 *
 */
public class LoginDetails implements Serializable {
	private static final long serialVersionUID = 1L;
	private String username;
	private String password;
	private String passwordNew;
	private String passwordConfirm;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPasswordNew() {
		return passwordNew;
	}
	public void setPasswordNew(String passwordNew) {
		this.passwordNew = passwordNew;
	}
	public String getPasswordConfirm() {
		return passwordConfirm;
	}
	public void setPasswordConfirm(String passwordConfirm) {
		this.passwordConfirm = passwordConfirm;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
}