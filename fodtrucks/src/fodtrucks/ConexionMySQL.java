/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fodtrucks;

import com.mysql.jdbc.MySQLConnection;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Wendy Soto
 */
public class ConexionMySQL {
    
       public static Connection connection;
    public static Connection connect(){
       
        String url = "jdbc:mysql://localhost:3306/db_facturacion";
        String user = "root";
        String pass = "12345";
        System.out.println("Conectando...");
        try  {
            System.out.println("Conectado!!");   
            connection= DriverManager.getConnection(url, user,pass);
           
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return connection;
        
       }    

    Statement createStatement() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
