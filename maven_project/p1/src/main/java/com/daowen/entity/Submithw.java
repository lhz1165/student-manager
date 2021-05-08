package com.daowen.entity;

import java.util.Date;
import javax.persistence.*;

@Entity
public class Submithw {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	private String xuehao;

	public String getXuehao() {
		return xuehao;
	}

	public void setXuehao(String xuehao) {
		this.xuehao = xuehao;
	}

	private String name;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	private Date submittime;

	public Date getSubmittime() {
		return submittime;
	}

	public void setSubmittime(Date submittime) {
		this.submittime = submittime;
	}

	private String des;

	public String getDes() {
		return des;
	}

	public void setDes(String des) {
		this.des = des;
	}

	private int hwid;

	public int getHwid() {
		return hwid;
	}

	public void setHwid(int hwid) {
		this.hwid = hwid;
	}

	private String hwtitle;

	public String getHwtitle() {
		return hwtitle;
	}

	public void setHwtitle(String hwtitle) {
		this.hwtitle = hwtitle;
	}

	private String tno;

	public String getTno() {
		return tno;
	}

	public void setTno(String tno) {
		this.tno = tno;
	}

	private String tname;

	public String getTname() {
		return tname;
	}

	public void setTname(String tname) {
		this.tname = tname;
	}

	private String piyue;

	public String getPiyue() {
		return piyue;
	}

	public void setPiyue(String piyue) {
		this.piyue = piyue;
	}

	private Date pytime;

	public Date getPytime() {
		return pytime;
	}

	public void setPytime(Date pytime) {
		this.pytime = pytime;
	}

	private int defen;

	public int getDefen() {
		return defen;
	}

	public void setDefen(int defen) {
		this.defen = defen;
	}

	private int status;

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
}
