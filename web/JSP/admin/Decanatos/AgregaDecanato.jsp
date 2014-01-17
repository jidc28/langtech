<%-- 
    Document   : AgregarDecanato
    Created on : 10/06/2013, 07:43:54 PM
    Author     : Langtech
--%>

<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>  

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <link rel="stylesheet" type="text/css" href="css/estilo.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap2.3.2/css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap2.3.2/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="css/css/bootstrap.min.css">
        <title>Gestión de Decanatos</title>
    </head>
    <body>
        <script type="text/javascript" src="scripts/jquery-1.8.3.min.js"></script>

        <h4>Registro de Decanatos</h4>

        <html:form action="/registrarDecanato" method="POST" acceptCharset="ISO-8859-1" enctype="multipart/form-data" onsubmit="return(this)">
            <table border="0">
                <tbody>
                    <tr style="height: 35px;">
                        <td style="color: black; font-size: 14px; font-weight: bold;">
                            CÓDIGO DEL DECANATO
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <center>
                            <html:text name="Decanato" property="codigo" maxlength="10" value="" errorStyleClass="error"
                                       styleClass="input-codigo" style="margin-bottom: 0px;height: 30px;"
                                       errorKey="org.apache.struts.action.ERROR"></html:text>
                            </center>

                        </td>
                    </tr>
                    <tr>
                            <td colspan="2" style="color:firebrick">
                            <html:errors property="codigo"/>
                        </td>
                    </tr>
                    <tr style="height: 35px;">
                        <td style="color: black; font-size: 14px; font-weight: bold;">
                            NOMBRE DEL DECANATO
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <html:text property="nombre" name="Decanato" maxlength="50" 
                                       styleClass="input-nombre" style="height: 30px;"
                                       errorKey="org.apache.struts.action.ERROR"/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="color:firebrick">
                            <html:errors property="nombre"/>
                        </td>
                    <tr>
                        <td colspan="2" style="color:firebrick">
                            <html:errors property="registro"/>
                        </td>
                    </tr>
                </tbody>
            </table>
            <p style="text-align: center; margin-top: 10px;">
                <html:submit styleClass="btn btn-success"
                             onclick="javascript: return confirm('¿Está seguro de que los datos son correctos?')">
                    Agregar
                </html:submit>
                <html:reset styleClass="btn btn-default" value="Limpiar"/>
            </p>

        </html:form>


    </body>
</html>
