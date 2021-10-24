
package restful;

import javax.ws.rs.core.Context;
import javax.ws.rs.core.UriInfo;
import javax.ws.rs.Consumes;
import javax.ws.rs.Produces;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PUT;
import javax.ws.rs.core.MediaType;


@Path("user")
public class user {

    @GET
    @Produces(MediaType.TEXT_PLAIN)
    public String getXml() {
        return "Bienvenidos";
    }


}
