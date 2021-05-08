package com.daowen.entity;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
@Entity
public class Homework
{
@Id
@GeneratedValue(strategy =GenerationType.AUTO)
   private int id ;
   public int getId() 
   {
      return id;
  }
   public void setId(int id) 
   {
      this.id= id;
  }
   private String title ;
   public String getTitle() 
   {
      return title;
  }
   public void setTitle(String title) 
   {
      this.title= title;
  }
   private String tno ;
   public String getTno() 
   {
      return tno;
  }
   public void setTno(String tno) 
   {
      this.tno= tno;
  }
   private String tname ;
   public String getTname() 
   {
      return tname;
  }
   public void setTname(String tname) 
   {
      this.tname= tname;
  }
   private Date pubtime ;
   public Date getPubtime() 
   {
      return pubtime;
  }
   public void setPubtime(Date pubtime) 
   {
      this.pubtime= pubtime;
  }
   private String des ;
   public String getDes() 
   {
      return des;
  }
   public void setDes(String des) 
   {
      this.des= des;
  }
}
