function datos_registrados(){
    var latitud = document.getElementById('latitud').value;
    var orden = document.getElementById('orden').value;
    var longitud = document.getElementById('longitud').value;
    var familia = document.getElementById('familia').value;
    var pais = document.getElementById('pais').value;
    var especie = document.getElementById('especie').value;
    var localidad = document.getElementById('localidad').value;
    var elevacion = document.getElementById('elevacion').value;
    var genero = document.getElementById('genero').value;
    var codigo_genbank = document.getElementById('geob').value;
    var marcador_molecular = document.getElementById('marmol').value;
    var referencia = document.getElementById('referencia').value;

    var datos="Latitud: "+ latitud + "\n Longitud: "+longitud + "\n Orden: " + orden + "\n Familia: " + familia
    + "\n Pais: "+ pais + "\n Especie: "+ especie + "\n Localidad: "+ localidad + "\n Elevacion: "+ elevacion 
    + "\n Genero: "+ genero + "\n Codigo genbank: "+ codigo_genbank + "\n Marcador molecular: "+marcador_molecular
    + "\n Referencia: "+referencia;

    if (latitud === '' || orden === '' || longitud === '' || pais === '' || especie === '' || genero === ''
    || codigo_genbank === '' || marcador_molecular === '' || referencia === ''){
        alert("Los campos obligatorios no pueden estar vacíos");
    }else {
        alert("Registro de datos biológicos exitoso \n " + datos );               
    }

}