package restful.service;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.SQLException;
import java.util.ArrayList;
import restful.Model.UserModel;
import restful.Model.Conexion;


public class UserService {

    public ArrayList<UserModel> getUsers() {
        ArrayList<UserModel> lista = new ArrayList<>();
        Conexion conn = new Conexion();
        String sql = "SELECT * FROM user";

        try {
            Statement stm = conn.getCon().createStatement();
            ResultSet rs = stm.executeQuery(sql);
            while (rs.next()) {
                UserModel user = new UserModel();
                
                user.setId(rs.getInt("id"));
                user.setNames(rs.getString("names"));
                user.setLast_names(rs.getString("last_names"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setState(rs.getInt("state"));
                user.setRoles_id(rs.getInt("roles_id"));
                
                lista.add(user);
            }
        } catch (SQLException e) {
        }

        return lista;
    }
    
    public UserModel getUsers (int id) {
        UserModel user = new UserModel();
        Conexion conex = new Conexion();
        String Sql = "SELECT * FROM user WHERE id = ?";

        try {

            PreparedStatement pstm = conex.getCon().prepareStatement(Sql);
            pstm.setInt(1, id);
            ResultSet rs = pstm.executeQuery();

            while (rs.next()) {

                user.setId(rs.getInt("id"));
                user.setNames(rs.getString("names"));
                user.setLast_names(rs.getString("last_names"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setState(rs.getInt("state"));
                user.setRoles_id(rs.getInt("roles_id"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return user;
    }
    
    public UserModel addUser(UserModel user) {
        Conexion conex = new Conexion();
        String Sql = "INSERT INTO user(id,names,last_names,email,password,state,roles_id)";
        Sql = Sql + "values (?,?,?,?,?,?,?)";

        try {
            PreparedStatement pstm = conex.getCon().prepareStatement(Sql);
            pstm.setInt(1, user.getId());
            pstm.setString(2, user.getNames());
            pstm.setString(3, user.getLast_names());
            pstm.setString(4, user.getEmail());
            pstm.setString(5, user.getPassword());
            pstm.setInt(6, user.getState());
            pstm.setInt(7, user.getRoles_id());

            pstm.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
            return null;
        }
        return user;
    }
    
    public UserModel updateUser(UserModel user) {
        Conexion conn = new Conexion();
        String sql = "UPDATE user SET names=?,last_names=?,email=?,password=?,state=?,roles_id=? WHERE id= ?";
        try {
            PreparedStatement pstm = conn.getCon().prepareStatement(sql);
            
            pstm.setString(1, user.getNames());
            pstm.setString(2, user.getLast_names());
            pstm.setString(3, user.getEmail());
            pstm.setString(4, user.getPassword());
            pstm.setInt(5, user.getState());
            pstm.setInt(6, user.getRoles_id());
            pstm.setInt(7, user.getId());
           
            pstm.executeUpdate();
        } catch (SQLException excepcion) {
            System.out.println("Ha ocurrido un error al modificar  " + excepcion.getMessage());
            return null;
        }
        return user;
    }
    
    public String delUser(int id) {
        Conexion conn = new Conexion();

        String sql = "DELETE FROM user WHERE id= ?";
        try {
            PreparedStatement pstm = conn.getCon().prepareStatement(sql);
            pstm.setInt(1, id);
            pstm.executeUpdate();
        } catch (SQLException excepcion) {
            System.out.println("Ha ocurrido un error al eliminar  " + excepcion.getMessage());
            return "{\"Accion\":\"Error\"}";
        }
        return "{\"Accion\":\"Registro Borrado\"}";
    }
    
}
