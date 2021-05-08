package com.daowen.entity;

import java.util.Date;
import javax.persistence.*;

@Entity
public class Pinkun {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	private String stno;

	public String getStno() {
		return stno;
	}

	public void setStno(String stno) {
		this.stno = stno;
	}

	private String stname;

	public String getStname() {
		return stname;
	}

	public void setStname(String stname) {
		this.stname = stname;
	}

	private String photo;

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	private String jthukou;

	public String getJthukou() {
		return jthukou;
	}

	public void setJthukou(String jthukou) {
		this.jthukou = jthukou;
	}

	private String reason;

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	private String bfjh;

	public String getBfjh() {
		return bfjh;
	}

	public void setBfjh(String bfjh) {
		this.bfjh = bfjh;
	}

	private String pktype;

	public String getPktype() {
		return pktype;
	}

	public void setPktype(String pktype) {
		this.pktype = pktype;
	}

	private Date begdate;

	public Date getBegdate() {
		return begdate;
	}

	public void setBegdate(Date begdate) {
		this.begdate = begdate;
	}

	private String jiguan;

	public String getJiguan() {
		return jiguan;
	}

	public void setJiguan(String jiguan) {
		this.jiguan = jiguan;
	}

	private String lururen;

	public String getLururen() {
		return lururen;
	}

	public void setLururen(String lururen) {
		this.lururen = lururen;
	}

	private String homeaddress;

	public String getHomeaddress() {
		return homeaddress;
	}

	public void setHomeaddress(String homeaddress) {
		this.homeaddress = homeaddress;
	}

	private String moible;

	public String getMoible() {
		return moible;
	}

	public void setMoible(String moible) {
		this.moible = moible;
	}

	private String idcardno;

	public String getIdcardno() {
		return idcardno;
	}

	public void setIdcardno(String idcardno) {
		this.idcardno = idcardno;
	}

	private String des;

	public String getDes() {
		return des;
	}

	public void setDes(String des) {
		this.des = des;
	}
	private int appid;

	public int getAppid() {
		return appid;
	}

	public void setAppid(int appid) {
		this.appid = appid;
	}
}
