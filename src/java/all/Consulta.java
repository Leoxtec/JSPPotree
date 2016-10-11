/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package all;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.LinkedList;

/**
 *
 * @author jrodarte
 */
public class Consulta {
    public static LinkedList<mapas> getMapas(int id)
   {
      LinkedList<mapas> listamapas=new LinkedList<mapas>();
      try
      {
         Class.forName("org.postgresql.Driver");
         Connection conexion = DriverManager.getConnection(
            "jdbc:postgresql://ine-postgresql.ciatec.int:5432/leonel", "alrodriguez", "ineAR76");         
         Statement st = (Statement) conexion.createStatement();
         ResultSet rs = st.executeQuery("select * from prueba where carpeta="+id );
         while (rs.next())
         {
            mapas mapa = new mapas();
            mapa.setNum(rs.getInt("Id"));
            mapa.setPath(rs.getString("Codigo"));
            mapa.setFolder(rs.getInt("carpeta"));
            
            listamapas.add(mapa);
         }
         rs.close();
         st.close();
         conexion.close();
      }
      catch (Exception e)
      {
         e.printStackTrace();
      }
      return listamapas;
   }
}
