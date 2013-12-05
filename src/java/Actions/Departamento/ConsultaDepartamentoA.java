/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Actions.Departamento;

import Clases.*;
import DBMS.DBMS;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author jidc28
 */
public class ConsultaDepartamentoA extends org.apache.struts.action.Action {

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
        
        HttpSession session = request.getSession(true);
        ArrayList<Departamento> [] departamentos = null;
        Usuario usuario = (Usuario) session.getAttribute("usuario");
        String tipousuario = usuario.getTipousuario();
        //obtengo una lista de departamentos registrados
        if (tipousuario.equals("administrador")){
            Decanato d = (Decanato) form;
            departamentos = DBMS.getInstance().listarDepartamentosDecanato(d.getCodigo());
            d = DBMS.getInstance().obtenerNombreDecanato(d);
            session.setAttribute("decanato_actual",d);
        } else if (tipousuario.equals("decanato")){
            departamentos = DBMS.getInstance().listarDepartamentosDecanato(usuario.getUsbid());
        }

        //si existen departamentos registrados

            //retorno a pagina de exito
         session.setAttribute("departamentos_visibles", departamentos[0]);
         session.setAttribute("departamentos_ocultos", departamentos[1]);
         return mapping.findForward(SUCCESS);
    }
}

