package com.cqust.model;

import java.util.Date;
import java.util.List;

public class User {
	private int id;
	private String username;
	private String userposition;
	private String userjob;
	private Date userbir;
	private String usersex;
	private Integer userphone;
	private List<Check> user_check;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUserposition() {
		return userposition;
	}
	public void setUserposition(String userposition) {
		this.userposition = userposition;
	}
	public String getUserjob() {
		return userjob;
	}
	public void setUserjob(String userjob) {
		this.userjob = userjob;
	}
	public Date getUserbir() {
		return userbir;
	}
	public void setUserbir(Date userbir) {
		this.userbir = userbir;
	}
	public String getUsersex() {
		return usersex;
	}
	public void setUsersex(String usersex) {
		this.usersex = usersex;
	}
	public Integer getUserphone() {
		return userphone;
	}
	public void setUserphone(Integer userphone) {
		this.userphone = userphone;
	}
	public List<Check> getUser_check() {
		return user_check;
	}
	public void setUser_check(List<Check> user_check) {
		this.user_check = user_check;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", userposition=" + userposition + ", userjob=" + userjob
				+ ", userbir=" + userbir + ", usersex=" + usersex + ", userphone=" + userphone + ", user_check="
				+ user_check + "]";
	}
	
}
