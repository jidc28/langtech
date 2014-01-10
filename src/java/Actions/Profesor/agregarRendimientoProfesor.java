/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Actions.Profesor;

import Clases.*;
import DBMS.DBMS;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author jidc28
 */
public class agregarRendimientoProfesor extends org.apache.struts.action.Action {
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
        String id_profesor = (String) session.getAttribute("usbid");
        rendimientoProf renMateria = (rendimientoProf) form;

        renMateria.setUsbid_profesor(id_profesor);

        if (renMateria.getTotal_estudiantes() == 0) {
            ArrayList<Materia> materias = DBMS.getInstance().obtenerSolicitudEvaluacionesProfesor(id_profesor);
            request.setAttribute("materias", materias);
            request.setAttribute("rendimientoProf", renMateria);
            request.setAttribute("agregar_informacion",FAILURE);
            return mapping.findForward(FAILURE);
        }
        
        if (renMateria.getTotal_estudiantes() != 
            renMateria.getAplazados() + renMateria.getAprobados() + 
            renMateria.getRetirados()) {
            ArrayList<Materia> materias = DBMS.getInstance().obtenerSolicitudEvaluacionesProfesor(id_profesor);
            request.setAttribute("materias", materias);
            request.setAttribute("rendimientoProf", renMateria);
            request.setAttribute("error_num_estudiantes", renMateria);
            return mapping.findForward(FAILURE);
        }

        if (renMateria.getNota_prom() < 0.0 || renMateria.getTotal_estudiantes() < 0 ||
            renMateria.getAplazados() < 0 || renMateria.getAprobados() < 0 ||
            renMateria.getRetirados() < 0) {
            ArrayList<Materia> materias = DBMS.getInstance().obtenerSolicitudEvaluacionesProfesor(id_profesor);
            request.setAttribute("materias", materias);
            request.setAttribute("rendimientoProf", renMateria);
            request.setAttribute("numero_negativo", FAILURE);
            return mapping.findForward(FAILURE);
        }
        
        boolean agregar = DBMS.getInstance().agregarRendimientoProfesor(renMateria);

        ArrayList<rendimientoProf> rendimiento = DBMS.getInstance().obtenerRendimientoProfesor(id_profesor);
        request.setAttribute("rendimiento", rendimiento);
        if (agregar) {
            return mapping.findForward(SUCCESS);
        } else {
            return mapping.findForward(FAILURE);
        }
    }
}
