/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Actions.Departamento.Materia;

import DBMS.DBMS;
import Clases.*;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author admin
 */
public class IrModificarMateria extends org.apache.struts.action.Action {

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

        HttpSession session = request.getSession(true);
        Usuario usuario = (Usuario) session.getAttribute("usuario");
        String tipousuario = usuario.getTipousuario();

        if (tipousuario.equals("departamento")) {

            Materia materia = (Materia) form;

            materia = DBMS.getInstance().obtenerDatosMateria(materia);
            materia.setViejoCodigo(materia.getCodigo());

            String[] caracteres = materia.getCodigo().split("");

            materia.setCod1(caracteres[1] + caracteres[2]);

            materia.setCod2(caracteres[3]);
            materia.setNum2(caracteres[4]);
            materia.setNum3(caracteres[5]);
            materia.setNum4(caracteres[6]);

            request.setAttribute("modificar", "modificar");
            request.setAttribute("materia", materia);
            
            return mapping.findForward(SUCCESS);
        } else {
            return mapping.findForward(FAILURE);
        }
    }
}
