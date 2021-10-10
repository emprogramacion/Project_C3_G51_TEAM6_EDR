function contactar_soporte(){
    var nombre = document.getElementById("nombre").value;
    var doc = document.getElementById("doc").value;
    var email = document.getElementById("email").value;
    var desc = document.getElementById("desc").value;

    var datos="Nombre: "+nombre +"\n Documento: "+doc+"\n Email: "+email+"\n Descripción: "+desc;

    if(nombre === '' || doc === '' || email === '' || desc === ''){
        alert("Diligencia los campos requeridos para contactarse con el soporte");
    }else {
        alert("Solicitud al soporte técnico enviada, la respuesta a su solicitud será via email. \nSus datos son: \n "+datos);        
    }
}