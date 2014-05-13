<%-- 
    Document   : obtener_evaluaciones_pagina
    Created on : Feb 28, 2014, 10:22:32 AM
    Author     : smaf
--%>
<%@page import="Clases.Usuario"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>  

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%    
    if (session.getAttribute("usuario") == null) {
%>
    <tiles:insert definition="baseCoordinacion"/>
    <script>
        login()
    </script>
<%    
    } else {
        Usuario usuario = (Usuario) session.getAttribute("usuario");
        String tipousuario = usuario.getTipousuario();
        if (tipousuario.equals("coordinacion")) {
%>
    <tiles:insert definition="obtenerEvaluacionCoordinacion"/>
<%    
        } else if (tipousuario.equals("departamento")) {
%>
    <tiles:insert definition="obtenerEvaluacionDepartamento"/>
<%
       } else if (tipousuario.equals("decanato")) {
%>
    <tiles:insert definition="obtenerEvaluacionDecanato"/>
<%
       } else {
%>
    <tiles:insert definition="noAutorizado"/>
<%            
        }
    }
%>