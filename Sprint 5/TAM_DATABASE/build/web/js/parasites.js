const url = "http://localhost:8080/TAM_DATABASE/api/parasites"
const contenedor = document.querySelector('tbody')
let resultados = ''
const modalParasites = new bootstrap.Modal(document.getElementById('modalParasite'))
const formParasites = document.querySelector('form')
const nombreParasite = document.getElementById('name')
const idParasite = document.getElementById('id')
let opcion = ''
btnCrear.addEventListener('click', () => {
    
    nombreParasite.value = ''
    idParasite.value = 0
    idParasite.disabled = false
    modalParasites.show()
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

            res.forEach((parasite) => {
                resultados += `<tr>
                        <td width="1%" align="center">${parasite.id}</td>
                        <td width="30%">${parasite.gender}</td>
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
        idParasite.value = fila.children[0].innerHTML
        nombreParasite.value = fila.children[1].innerHTML
        idParasite.disabled = true
        opcion = 'editar'
        modalParasites.show()
    }
})

formParasites.addEventListener('submit', (e) => {
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
            "id": idParasite.value,
            "gender": nombreParasite.value
        },
    });
    modalParasites.hide()
})
        






