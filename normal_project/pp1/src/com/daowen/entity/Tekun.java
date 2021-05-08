package com.daowen.entity;

import java.util.Date;
import javax.persistence.*;

@Entity
public class Tekun {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	private String title;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	private Date applytime;

	public Date getApplytime() {
		return applytime;
	}

	public void setApplytime(Date applytime) {
		this.applytime = applytime;
	}

	private int state;

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	private String applyor;

	public String getApplyor() {
		return applyor;
	}

	public void setApplyor(String applyor) {
		this.applyor = applyor;
	}

	private String appname;

	public String getAppname() {
		return appname;
	}

	public void setAppname(String appname) {
		this.appname = appname;
	}

	private String dcontent;

	public String getDcontent() {
		return dcontent;
	}

	public void setDcontent(String dcontent) {
		this.dcontent = dcontent;
	}
	
	private int arvid;

	public int getArvid() {
		return arvid;
	}

	public void setArvid(int arvid) {
		this.arvid = arvid;
	}
}
