const url = "http://localhost:8080/TAM_DATABASE/api/roles"
const contenedor = document.querySelector('tbody')
let resultados = ''
const modalRoles = new bootstrap.Modal(document.getElementById('modalRoles'))
const formRoles = document.querySelector('form')
const nombreRol = document.getElementById('name')
const descripcionRol = document.getElementById('descripcion')
const idRol = document.getElementById('id')
let opcion = ''
btnCrear.addEventListener('click', () => {
    
    nombreRol.value = ''
    descripcionRol.value = ''
    idRol.value = 0
    idRol.disabled = false
    modalRoles.show()
    opcion = 'crear'
})
const ajax = (options) => {
    let { url, method, success, error, data } = options;
    const xhr = new XMLHttpRequest();

    xhr.addEventListener("readystatechange", (e) => {
        if (xhr.readyState !== 4) return;

        if (xhr.status >= 200 && xhr.status < 300) {
            let json = JSON.parse(xhr.responseText);
            success(json);
        } else {
            let message = xhr.statusText || "Ocurrió un error";
            error(`Error ${xhr.status}: ${message}`);
        }
    });

    xhr.open(method || "GET", url);
    xhr.setRequestHeader("Content-type", "application/json; charset=utf-8");
    xhr.send(JSON.stringify(data));
};
const getAll = () => {
    ajax({
        url: url,
        method: "GET",
        success: (res) => {
            console.log(res);

            res.forEach((roles) => {
                resultados += `<tr>
                        <td width="1%" align="center">${roles.id}</td>
                        <td width="30%">${roles.name}</td>
                        <td width="30%">${roles.description}</td>
                        <td class="text-center" width="20%"><a class="btnEditar btn btn-warning btn-sm">Editar</a> <a class="btnBorrar btn btn-danger btn-sm">Borrar</a></td>
                    </tr>`
            });

            contenedor.innerHTML = resultados
        },
        error: (err) => {
            console.log(err);
            $table.insertAdjacentHTML("afterend", `<p><b>${err}</b></p>`);
        },
    });
};
document.addEventListener("DOMContentLoaded", getAll);
document.addEventListener("click", (e) => {

    if (e.target.matches(".btnBorrar")) {
        const fila = e.target.parentNode.parentNode
        const id = fila.firstElementChild.innerHTML
        const nombre = fila.childNodes[2].innerHTML
        const descripcion = fila.childNodes[3].innerHTML
        console.log(id)
        alertify.confirm('¿Estás seguro de eliminar '+nombre+' con id: '+id+'?',
            function () {
                ajax({
                    url: url + "/" + id,
                    method: "DELETE",
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    success: (res) => location.reload(),
                    error: (err) => alert(err),
                });
                alertify.success('Registro eliminado')
            },
            function () {
                alertify.error('Cancelado')
            });


    }
    if (e.target.matches(".btnEditar")) {
        const fila = e.target.parentNode.parentNode
        idRol.value = fila.children[0].innerHTML
        nombreRol.value = fila.children[1].innerHTML
        descripcionRol.value = fila.children[2].innerHTML
        idRol.disabled = true
        opcion = 'editar'
        modalRoles.show()
    }
})

formRoles.addEventListener('submit', (e) => {
    e.preventDefault()
    let metodo = "POST"
    if (opcion == 'editar') {
        metodo = "PUT"
 
    }
    ajax({
        url: url,
        method: metodo,
        headers: {
            'Content-Type': 'application/json'
        },
        success: (res) => location.reload(),
        error: (err) =>
            $form.insertAdjacentHTML("afterend", `<p><b>${err}</b></p>`),
        data: {
            "id": idRol.value,
            "name": nombreRol.value,
            "description": descripcionRol.value
        },
    });
    modalRoles.hide()
})
        