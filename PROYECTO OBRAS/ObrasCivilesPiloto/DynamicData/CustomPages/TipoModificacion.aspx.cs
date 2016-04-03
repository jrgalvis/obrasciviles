using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DynamicData_CustomPages_TipoModificacion : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["Usuario"] == null)
            Response.Redirect("Login.aspx");
    }

    [WebMethod]
    public static void CrearNuevoTipoModificacion(string id_tipo_mod,
        string descrp_mod
       )
    {
        DataClassesModelDataContext dc = new DataClassesModelDataContext();

        TipoModificacion tm = new TipoModificacion
        {
            IdTipoModificacion = Convert.ToInt32(id_tipo_mod),
            DescripcionModificacion = descrp_mod

        };

        dc.TipoModificacion.InsertOnSubmit(tm);
        dc.SubmitChanges();

    }
}