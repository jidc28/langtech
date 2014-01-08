/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Actions.Materia;

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
 * @author smaf
 */
public class solicitarAperturaMateria extends org.apache.struts.action.Action {

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

        Materia materia = (Materia) form;

        if (materia.getCod1() == null) {
            materia.setCod1("");
        }

        if (materia.getCod2() == null) {
            materia.setCod2("");
        }

        if (materia.getNum1() == null) {
            materia.setNum1("");
        }

        if (materia.getNum2() == null) {
            materia.setNum2("");
        }

        if (materia.getNum3() == null) {
            materia.setNum3("");
        }

        if (materia.getNum4() == null) {
            materia.setNum4("");
        }

        materia.setCodigo(materia.getCod1() + materia.getCod2() + materia.getNum1() + materia.getNum2() + materia.getNum3() + materia.getNum4());

        if (materia.getCodigo().length() > 6 || materia.getCodigo().length() < 6) {
            request.setAttribute("codigo_incorrecto", materia.getCodigo());
            materia.setCod1(null);
            materia.setCod2(null);
            materia.setNum1(null);
            materia.setNum2(null);
            materia.setNum3(null);
            materia.setNum4(null);
            return mapping.findForward(FAILURE);
        } else {

            String id_departamento = DBMS.getInstance().obtenerDatosDepartamento(materia.getDepartamento());
            boolean registrada = DBMS.getInstance().solicitudRegistrarMateria(materia, id_departamento, usuario.getUsbid());

            if (registrada) {
                request.setAttribute("solicitud_enviada", SUCCESS);
                return mapping.findForward(SUCCESS);
            } else {
                request.setAttribute("solicitud_no_enviada", FAILURE);
                return mapping.findForward(FAILURE);
            }
        }
    }
}
