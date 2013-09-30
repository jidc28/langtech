/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.myapp.struts;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author admin
 */
public class GuardarModificarInfoP extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
    private static final String SUCCESS = "success";
    private static final String FAILURE = "failure";

    /**
     * This is the action called from the Struts framework.
     *
     * @param mapping The ActionMapping used to select this instance.
     * @param form The optional ActionForm bean for this request.
     * @param request The HTTP Request we are processing.
     * @param response The HTTP Response we are processing.
     * @throws java.lang.Exception
     * @return
     */
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        Profesor u = (Profesor) form;
        HttpSession session = request.getSession(true);

        ActionErrors error = new ActionErrors();

        //valido los campos de formulario
        error = u.validate(mapping, request);
        boolean huboError = false;

        //sino los campos no son validos
        if (error.size() != 0) {
            huboError = true;
        }

        //si los campos no son validos
        if (huboError) {
            return mapping.findForward(FAILURE);
            //si los campos son validos
        } else {

            //obtengo informacion del profesor actual del sistema
            boolean actualizar = DBMS.getInstance().actualizarInfoProfesor(u);

            //retorno a pagina de exito
            session.setAttribute("usbid", u.getUsbid());

            if (actualizar) {
                return mapping.findForward(SUCCESS);
            } else {
                return mapping.findForward(FAILURE);
            }
        }
    }
}
