package com.daowen.entity;

import java.util.Date;
import javax.persistence.*;

@Entity
public class Leaves {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	private String zgname;

	public String getZgname() {
		return zgname;
	}

	public void setZgname(String zgname) {
		this.zgname = zgname;
	}

	private String accountname;

	public String getAccountname() {
		return accountname;
	}

	public void setAccountname(String accountname) {
		this.accountname = accountname;
	}

	private Date begdate;

	public Date getBegdate() {
		return begdate;
	}

	public void setBegdate(Date begdate) {
		this.begdate = begdate;
	}

	private Date enddate;

	public Date getEnddate() {
		return enddate;
	}

	public void setEnddate(Date enddate) {
		this.enddate = enddate;
	}

	private int status;

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	private String applydes;

	public String getApplydes() {
		return applydes;
	}

	public void setApplydes(String applydes) {
		this.applydes = applydes;
	}

	private String reply;

	public String getReply() {
		return reply;
	}

	public void setReply(String reply) {
		this.reply = reply;
	}

	private String shenpiren;

	public String getShenpiren() {
		return shenpiren;
	}

	public void setShenpiren(String shenpiren) {
		this.shenpiren = shenpiren;
	}

	private Date applytime;

	public Date getApplytime() {
		return applytime;
	}

	public void setApplytime(Date applytime) {
		this.applytime = applytime;
	}

	private Date shenpitime;

	public Date getShenpitime() {
		return shenpitime;
	}

	public void setShenpitime(Date shenpitime) {
		this.shenpitime = shenpitime;
	}

	private String xtype;

	public String getXtype() {
		return xtype;
	}

	public void setXtype(String xtype) {
		this.xtype = xtype;
	}

	private int tianshu;

	public int getTianshu() {
		return tianshu;
	}

	public void setTianshu(int tianshu) {
		this.tianshu = tianshu;
	}
}
