package com.daowen.entity;
import java.util.Date;
import javax.persistence.*;
@Entity
public class Bfrecord
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
   private String stno ;
   public String getStno() 
   {
      return stno;
  }
   public void setStno(String stno) 
   {
      this.stno= stno;
  }
   private String stname ;
   public String getStname() 
   {
      return stname;
  }
   public void setStname(String stname) 
   {
      this.stname= stname;
  }
   private String xuenian ;
   public String getXuenian() 
   {
      return xuenian;
  }
   public void setXuenian(String xuenian) 
   {
      this.xuenian= xuenian;
  }
   private String bftype ;
   public String getBftype() 
   {
      return bftype;
  }
   public void setBftype(String bftype) 
   {
      this.bftype= bftype;
  }
   private String bfdanwei ;
   public String getBfdanwei() 
   {
      return bfdanwei;
  }
   public void setBfdanwei(String bfdanwei) 
   {
      this.bfdanwei= bfdanwei;
  }
   private Date begdate ;
   public Date getBegdate() 
   {
      return begdate;
  }
   public void setBegdate(Date begdate) 
   {
      this.begdate= begdate;
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
