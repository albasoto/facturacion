/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fodtrucks.model;

import fodtrucks.ConexionMySQL;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import javax.swing.JOptionPane;

/**
 *
 * @author Wendy Soto
 */
public class Class_Pedidos_clientes {
    
    private int CodPedidoCli;
    private String Nom_Cliente;
    private String DetPedido;
    private String Cantidad;
    private String Precio_U;
    private Double Total;

    public Class_Pedidos_clientes(int CodPedidoCli, String Nom_Cliente, String DetPedido, String Cantidad, String Precio_U, Double Total) {
        this.CodPedidoCli = CodPedidoCli;
        this.Nom_Cliente = Nom_Cliente;
        this.DetPedido = DetPedido;
        this.Cantidad = Cantidad;
        this.Precio_U = Precio_U;
        this.Total = Total;
    }

    public int getCodPedidoCli() {
        return CodPedidoCli;
    }

    public void setCodPedidoCli(int CodPedidoCli) {
        this.CodPedidoCli = CodPedidoCli;
    }

    public String getNom_Cliente() {
        return Nom_Cliente;
    }

    public void setNom_Cliente(String Nom_Cliente) {
        this.Nom_Cliente = Nom_Cliente;
    }

    public String getDetPedido() {
        return DetPedido;
    }

    public void setDetPedido(String DetPedido) {
        this.DetPedido = DetPedido;
    }

    public String getCantidad() {
        return Cantidad;
    }

    public void setCantidad(String Cantidad) {
        this.Cantidad = Cantidad;
    }

    public String getPrecio_U() {
        return Precio_U;
    }

    public void setPrecio_U(String Precio_U) {
        this.Precio_U = Precio_U;
    }

    public Double getTotal() {
        return Total;
    }

    public void setTotal(Double Total) {
        this.Total = Total;
    }

    

    


    

    
    public  void guardar_pedidos_cli(){
    
         try{
            Connection con = ConexionMySQL.connect();
          
            Statement agregar_pedido_cli =  con.createStatement();
            
            //System.out.println("insert into USUARIOS values('"+IdCli+"','"+CedulaCli+"','"+NomCli+"','"+ApellCli+"','"+DirCli+"','"+FechaNacimCli+"','"+TelCli+"','"+EmailCli+"','"+ContraseñaCli+"','"+Perfil+"')");
            agregar_pedido_cli.execute("insert into pedidos_clientes values('"+CodPedidoCli+"','"+Nom_Cliente+"','"+DetPedido+"','"+Cantidad+"','"+Precio_U+"','"+Total+"')");
            JOptionPane.showMessageDialog(null, "se a guardado su pedido!!"); 
  
        }catch (SQLException e) {
                System.out.println(e.getMessage());
            
        }

     }
            
}
