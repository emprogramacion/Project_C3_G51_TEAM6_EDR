const url = "http://localhost:8080/TAM_DATABASE/api/users"
const contenedor = document.querySelector('tbody')
let resultados = ''

const modalUsers = new bootstrap.Modal(document.getElementById('modalUsers'))
const formUsers = document.querySelector('form')
const nameUser = document.getElementById('name')
const lastnameUser = document.getElementById('last name')
const emailUser = document.getElementById('email')
const passwordUser = document.getElementById('password')
const stateUser = document.getElementById('state')
const rolesidUser = document.getElementById('roles_id users')
const idUser = document.getElementById('id')

let opcion = ''

btnCrear.addEventListener('click', () => {
    
    nameUser.value = ''
    lastnameUser.value = ''
    emailUser.value = ''
    passwordUser.value = 0
    stateUser.value = ''
    rolesidUser.value = 0
    idUser.value = 0
    idUser.disabled = false
    modalUsers.show()
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

            res.forEach((users) => {
                resultados += `<tr>
                        <td width="5%">${users.id}</td>
                        <td width="15%">${users.names}</td>
                        <td width="15%">${users.last_names}</td>
                        <td width="15%">${users.email}</td>
                        <td width="10%">${users.password}</td>
                        <td width="10%">${users.state}</td>
                        <td width="10%">${users.roles_id}</td>
                        <td class="text-center" width="20%"><a class="btnEditar btn btn-primary">Editar</a><a class="btnBorrar btn btn-danger">Borrar</a></td>
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
        console.log(id)
        alertify.confirm(`¿Estás seguro de eliminar el id ${id}?`,
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
                alertify.error('Cancel')
            });


    }
    if (e.target.matches(".btnEditar")) {
        const fila = e.target.parentNode.parentNode
        idUser.value = fila.children[0].innerHTML
        nameUser.value = fila.children[1].innerHTML
        lastnameUser.value = fila.children[2].innerHTML
        emailUser.value = fila.children[3].innerHTML
        passwordUser.value = fila.children[4].innerHTML
        stateUser.value = fila.children[5].innerHTML
        rolesidUser.value = fila.children[6].innerHTML
        idUser.disabled = true
        opcion = 'editar'
        modalUsers.show()
    }
})

formUsers.addEventListener('submit', (e) => {
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
            "email": emailUser.value,
            "id": idUser.value,
            "last_names": lastnameUser.value,
            "names": nameUser.value,
            "password": passwordUser.value,
            "roles_id": rolesidUser.value,
            "state": stateUser.value
        },
    });
    modalUsers.hide()
})



