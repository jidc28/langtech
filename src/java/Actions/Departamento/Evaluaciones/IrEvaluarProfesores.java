package Actions.Departamento.Evaluaciones;

import Clases.MultiBox;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

public class IrEvaluarProfesores extends Action {

    private static final String SUCCESS = "success";
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        HttpSession session = request.getSession(true);
        String id_departamento = (String) session.getAttribute("usbid");
        
        MultiBox m = new MultiBox();
        m.getProfesores(id_departamento);
        request.setAttribute("profesores",m);
        return mapping.findForward(SUCCESS);
    }
}