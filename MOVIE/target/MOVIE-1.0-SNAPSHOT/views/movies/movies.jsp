<%--
  Created by IntelliJ IDEA.
  User: omar-
  Date: 30/07/2021
  Time: 09:11 a. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}" />
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${context}/assets/plugins/bootstrap/css/bootstrap.min.css">
    <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
   </head>
<body>

<div class="container">
    <br>
    <button type="button" class="btn btn-outline-success btn-sm"  data-bs-toggle="modal" data-bs-target="#create"><i class="fas fa-plus"></i> Agregar Película</button>
    <br>
    <table class="table">
        <thead class="table-dark">
        <th>No</th>
        <th>Nombre</th>
        <th>Descripción</th>
        <th>Fecha de estreno</th>
        <th>Dinero recaudado</th>
        <th>Estatus</th>
        <th>Acciones</th>
        </thead>
        <tbody>
        <c:forEach items="${ listMovie }" var="movie" varStatus="status">
            <tr>
                <td>${movie.id}</td>
                <td>${movie.name}</td>
                <td>${movie.description}</td>
                <td>${movie.premiereDate}</td>
                <td>${movie.collection}</td>
                <td>
                    <c:if test="${ movie.status == 1 }">
                        Activa
                    </c:if>
                    <c:if test="${ movie.status == 0 }">
                        Inactiva
                    </c:if>
                </td>
                <td>
                    <c:if test="${ movie.status == 1 }">
                        <button type="button" class="btn btn-outline-primary btn-sm" onclick="update('${ movie.id}', '${movie.name}', '${movie.description}', '${movie.premiereDate}', '${movie.collection}');" data-bs-toggle="modal" data-bs-target="#modify"> <i class="fas fa-edit"></i>Modificar</button>
                        <button type="button" class="btn btn-outline-danger btn-sm" onclick="deleteMovie('${ movie.id }','${movie.name}');" data-bs-toggle="modal" data-bs-target="#delete"> <i class="fas fa-trash"></i> Eliminar</button>
                    </c:if>
                    <c:if test="${ movie.status == 0 }">
                        <button type="button" class="btn btn-outline-info btn-sm" onclick="details('${ movie.id}', '${movie.name}', '${movie.description}', '${movie.premiereDate}', '${movie.collection}')" data-bs-toggle="modal" data-bs-target="#details"> <i class="fas fa-info-circle"></i>Detalles</button>
                    </c:if>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>


    <div class="modal fade" id="modify" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Modificar película</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="${context}/ServletMovie" method="POST">
                        <input type="hidden" value="update" name="action">
                        <input type="hidden" name="id" id="id">
                        <label>Nombre:</label>
                        <input class="form-control" type="text" name="name" id="name" />
                        <br>
                        <label>Descripción:</label>
                        <input class="form-control" type="text" name="description" id="description"/>
                        <br>
                        <label>Fecha de estreno:</label>
                        <input class="form-control" type="date" name="date" id="date" />
                        <br>
                        <label>Dinero recaudado:</label>
                        <input class="form-control" type="number" name="collection" id="collection" step="any"/>
                        <br>
                        <span style="color: green " >Activa</span>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal"><i class="fas fa-times"></i> Cerrar</button>

                    <button type="submit" class="btn btn-primary"><i class="fas fa-edit"></i> Modificar</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

<div class="modal fade" id="create" tabindex="-1" aria-labelledby="exampleModalLabel2" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel2">Registrar película</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="${context}/ServletMovie" method="POST">
                    <input type="hidden" value="create" name="action">
                    <label>Nombre:</label>
                    <input class="form-control" type="text" name="name" />
                    <br>
                    <label>Descripción:</label>
                    <input class="form-control" type="text" name="description" />
                    <br>
                    <label>Fecha de estreno:</label>
                    <input class="form-control" type="date" name="date" />
                    <br>
                    <label>Dinero recaudado:</label>
                    <input class="form-control" type="number" name="collection" step="any"/>
                    <br>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal"><i class="fas fa-times"></i> Cerrar</button>

                <button type="submit" class="btn btn-success"><i class="fas fa-plus"></i> Agregar</button>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="delete" tabindex="-1" aria-labelledby="exampleModalLabel3" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel3">Eliminar pelicula</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="${context}/ServletMovie" method="POST">
                    <input type="hidden" value="delete" name="action">
                    <input type="hidden" id="id1" name="id">
                    ¿Estás seguro de querer eliminar la película <span id="name1"></span>?

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal"><i class="fas fa-times"></i> Cerrar</button>

                <button type="submit" class="btn btn-danger"><i class="fas fa-trash"></i> Eliminar</button>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="details" tabindex="-1" aria-labelledby="exampleModalLabel4" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel4">Detalles de la película</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <label>Id: </label>
                <br>
                <b><span id="id2"></span></b>
                <br>
                <label>Nombre: </label>
                <br>
                <b><span id="name2"></span></b>
                <br>
                <label>Descripción: </label>
                <br>
                <b><span id="description2"></span></b>
                <br>
                <label>Fecha de estreno: </label>
                <br>
                <b><span id="primiereDate2"></span></b>
                <br>
                <label>Dinero Recaudado: </label>
                <br>
                <b><span id="collection2"></span></b>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal"><i class="fas fa-times"></i> Cerrar</button>
            </div>
        </div>
    </div>
</div>

<script>
    function update(id,name,description,date,collection){

        document.getElementById("id").value=id;
        document.getElementById("name").value=name;
        document.getElementById("description").value=description;
        document.getElementById("date").value=date;
        document.getElementById("collection").value=collection;

    }
</script>

<script>
    function deleteMovie(id, name1){
        document.getElementById("id1").value=id;
        document.getElementById("name1").innerHTML=name1
    }
</script>

<script>

    function details(id,name,description,date,collection){
        document.getElementById("id2").innerHTML=id;
        document.getElementById("name2").innerHTML=name;
        document.getElementById("description2").innerHTML=description;
        document.getElementById("primiereDate2").innerHTML=date;
        document.getElementById("collection2").innerHTML=collection;
    }


</script>

<script src="${context}/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="${context}/assets/dist/js/main.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@v5.0.6/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>

</body>
</html>