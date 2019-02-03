/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fodtrucks.model;

import fodtrucks.ConexionMySQL;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.concurrent.locks.StampedLock;
import javax.swing.JOptionPane;

/**
 *
 * @author Wendy Soto
 */
public class ClassCliente {
  
    private int IdCli; //1
    private String CedulaCli;//2
    private String NomCli;//3
    private String ApellCli;//4
    private String DirCli;//5
    private String   FechaNacimCli;//6
    private int    TelCli;//7
    private String EmailCli;//8
    private String ContraseñaCli;//9
    private String Perfil="cliente";//10

    public ClassCliente(int IdCli, String CedulaCli, String NomCli, String ApellCli, String DirCli, String FechaNacimCli, int TelCli, String EmailCli, String ContraseñaCli,String perfil) {
        this.IdCli = IdCli;
        this.CedulaCli = CedulaCli;
        this.NomCli = NomCli;
        this.ApellCli = ApellCli;
        this.DirCli = DirCli;
        this.FechaNacimCli = FechaNacimCli;
        this.TelCli = TelCli;
        this.EmailCli = EmailCli;
        this.ContraseñaCli = ContraseñaCli;
    }

    public int getIdCli() {
        return IdCli;
    }

    public void setIdCli(int IdCli) {
        this.IdCli = IdCli;
    }

    public String getCedulaCli() {
        return CedulaCli;
    }

    public void setCedulaCli(String CedulaCli) {
        this.CedulaCli = CedulaCli;
    }

    public String getNomCli() {
        return NomCli;
    }

    public void setNomCli(String NomCli) {
        this.NomCli = NomCli;
    }

    public String getApellCli() {
        return ApellCli;
    }

    public void setApellCli(String ApellCli) {
        this.ApellCli = ApellCli;
    }

    public String getDirCli() {
        return DirCli;
    }

    public void setDirCli(String DirCli) {
        this.DirCli = DirCli;
    }

    public String getFechaNacimCli() {
        return FechaNacimCli;
    }

    public void setFechaNacimCli(String FechaNacimCli) {
        this.FechaNacimCli = FechaNacimCli;
    }

    public int getTelCli() {
        return TelCli;
    }

    public void setTelCli(int TelCli) {
        this.TelCli = TelCli;
    }

    public String getEmailCli() {
        return EmailCli;
    }

    public void setEmailCli(String EmailCli) {
        this.EmailCli = EmailCli;
    }

    public String getContraseñaCli() {
        return ContraseñaCli;
    }

    public void setContraseñaCli(String ContraseñaCli) {
        this.ContraseñaCli = ContraseñaCli;
    }

    public  void guardar(){
        
        
         try{
            Connection con = ConexionMySQL.connect();
          
            Statement agregar =  con.createStatement();
            if(!CedulaCli.equals("")){
            //System.out.println("insert into USUARIOS values('"+IdCli+"','"+CedulaCli+"','"+NomCli+"','"+ApellCli+"','"+DirCli+"','"+FechaNacimCli+"','"+TelCli+"','"+EmailCli+"','"+ContraseñaCli+"','"+Perfil+"')");
            agregar.execute("insert into USUARIOS values('"+IdCli+"','"+CedulaCli+"','"+NomCli+"','"+ApellCli+"','"+DirCli+"','"+FechaNacimCli+"','"+TelCli+"','"+EmailCli+"','"+ContraseñaCli+"','"+Perfil+"')");
            JOptionPane.showMessageDialog(null, "Usuario ingresado con exito!!"); 
            }
            
            
            else {
                    JOptionPane.showMessageDialog(null, "los campos!!"); 
                    }
        }catch (SQLException e) {
                System.out.println(e.getMessage());
            
        }
         
         
        
                
        
        
        
     }
    
    
}
