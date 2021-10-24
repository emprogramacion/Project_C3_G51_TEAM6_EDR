package restful.resource;

import java.util.ArrayList;
import javax.ws.rs.Consumes;
import javax.ws.rs.Produces;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.core.MediaType;
import restful.Model.UserModel;
import restful.service.UserService;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import javax.ws.rs.DELETE;
import javax.ws.rs.PUT;

@Path("users")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)

public class UserResource {
    
    UserService servicio = new UserService();

    @GET
    public ArrayList<UserModel> getUsers() {

        return servicio.getUsers();
    }
    
    @Path("/{UserId}")
    @GET
    public UserModel getUsers(@PathParam("UserId") int id) {

        return servicio.getUsers(id);
    }
    
    @POST
    public UserModel addUser(String JSON) {
        GsonBuilder builder = new GsonBuilder();
        builder.setPrettyPrinting();
        Gson gson = builder.create();
        UserModel user = gson.fromJson(JSON, UserModel.class);
        return servicio.addUser(user);
    }
    
    @PUT
    public UserModel updateUser(String JSON) {
        GsonBuilder builder = new GsonBuilder();
        builder.setPrettyPrinting();
        Gson gson = builder.create();
        UserModel user = gson.fromJson(JSON, UserModel.class);
        return servicio.updateUser(user);
    }
    
    @DELETE
    @Path("/{UserId}")
    public String delUser(@PathParam("UserId") int id) {

        return servicio.delUser(id);

    }
    
}
