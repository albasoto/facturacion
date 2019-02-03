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
public class Class_producto {
    
    private int CodProd;
    private String NomProd;
    private String PrecioProd;
    private int NumUnidades;
    private int  Id_categoria_FK;       

    public int getCodProd() {
        return CodProd;
    }

    public void setCodProd(int CodProd) {
        this.CodProd = CodProd;
    }

    public String getNomProd() {
        return NomProd;
    }

    public void setNomProd(String NomProd) {
        this.NomProd = NomProd;
    }

    public String getPrecioProd() {
        return PrecioProd;
    }

    public void setPrecioProd(String PrecioProd) {
        this.PrecioProd = PrecioProd;
    }

    public int getNumUnidades() {
        return NumUnidades;
    }

    public void setNumUnidades(int NumUnidades) {
        this.NumUnidades = NumUnidades;
    }

    public int getId_categoria_FK() {
        return Id_categoria_FK;
    }

    public void setId_categoria_FK(int Id_categoria_FK) {
        this.Id_categoria_FK = Id_categoria_FK;
    }



    @Override
    public String toString() {
        return NomProd;
    }

     public Vector<Class_producto> mostrarProducto(Integer Id_categoria_FK ){
        Vector<Class_producto> datos= new Vector<Class_producto>();
        Class_producto dat=null;
       
       try{
            Connection con = ConexionMySQL.connect();
            Statement s =  con.createStatement();
            //consulta en la base de datos los platos de entrda disponibles guardados en la base de datos.---
            ResultSet producto = s.executeQuery("select *from productos where Id_categoria_FK="+Id_categoria_FK);
            //cmbEntradas.removeAllItems();
         
            // -----carga combo categorias-----
            //cmbCategorias.addItem("seleccionar");
            dat=new Class_producto();
            dat.setCodProd(0);
            dat.setNomProd("seleccionar");
            datos.add(dat);
            while(producto.next()){
              dat=new Class_producto();
            dat.setCodProd(producto.getInt("CodProd"));
            dat.setNomProd(producto.getString("NomProd"));
            datos.add(dat);   
               
            }

        }catch (SQLException error) {

            System.out.println(error.getMessage());
        }
       return datos;
        
 
    
    
}
}
