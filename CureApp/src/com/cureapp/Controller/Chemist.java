package com.cureapp.Controller;

import java.io.Serializable;
import java.util.Arrays;

public class Chemist implements Serializable
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 6186118570827458339L;
	private String username;
	private char[] passwd;
	
	public Chemist()
	{
		username = null;
		passwd = null;
	}
	
	public Chemist(String username, String passwd)
	{
		this.username = username;
		this.passwd = passwd.toCharArray();
	}
	
	/**
	 * @return the username
	 */
	public String getUsername() {
		return username;
	}
	/**
	 * @param username the username to set
	 */
	public void setUsername(String username) {
		this.username = username;
	}
	/**
	 * @return the passwd
	 */
	public char[] getPasswd() {
		return passwd;
	}
	/**
	 * @param passwd the passwd to set
	 */
	public void setPasswd(char[] passwd) {
		this.passwd = passwd;
	}

	@Override
	public String toString() {
		return "Chemist [username=" + username + ", passwd=" + Arrays.toString(passwd) + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + Arrays.hashCode(passwd);
		result = prime * result + ((username == null) ? 0 : username.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Chemist other = (Chemist) obj;
		if (!Arrays.equals(passwd, other.passwd))
			return false;
		if (username == null) {
			if (other.username != null)
				return false;
		} else if (!username.equals(other.username))
			return false;
		return true;
	}
}
