<%-- 
    Document   : ConsultaCarrera
    Created on : 10/06/2013, 07:43:54 PM
    Author     : admin
--%>

<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>  

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<script type="text/javascript" src="scripts/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
    function altRows(id) {
        if (document.getElementsByTagName) {

            var table = document.getElementById(id);
            var rows = table.getElementsByTagName("tr");

            for (i = 0; i < rows.length; i++) {
                if (i % 2 === 0) {
                    rows[i].className = "evenrowcolor";
                } else {
                    rows[i].className = "oddrowcolor";
                }
            }
        }
    }
    $(document).ready(function() {
        $('table').tablePagination({});
    });
    window.onload = function() {
        altRows('alternatecolor');
    }
</script>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <link rel="stylesheet" type="text/css" href="css/estilo.css">
        <link rel="stylesheet" type="text/css" href="css/css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="css/css/bootstrap.min.css">
        <!-- NO ME AGARRA BOOTSTRAP 
        <link rel="stylesheet" type="text/css" href="css/ccs/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="css/ccs/bootstrap.min.css"> -->
        <title>Gestion de Planillas de Evaluacion</title>
    </head>
    <body>
        <script type="text/javascript" src="scripts/jquery-1.8.3.min.js"></script>

        <logic:present name="registro">
            <br>
            <p align ="center" style="background-color: springgreen;
               width: 300px; margin-left: auto; margin-right: auto">
                Carrera registrada exitosamente.
            </p>
        </logic:present>
        <logic:present name="modificacion">
            <br>
            <p align ="center" style="background-color: springgreen;
               width: 300px; margin-left: auto; margin-right: auto">
                Carrera modificada exitosamente.
            </p>
        </logic:present>
            
        <logic:present name="eliminado">
            <br>
            <p align ="center" style="background-color: springgreen;
               width: 300px; margin-left: auto; margin-right: auto"> 
               Carrera eliminada exitosamente.
            </p>
        </logic:present>
        <logic:present name="noEliminado">
            <br>
            <p align ="center" style="background-color: springgreen;
               width: 300px; margin-left: auto; margin-right: auto"> 
               La carrera no pudo ser eliminada exitosamente.
            </p>
        </logic:present>
            
        <h4 style="margin-top: 50px;"> Lista de Carreras del 
            <bean:write name="decanato" property="nombre"/>:
        </h4>
        <br>
        <div id="testTable">
            <table border="0" style="margin: auto" class="altrowstable" id="alternatecolor">
                <thead>
                    <tr>
                        <th width="20%" align="center">
                            Codigo
                        </th>
                        <th width="20%" align="center">
                            Nombre Carrera
                        </th>
                        <th width="20%" align="center">
                            Estado
                        </th>
                        <th width="20%" align="center">
                            Editar Nombre
                        </th>
                        <th width="20%" align="center">
                            Cambiar Estado
                        </th>
                        <th width="20%" align="center">
                            Eliminar
                        </th>
                </thead>
                <logic:iterate name="carreras" id="Carreras">
                    <tr>
                        <td width="20%" align="center">
                            <bean:write name="Carreras" property="codigo"/>
                        </td>
                        <td width="20%" align="center">
                            <bean:write name="Carreras" property="nombre"/>
                        </td>
                        <td width="20%" align="center">
                            <bean:write name="Carreras" property="estado"/>
                        </td>
                        <td>
                            <html:form  action="/editarNombre" onsubmit="return(this)">
                                <html:hidden name="Carreras" property="codigo" />
                                <html:image src="imagenes/edit.png" value="" property=""/>
                            </html:form>
                        </td>
                        <td>
                            <html:form  action="/cambiarStatusCarrera" onsubmit="return(this)">
                                <html:hidden name="Carreras" property="codigo" />
                                <html:image src="imagenes/visibilidad.png" value="" property=""/>
                            </html:form>	                                        
                        </td>
                        <td>
                            <html:form action="/eliminaCarreraA" onsubmit="return(this)" style="margin: 0px;">
                                <html:hidden name="Carreras" property="codigo"/>
                                <center>
                                    <html:submit styleClass="btn btn-danger" style="margin: 5px; padding: 3px; padding-left: 5px; padding-right: 5px;"
                                                 onclick="javascript: return confirm('¿Está seguro de que desea eliminar la carrera?')">
                                        Eliminar
                                    </html:submit>
                                </center>
                            </html:form>
                        </td>
                    </tr>
                </logic:iterate>
            </table>
        </div>
        <br>
        <center>
            <html:form action="/agregaCarreraD" onsubmit="return(this)">
                <html:hidden name="Decanato" property="codigo"/>
                <html:hidden name="Decanato" property="nombre"/>
                <html:submit styleClass="btn btn-primary">
                    Agregar Carrera
                </html:submit>
            </html:form>
        </center>
    </body>
</html>