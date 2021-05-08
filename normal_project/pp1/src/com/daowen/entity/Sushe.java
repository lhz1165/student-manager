package com.daowen.entity;
import java.util.Date;
import javax.persistence.*;
@Entity
public class Sushe
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
   private String ssno ;
   public String getSsno() 
   {
      return ssno;
  }
   public void setSsno(String ssno) 
   {
      this.ssno= ssno;
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
