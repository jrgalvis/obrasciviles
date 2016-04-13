using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DynamicData_CustomPages_Proyectos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["Usuario"] == null)
            Response.Redirect("Login.aspx");
    }


    [WebMethod]
    public static void CrearNuevoProyecto(string id_proyecto,
        string fecha_inicio,
        string cant_predios,
        string predios_ejecutado,
        string valor_proyecto,
        string valor_ejecutado,
        string num_disp_pres,
        string fecha_disp_pres,
        string cod_disp_pre,
        string rubro_disp_pre,
        string valor_disp_pre,
        string num_res_pre,
        string fecha_res_pre,
        string cod_res_pre,
        string rubro_res_pre,
        string valor_res_pre)
    {
        DataClassesModelDataContext dc = new DataClassesModelDataContext();

        Proyecto p = new Proyecto
        {
           IdProyecto = id_proyecto,
            FechaInicio = Convert.ToDateTime(fecha_inicio),
            CantidadPredios= Convert.ToInt32(cant_predios),
            PrediosEjecutado= Convert.ToInt32(predios_ejecutado),
            ValorProyecto= Convert.ToDecimal(valor_proyecto),
            ValorEjecutado= Convert.ToDecimal(valor_ejecutado),
            NumDispPresupuestal= Convert.ToInt32(num_disp_pres),
            FechaDispPresupuestal= Convert.ToDateTime(fecha_disp_pres),
            CodDispPresupuestal= cod_disp_pre,
            RubroDispPresupuestal= rubro_disp_pre,
            ValorDispPresupuestal= Convert.ToDecimal(valor_disp_pre),
            NumResPresupuestal= Convert.ToInt32(num_res_pre),
            FechaResPresupuestal= Convert.ToDateTime(fecha_res_pre),
            CodResPresupuestal= cod_res_pre,
            RubroResPresupuestal= rubro_res_pre,
            ValorResPresupuestal= Convert.ToDecimal(valor_res_pre)
        };

        dc.Proyecto.InsertOnSubmit(p);
        dc.SubmitChanges();

    }
}