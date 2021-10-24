package restful.resource;

import java.util.ArrayList;
import javax.ws.rs.Consumes;
import javax.ws.rs.Produces;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.core.MediaType;

import restful.Model.ParasiteModel; /*Enlace con el modelo Parasite*/
import restful.service.ParasiteService; /*Enlace con el servicio Parasite*/

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import javax.ws.rs.DELETE;
import javax.ws.rs.PUT;

@Path("parasites")
@Produces(MediaType.APPLICATION_JSON) /*Con esto le decimos que produce archivos JSON*/
@Consumes(MediaType.APPLICATION_JSON) /*Con esto le decimos que consume archivos JSON*/
public class ParasiteResource {
     
    ParasiteService servicio = new ParasiteService(); /*Objeto de la clase servicio 
    para poder conectar,llamar o consumir esos servicios desde este recurso*/ 
    
    @GET
    public ArrayList<ParasiteModel> getParasites() {

        return servicio.getParasites();
    }
    
    @Path("/{ParasiteId}") /*Parametro que se pide para buscar el parásito en la BD*/
    @GET
    public ParasiteModel getParasite(@PathParam("ParasiteId") int id) {

        return servicio.getParasite(id);
    }
    
    @POST
    public ParasiteModel addParasite(String JSON) {
        GsonBuilder builder = new GsonBuilder();
        builder.setPrettyPrinting();
        Gson gson = builder.create();
        ParasiteModel parasite = gson.fromJson(JSON, ParasiteModel.class); /*Convierte el JSON en un objeto de la clase parasite*/
        return servicio.addParasite(parasite);
    }
    
    @PUT
    public ParasiteModel updateParasite(String JSON) {
        GsonBuilder builder = new GsonBuilder();
        builder.setPrettyPrinting();
        Gson gson = builder.create();
        ParasiteModel parasite = gson.fromJson(JSON, ParasiteModel.class);
        return servicio.updateParasite(parasite);
    }
    
        @DELETE
    @Path("/{ParasiteId}")
    public String delCliente(@PathParam("ParasiteId") int id) {

        return servicio.delParasite(id);

    }
}
