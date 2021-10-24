package restful.service;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.SQLException;
import java.util.ArrayList;
import restful.Model.PaisModel;
import restful.Model.Conexion;

public class PaisService {
    public ArrayList<PaisModel> getPaises() {
        ArrayList<PaisModel> lista = new ArrayList<>();
        Conexion conn = new Conexion();
        String sql = "SELECT * FROM countrie";

        try {
            Statement stm = conn.getCon().createStatement();
            ResultSet rs = stm.executeQuery(sql);
            while (rs.next()) {
                PaisModel pais = new PaisModel();
                
                pais.setId(rs.getInt("id"));
                pais.setName(rs.getString("name"));
                
                lista.add(pais);
            }
        } catch (SQLException e) {
        }

        return lista;
    }
    public PaisModel getPais(int id) {
        PaisModel pais = new PaisModel();
        Conexion conex = new Conexion();
        String Sql = "SELECT * FROM countrie WHERE id = ?";

        try {

            PreparedStatement pstm = conex.getCon().prepareStatement(Sql);
            pstm.setInt(1, id);
            ResultSet rs = pstm.executeQuery();

            while (rs.next()) {

                pais.setId(rs.getInt("id"));
                pais.setName(rs.getString("name"));
                
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return pais;
    }
    public PaisModel addPais(PaisModel pais) {
        Conexion conex = new Conexion();
        String Sql = "INSERT INTO countrie(name)";
        Sql = Sql + "values (?)";

        try {
            PreparedStatement pstm = conex.getCon().prepareStatement(Sql);
            
            pstm.setString(1, pais.getName());
            
            pstm.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
            return null;
        }
        return pais;
    }
    public PaisModel updatePais(PaisModel pais) {
        Conexion conn = new Conexion();
        String sql = "UPDATE countrie SET name=? WHERE id= ?";
        try {
            PreparedStatement pstm = conn.getCon().prepareStatement(sql);
            pstm.setString(1, pais.getName());
            pstm.setInt(2, pais.getId());
            pstm.executeUpdate();
        } catch (SQLException excepcion) {
            System.out.println("Ha ocurrido un error al actualizar  " + excepcion.getMessage());
            return null;
        }
        return pais;
    }
    public String delPais(int id) {
        Conexion conn = new Conexion();

        String sql = "DELETE FROM countrie WHERE id= ?";
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
