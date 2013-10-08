<%-- 
    Document   : ShowUser
    Created on : 10/06/2013, 07:43:54 PM
    Author     : admin
--%>

<%@page import="com.myapp.struts.Usuario"%>
<%@page import="java.util.ArrayList"%>
<%
    Object usbid = session.getAttribute("usbid");
    ArrayList<Usuario> users = (ArrayList<Usuario>) session.getAttribute("usuarios");
    if (usbid != "") {%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>  

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <link rel="stylesheet" type="text/css" href="css/StylesheetEvalProf.css">
        <title>Gestion de Planillas de Evaluacion</title>
    </head>
    <body>
        <script type="text/javascript" src="scripts/jquery-1.8.3.min.js"></script>
        <div id="contenedor">

            <div id="encabezado">
                <a title="Inicio" rel="home">
                    <img src="imagenes/logo.jpg" alt="Inicio">
                </a>
            </div>


            <div id="encabezado">
                <div id="menu-principal">          
                    <ul id="menu">
                        <table>
                            <tbody>
                                <tr>
                                    <td>
                                        Bienvenido, administrador
                                        <html:link href="noimplementado.jsp">Perfil</html:link> |
                                        <html:link href="VistaAdministrador.jsp">
                                            Inicio
                                        </html:link> |
                                        <html:link href="noimplementado.jsp">
                                            Contáctenos
                                        </html:link> |
                                        <html:link href="noimplementado.jsp">
                                            Ayuda
                                        </html:link> |
                                        <html:link action="/cerrarSesion" onclick="return confirm('¿Está seguro que desea cerrar sesión?')">
                                            Cerrar Sesión
                                        </html:link> 
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </ul>
                </div>
            </div>

            <div id="cuerpo-principal">

                <div id="contenido-der">
                    <h1 style="background-color: cornflowerblue;width: 140px;margin-left: auto; margin-right: auto">Lista de Profesores</h1>
                    <div id="content">

                        <%if (users.size() != 0) {%>
                        <div style="width: 604px;margin-left: auto; margin-right: auto;">



                            <table>
                                <tbody>
                                    <tr>
                                        <td>
                                            <h1 style="width: 150px;margin-left: auto; margin-right: auto;color: darkblue">Usbid</h1>	
                                        </td>
                                        <td>
                                            <h1 style="width: 150px;margin-left: auto; margin-right: auto;color: darkblue">Tipo de Usuario</h1>	
                                        </td>
                                        <td>
                                            <h1 style="width: 150px;margin-left: auto; margin-right: auto;color: darkblue">Departamento</h1>	
                                        </td>
                                    </tr>
                                    <%for (int i = 0; i < users.size(); i++) {%>
                                    <tr>
                                        <td>
                                            <p style="color: green"> <%=users.get(i).getUsbid()%></p>	
                                        </td>
                                        <td>
                                            <p style="color: green"> <%=users.get(i).getTipousuario()%></p>	
                                        </td>
                                        <td>
                                            <p style="color: green"> <%=users.get(i).getDepartamento()%></p>	
                                        </td>
                                        <td>
                                            <html:form  action="/editarProfesor">
                                                <html:hidden property="usbid" value="<%=users.get(i).getUsbid()%>"/>
                                                <html:hidden property="tipousuario" value="<%=users.get(i).getTipousuario()%>"/>
                                                <html:hidden property="departamento" value="<%=users.get(i).getDepartamento()%>"/>
                                                <html:submit value="Editar"/>
                                            </html:form>
                                        </td>
                                        <td>
                                            <html:form  action="/eliminarProfesor">
                                                <html:hidden property="usbid" value="<%=users.get(i).getUsbid()%>"/>
                                                <html:hidden property="tipousuario" value="<%=users.get(i).getTipousuario()%>"/>
                                                <html:hidden property="departamento" value="<%=users.get(i).getDepartamento()%>"/>
                                                <html:submit value="Eliminar" onclick="return confirm('¿Está seguro que desea eliminar este usuario?')"/>
                                            </html:form>	                                        
                                        </td>
                                    </tr>
                                    <%}%>
                                </tbody>
                            </table>


                            <%} else {%>
                            No hay Usuarios En el Sistema para Mostrar
                            <%}%>

                        </div>


                    </div>
                </div>
            </div>

        </div>

    </body>
</html>

<%} else {%>
<html>

    <title> hello</title>
</html>
<% }%>
