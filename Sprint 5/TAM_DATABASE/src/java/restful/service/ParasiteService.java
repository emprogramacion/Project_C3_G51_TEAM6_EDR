package restful.service;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.SQLException;
import java.util.ArrayList;
import restful.Model.ParasiteModel; /*Enlace con el ParasiteModel*/
import restful.Model.Conexion; /*Enlace con la conexión a la base de datos*/
public class ParasiteService {
    
    public ArrayList<ParasiteModel> getParasites() {
        ArrayList<ParasiteModel> lista = new ArrayList<>();
        Conexion conn = new Conexion();
        String sql = "SELECT * FROM parasite";

        try {
            Statement stm = conn.getCon().createStatement();
            ResultSet rs = stm.executeQuery(sql);
            while (rs.next()) {
                // Crear un objeto de la clase parasite.
                ParasiteModel parasite = new ParasiteModel();
                parasite.setId(rs.getInt("id"));
                parasite.setGender(rs.getString("gender"));
                lista.add(parasite);
            }
        } catch (SQLException e) {
        }

        return lista;
    }
    
    public ParasiteModel getParasite(int id) {
        ParasiteModel parasite = new ParasiteModel();
        Conexion conex = new Conexion();
        String Sql = "SELECT * FROM parasite WHERE id = ?";

        try {

            PreparedStatement pstm = conex.getCon().prepareStatement(Sql);
            pstm.setInt(1, id);
            ResultSet rs = pstm.executeQuery();

            while (rs.next()) {
                
                parasite.setId(rs.getInt("id"));
                parasite.setGender(rs.getString("gender"));
                
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return parasite;
    }
    
    public ParasiteModel addParasite(ParasiteModel parasite) {
        Conexion conex = new Conexion();
        String Sql = "INSERT INTO parasite(gender)";
        Sql = Sql + "values (?)";

        try {
            PreparedStatement pstm = conex.getCon().prepareStatement(Sql);
            pstm.setString(1, parasite.getGender());
            pstm.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
            return null;
        }
        return parasite;
    }
    
    public ParasiteModel updateParasite(ParasiteModel parasite) {
        Conexion conn = new Conexion();
        String sql = "UPDATE parasite SET gender=? WHERE id= ?";
        try {
            PreparedStatement pstm = conn.getCon().prepareStatement(sql);
            pstm.setString(1, parasite.getGender());
            pstm.setInt(2, parasite.getId());
            pstm.executeUpdate();
        } catch (SQLException excepcion) {
            System.out.println("Ha ocurrido un error al intentar modificar los datos  " + excepcion.getMessage());
            return null;
        }
        return parasite;
    }
    
    public String delParasite(int id) {
        Conexion conn = new Conexion();

        String sql = "DELETE FROM parasite WHERE id= ?";
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
