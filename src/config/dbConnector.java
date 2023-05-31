    /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package config;

import java.sql.*;
import javax.swing.JOptionPane;

/**
 *
 * @author SCC-MIKE
 */
public class dbConnector {
    
    
        public Connection connect;
            
       // constructor to connect to our database
        public dbConnector(){
            try{
                connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/mike_db", "root", "");
            }catch(SQLException ex){
                    System.out.println("Can't connect to database: "+ex.getMessage());
            }
        }
        
        public Connection connect_db(){
              try{
                connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/mike_db", "root", "");
            }catch(SQLException ex){
                    System.out.println("Can't connect to database: "+ex.getMessage());
            }
              return connect;
        }
        
        
        //Function to retrieve data
        public ResultSet getData(String sql) throws SQLException{
            Statement stmt = connect.createStatement();
            ResultSet rst = stmt.executeQuery(sql);
            return rst;
        }
        
        //Function to save data
        public int insertData(String sql){
            int result;
            try{
                PreparedStatement pst = connect.prepareStatement(sql);
                pst.executeUpdate();
                System.out.println("Inserted Successfully!");
                pst.close();
                result =1;
            }catch(SQLException ex){
                System.out.println("Connection Error: "+ex);
                result =0;
            }
            return result;
        }
        
        //Function to update data
        public void updateData(String sql){
            try{
                PreparedStatement pst = connect.prepareStatement(sql);
                    int rowsUpdated = pst.executeUpdate();
                        if(rowsUpdated > 0){
                            JOptionPane.showMessageDialog(null, "Data Updated Successfully!");
                        }else{
                            System.out.println("Data Update Failed!");
                        }
                        pst.close();
            }catch(SQLException ex){
                System.out.println("Connection Error: "+ex);
            }
        
        }
        
        //Function to delete data
        public void deleteData(int id, String table, String table_id){
            try{
                PreparedStatement pst = connect.prepareStatement("DELETE FROM "+table+" WHERE "+table_id+" = ?");
                pst.setInt(1, id);
                int rowsDeleted = pst.executeUpdate();
                    if(rowsDeleted > 0){
                        JOptionPane.showMessageDialog(null, "Deleted Successfully!");
                    }else{
                        System.out.println("Deletion Failed!");
                    }
                    pst.close();
            }catch(SQLException ex){
                JOptionPane.showMessageDialog(null, "Data cannot be deleted\nContact the administrator.");
            }
        }
        
}


