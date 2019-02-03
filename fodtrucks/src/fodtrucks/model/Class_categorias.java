/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fodtrucks.model;

import fodtrucks.ConexionMySQL;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;

/**
 *
 * @author Wendy Soto
 */
public class Class_categorias {
    private int ID_categoria;
    private String nomCategoria;
    

    public int getID_categoria() {
        return ID_categoria;
    }

    public void setID_categoria(int ID_categoria) {
        this.ID_categoria = ID_categoria;
    }

    public String getNomCategoria() {
        return nomCategoria;
    }

    public void setNomCategoria(String nomCategoria) {
        this.nomCategoria = nomCategoria;
    }
    
   //////

    
    public String toString() {
        return  this.nomCategoria ;
    }
   
  
   public Vector<Class_categorias> mostrarCategoria(){
        Vector<Class_categorias> datos= new Vector<Class_categorias>();
        Class_categorias dat=null;
       
       try{
            Connection con = ConexionMySQL.connect();
            Statement s =  con.createStatement();
            //consulta en la base de datos los platos de entrda disponibles guardados en la base de datos.---
            ResultSet categorias = s.executeQuery("select *from categorias");
            //cmbEntradas.removeAllItems();
         
            // -----carga combo categorias-----
            //cmbCategorias.addItem("seleccionar");
            dat=new Class_categorias();
            dat.setID_categoria(0);
            dat.setNomCategoria("seleccionar");
            datos.add(dat);
            while(categorias.next()){
              dat=new Class_categorias();
            dat.setID_categoria(categorias.getInt("Id_categoria"));
            dat.setNomCategoria(categorias.getString("Nom_Categoria"));
            datos.add(dat);   
               
            }

        }catch (SQLException error) {

            System.out.println(error.getMessage());
        }
       return datos;
        
   }
    
    
    ///////
    
    
}
