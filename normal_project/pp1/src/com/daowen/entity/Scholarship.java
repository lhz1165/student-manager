package com.daowen.entity;
import java.util.Date;
import javax.persistence.*;
@Entity
public class Scholarship
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
   private String xtype ;
   public String getXtype() 
   {
      return xtype;
  }
   public void setXtype(String xtype) 
   {
      this.xtype= xtype;
  }
   private Date hjdate ;
   public Date getHjdate() 
   {
      return hjdate;
  }
   public void setHjdate(Date hjdate) 
   {
      this.hjdate= hjdate;
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
}
