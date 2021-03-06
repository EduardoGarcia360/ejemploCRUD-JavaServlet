<%-- 
    Document   : gestion
    Created on : 28-sep-2020, 16:06:30
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
        <title>Gestion</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    </head>
    <body>
        <h1>El paciente</h1>
        <form action="Slt_paciente" method="POST">
            <table border="1" class="table table-striped table-bordered">
                <tbody>
                    <%
                    ArrayList<Paciente> lista = (ArrayList<Paciente>)request.getAttribute("gestion");
                    for (int i = 0; i<lista.size(); i++){
                        Paciente p = lista.get(i);
                        %>
                        <tr>
                            <td>CODIGO</td>
                            <td>
                                <input type="text" name="txtCodigo" value="<%= p.getCodigo()%>">
                            </td>
                        </tr>
                        <tr>
                            <td>NOMBRE</td>
                            <td>
                                <input type="text" name="txtNombre" value="<%= p.getNombre()%>">
                            </td>
                        </tr>
                        <tr>
                            <td>DIRECCION</td>
                            <td>
                                <input type="text" name="txtDireccion" value="<%= p.getDireccion()%>">
                            </td>
                        </tr>
                        <tr>
                            <td>GENERO</td>
                            <td>
                                <input type="text" name="txtGenero" value="<%= p.getGenero()%>">
                            </td>
                        </tr>
                        <tr>
                            <td>TIPO DE SANGRE</td>
                            <td>
                                <input type="text" name="txtTipo" value="<%= p.getTipo_de_sangre()%>">
                            </td>
                        </tr>
                        <% 
                            if (p.getCodigo() == 0) {
                        %>
                        <tr>
                            <td></td>
                            <td>
                                <input type="submit" name="btnGuardar" value="Agregar Paciente">
                                <input type="hidden" name="accion" value="insertar">
                            </td>
                        </tr>
                        <%
                            } else {
                        %>
                        <tr>
                            <td></td>
                            <td>
                                <input type="submit" name="btnGuardar" value="Actualizar Paciente">
                                <input type="hidden" name="accion" value="actualizar">
                            </td>
                        </tr>
                        <%
                        }
                    }
                    %>
                </tbody>
            </table>
        </form>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    </body>
</html>
