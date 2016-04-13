using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DynamicData_CustomPages_SuspencionesContrato : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["Usuario"] == null)
            Response.Redirect("Login.aspx");
    }

    [WebMethod]
    public static void CrearNuevaSuspencion(string idcontrato,
        string num_acta,
        string tipo_acta,
        string fecha_acta_susp,
        string fecha_inicio_susp,
        string fecha_fin_susp,
        string duracion_sancion,
        string fecha_reanu_susp
       )
    {
        DataClassesModelDataContext dc = new DataClassesModelDataContext();

        SuspencionContrato suspc = new SuspencionContrato
        {
            Contrato = Convert.ToInt32(idcontrato),
            NumActa = Convert.ToInt32(num_acta),
            TipoActa = tipo_acta,
            FechaActaSuspencion = Convert.ToDateTime(fecha_acta_susp),
            FechaInicioSuspencion = Convert.ToDateTime(fecha_inicio_susp),
            FechaFinSuspencion = Convert.ToDateTime(fecha_fin_susp),
            Duracion = Convert.ToInt32(duracion_sancion),
            FechaReanudacion = Convert.ToDateTime(fecha_reanu_susp)

        };

        dc.SuspencionContrato.InsertOnSubmit(suspc);
        dc.SubmitChanges();

    }
}