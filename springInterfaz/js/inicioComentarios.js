$(document).ready ( ()=> {

    commentsList = document.querySelector('#listComent')
    /* commentdiv = document.querySelector("#comentario")
    nameUser = document.querySelector("#user")
    text = document.querySelector("#comment") */

    $.ajax({
        //url: "http://localhost:8080/commentAlias",
        url: "http://localhost:8080/users",
        type: "GET",
        dataType: "JSON",
        success: function (res) {
            console.log(res)
            for (let i = 0; i < 5; i++) {
                commentdiv = document.createElement("div")
                nameUser = document.createElement("p")
                text = document.createElement("p")

                nameUser.innerHTML =  res[i].alias
            

                commentdiv.appendChild(nameUser)
                //commentdiv.appendChild(text)
                commentsList.appendChild(commentdiv)
            }
        }
    })
})