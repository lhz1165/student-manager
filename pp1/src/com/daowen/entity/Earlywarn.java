package com.daowen.entity;

import java.util.Date;
import javax.persistence.*;

@Entity
public class Earlywarn {
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

	private String yjtype;

	public String getYjtype() {
		return yjtype;
	}

	public void setYjtype(String yjtype) {
		this.yjtype = yjtype;
	}

	private String title;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	private String content;

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	private Date createtime;

	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}

	private int state;

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}
}
