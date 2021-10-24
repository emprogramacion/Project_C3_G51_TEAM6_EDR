package restful.resource;

import java.util.ArrayList;
import javax.ws.rs.Consumes;
import javax.ws.rs.Produces;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.core.MediaType;
import restful.Model.RoleModel;
import restful.service.RoleService;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import javax.ws.rs.DELETE;
import javax.ws.rs.PUT;

@Path("roles")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)

public class RoleResource {
    RoleService servicio = new RoleService();

    @GET
    public ArrayList<RoleModel> getRoles() {

        return servicio.getRoles();
    }
    
    @Path("/{RoleId}")
    @GET
    public RoleModel getRole(@PathParam("RoleId") int id) {

        return servicio.getRole(id);
    }
    
    @POST
    public RoleModel addRole(String JSON) {
        GsonBuilder builder = new GsonBuilder();
        builder.setPrettyPrinting();
        Gson gson = builder.create();
        RoleModel role = gson.fromJson(JSON, RoleModel.class);
        return servicio.addRole(role);
    }
    
      
    @PUT
    public RoleModel updateRole(String JSON) {
        GsonBuilder builder = new GsonBuilder();
        builder.setPrettyPrinting();
        Gson gson = builder.create();
        RoleModel role = gson.fromJson(JSON, RoleModel.class);
        return servicio.updateRole(role);
    }
    
    @DELETE
    @Path("/{RoleId}")
    public String delRole(@PathParam("RoleId") int id) {

        return servicio.delRole(id);

    }

}
