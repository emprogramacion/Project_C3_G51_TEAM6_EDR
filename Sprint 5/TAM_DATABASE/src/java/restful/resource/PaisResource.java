package restful.resource;

import java.util.ArrayList;
import javax.ws.rs.Consumes;
import javax.ws.rs.Produces;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.core.MediaType;

import restful.Model.PaisModel;
import restful.service.PaisService;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import javax.ws.rs.DELETE;
import javax.ws.rs.PUT;

@Path("paises")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)

public class PaisResource {
    PaisService servicio = new PaisService();

    @GET
    public ArrayList<PaisModel> getPaises() {

        return servicio.getPaises();
    }
    @Path("/{Id}")
    @GET
    public PaisModel getPais(@PathParam("Id") int id) {

        return servicio.getPais(id);
    }
    @POST
    public PaisModel addPais(String JSON) {
        GsonBuilder builder = new GsonBuilder();
        builder.setPrettyPrinting();
        Gson gson = builder.create();
        PaisModel pais = gson.fromJson(JSON, PaisModel.class);
        return servicio.addPais(pais);
    }
    @PUT
    public PaisModel updatePais(String JSON) {
        GsonBuilder builder = new GsonBuilder();
        builder.setPrettyPrinting();
        Gson gson = builder.create();
        PaisModel pais = gson.fromJson(JSON, PaisModel.class);
        return servicio.updatePais(pais);
    }
    @DELETE
    @Path("/{Id}")
    public String delPais(@PathParam("Id") int id) {

        return servicio.delPais(id);

    }
}
