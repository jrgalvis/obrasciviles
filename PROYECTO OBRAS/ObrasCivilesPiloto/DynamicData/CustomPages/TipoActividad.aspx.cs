using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DynamicData_CustomPages_TipoActividad : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["Usuario"] == null)
            Response.Redirect("Login.aspx");
    }

    [WebMethod]
    public static void CrearNuevoTipoActividad(string id_tipo_act,
        string descrp_act,
        string prioridad_aju
       )
    {
        DataClassesModelDataContext dc = new DataClassesModelDataContext();

        TipoActividad ta = new TipoActividad
        {
            IdTipoActividad = Convert.ToInt32(id_tipo_act),
            DescripcionTipoActividad = descrp_act,
            PrioridadAjuste = Convert.ToInt32(prioridad_aju)

        };

        dc.TipoActividad.InsertOnSubmit(ta);
        dc.SubmitChanges();

    }
}