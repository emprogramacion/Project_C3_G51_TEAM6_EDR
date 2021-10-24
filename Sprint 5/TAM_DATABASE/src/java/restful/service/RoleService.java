package restful.service;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.SQLException;
import java.util.ArrayList;
import restful.Model.RoleModel;
import restful.Model.Conexion;

public class RoleService {
    
    public ArrayList<RoleModel> getRoles() {
        ArrayList<RoleModel> lista = new ArrayList<>();
        Conexion conn = new Conexion();
        String sql = "SELECT * FROM role";

        try {
            Statement stm = conn.getCon().createStatement();
            ResultSet rs = stm.executeQuery(sql);
            while (rs.next()) {
                RoleModel role = new RoleModel();
                role.setId(rs.getInt("id"));
                role.setName(rs.getString("name"));
                role.setDescription(rs.getString("description"));             
                lista.add(role);
            }
        } catch (SQLException e) {
        }

        return lista;
    }
    
    
    public RoleModel getRole(int id) {
        RoleModel role = new RoleModel();
        Conexion conex = new Conexion();
        String Sql = "SELECT * FROM role WHERE id = ?";

        try {

            PreparedStatement pstm = conex.getCon().prepareStatement(Sql);
            pstm.setInt(1, id);
            ResultSet rs = pstm.executeQuery();

            while (rs.next()) {
                role.setId(rs.getInt("id"));
                role.setName(rs.getString("name"));
                role.setDescription(rs.getString("description"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return role;
    }
    
    
    public RoleModel addRole(RoleModel role) {
        Conexion conex = new Conexion();
        String Sql = "INSERT INTO role(id,name,description)";
        Sql = Sql + "values (?,?,?)";

        try {
            PreparedStatement pstm = conex.getCon().prepareStatement(Sql);
            pstm.setInt(1, role.getId());
            pstm.setString(2, role.getName());
            pstm.setString(3, role.getDescription());
            pstm.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
            return null;
        }
        return role;
    }
            
    public RoleModel updateRole(RoleModel role) {
        Conexion conn = new Conexion();
        String sql = "UPDATE role SET name=?, description=? WHERE id= ?";
        try {
            PreparedStatement pstm = conn.getCon().prepareStatement(sql);
            pstm.setString(1, role.getName());
            pstm.setString(2, role.getDescription());
            pstm.setInt(3, role.getId());
            pstm.executeUpdate();
        } catch (SQLException excepcion) {
            System.out.println("Ha ocurrido un error al modificar  " + excepcion.getMessage());
            return null;
        }
        return role;
    }
       
    public String delRole(int id) {
        Conexion conn = new Conexion();

        String sql = "DELETE FROM role WHERE id= ?";
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
