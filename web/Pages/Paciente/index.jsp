<%-- 
    Document   : index
    Created on : 28-sep-2020, 15:32:56
    Author     : Eduardo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Clases.Paciente"%>
<%@page import="java.util.*"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Paciente</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    </head>
    <body>
        <h1>Listado de Pacientes</h1>
        <table>
            <tbody>
                <tr>
                    <td>
                        <a href="Slt_paciente?accion=nuevo">
                            <img src="img/add_icon.png" width="30" title="Nuevo">
                        </a>
                    </td>
                </tr>
            </tbody>
        </table>
        <table border="1" class="table table-striped table-bordered">
            <thead>
                <tr>
                    <th>CODIGO</th>
                    <th>NOMBRE</th>
                    <th>DIRECCION</th>
                    <th>GENERO</th>
                    <th>TIPO DE SANGRE</th>
                    <th>ACCIONES</th>
                </tr>
            </thead>
            <tbody>
                <%
                    ArrayList<Paciente> lista = (ArrayList<Paciente>)request.getAttribute("listar");
                    for (int i = 0; i<lista.size(); i++){
                        Paciente p = lista.get(i);
                        %>
                        <tr>
                            <td><%= p.getCodigo()%></td>
                            <td><%= p.getNombre()%></td>
                            <td><%= p.getDireccion()%></td>
                            <td><%= p.getGenero()%></td>
                            <td><%= p.getTipo_de_sangre()%></td>
                            <td>
                                <a href="Slt_paciente?accion=consultar&codigo=<%= p.getCodigo()%>">
                                    <img src="img/edit_icon.png" width="30" title="Editar">
                                </a>
                                <a href="Slt_paciente?accion=eliminar&codigo=<%= p.getCodigo()%>" onclick="return confirm('¿Desea eliminar el paciente con codigo: <%= p.getCodigo()%>?')">
                                    <img src="img/delete_icon.png" width="30" title="Editar">
                                </a>
                            </td>
                        </tr>
                        <%
                    }
                %>
            </tbody>
        </table>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    </body>
</html>
