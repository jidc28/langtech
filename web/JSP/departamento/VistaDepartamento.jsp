<%-- 
    Document   : VistaAdministrador
    Created on : 06/06/2013, 10:04:58 PM
    Author     : Langtech
--%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>  

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<script type="text/javascript" src="scripts/jquery-1.8.3.min.js"></script>
<script src="css/js/bootstrap.min.js"></script>
<!DOCTYPE html>
<html>
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <link href="css/css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link rel="stylesheet" type="text/css" href="css/estilo.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap2.3.2/css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap2.3.2/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="css/css/bootstrap.min.css">
        <title>Gestion de Planillas de Evaluación</title>
    </head>
    <body>
        <div class="panel-group" id="accordion">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseMaterias">
                            Gestión de Materias
                        </a>
                    </h4>
                </div>
                <div id="collapseMaterias" class="panel-collapse collapse">
                    <div class="panel-body">
                        <html:link action="/vistaAgregaMateria">
                            <h5 align ="center">Agregar Materia</h5>
                        </html:link>
                        <html:link action="/consultaMateria">
                            <h5 align ="center">Consultar Materias</h5>
                        </html:link>
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseProfesor">
                            Gestión de Profesores
                        </a>
                    </h4>
                </div>
                <div id="collapseProfesor" class="panel-collapse collapse">
                    <div class="panel-body">
                        <html:link action="/consultaProfesor">
                            <h5 align ="center">Evaluar Profesores</h5>
                        </html:link>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>