const url = "http://localhost:8080/TAM_DATABASE/api/paises"
const contenedor = document.querySelector('tbody')
let resultados = ''
const modalPaises = new bootstrap.Modal(document.getElementById('modalPaises'))
const formPaises = document.querySelector('form')
const nombrePais = document.getElementById('name')
const idPais = document.getElementById('id')
let opcion = ''
btnCrear.addEventListener('click', () => {
    
    nombrePais.value = ''
    idPais.value = 0
    idPais.disabled = false
    modalPaises.show()
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

            res.forEach((paises) => {
                resultados += `<tr>
                        <td width="1%" align="center">${paises.id}</td>
                        <td width="30%">${paises.name}</td>
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
        const nombre = fila.childNodes[3].innerHTML
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
        idPais.value = fila.children[0].innerHTML
        nombrePais.value = fila.children[1].innerHTML
        idPais.disabled = true
        opcion = 'editar'
        modalPaises.show()
    }
})

formPaises.addEventListener('submit', (e) => {
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
            "id": idPais.value,
            "name": nombrePais.value
        },
    });
    modalPaises.hide()
})
        