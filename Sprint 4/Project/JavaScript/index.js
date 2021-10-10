function RegistroExitoso(){
    var nombres=document.getElementById('nombres').value;
    var apellidos=document.getElementById('apellidos').value;
    var correo=document.getElementById('correo').value;
    var usuario=document.getElementById('usuario').value;
    var contraseña=document.getElementById('contraseña').value;
    if(nombres==='' || apellidos==='' || correo==='' || usuario==='' || contraseña===''){
        alert('Completa todos los campos para registrarse');
    }else{
        var datos= 'Sus datos son:\n Nombres: '+nombres+'\n Apellidos: '+apellidos+'\n Correo: '+correo+'\n Usuario: '+usuario+'\n Contraseña: '+contraseña ;
        alert('Registro exitoso \n' +datos);   
    }   
}

function InicioSesion(){
    var user=document.getElementById('user').value;
    var password=document.getElementById('password').value;
    if(user==='' || password===''){
        alert('Completa todos los campos para iniciar sesion');
    }else{
        alert('Bienvenido '+user+ ' a TAM DATABASE');
    } 
}
