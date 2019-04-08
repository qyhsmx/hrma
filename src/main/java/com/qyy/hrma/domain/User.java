package com.qyy.hrma.domain;

import java.io.Serializable;
import java.util.Date;

public class User implements Serializable {
  private Integer id;
  private String loginname;
  private String password;
  private Integer mark;
  private Date createDate;
  private String username;

	public User(Integer id, String loginname, String password, Integer mark, Date createDate, String username) {
		this.id = id;
		this.loginname = loginname;
		this.password = password;
		this.mark = mark;
		this.createDate = createDate;
		this.username = username;
	}

	public User() {

	}

	@Override
	public String toString() {
		return "User{" +
				"id=" + id +
				", loginname='" + loginname + '\'' +
				", password='" + password + '\'' +
				", mark=" + mark +
				", createDate=" + createDate +
				", username='" + username + '\'' +
				'}';
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getLoginname() {
		return loginname;
	}

	public void setLoginname(String loginname) {
		this.loginname = loginname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Integer getMark() {
		return mark;
	}

	public void setMark(Integer mark) {
		this.mark = mark;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
}
