/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Actions.Coordinacion;

import Clases.Coordinacion;
import Clases.Decanato;
import DBMS.DBMS;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author Langtech
 */
public class EditarNombreCoordinacion extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
    private static final String SUCCESS = "success";

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

        Coordinacion u = (Coordinacion) form;
        HttpSession session = request.getSession(true);
        String codigoDecan = (String) session.getAttribute("codigoDecanatoActual");
        
        session.removeAttribute("coordinaciones");

        ActionErrors error = new ActionErrors();

        Coordinacion c = DBMS.getInstance().obtenerNombreCoordinacion(u);
        ArrayList<Decanato> decanatos = DBMS.getInstance().listarDecanatos();
        ArrayList<Coordinacion> coords = DBMS.getInstance().listarCoordinacionesAdscritas(codigoDecan);
        //retorno a pagina de exito
        
        request.setAttribute("decanatos", decanatos);
        request.setAttribute("codigo", c.getCodigo());
        request.setAttribute("nombre", c.getNombre());
        request.setAttribute("coordinaciones",coords);
        return mapping.findForward(SUCCESS);
    }
}
