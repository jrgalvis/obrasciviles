using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

public partial class DynamicData_CustomPages_UnidadMedida : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["Usuario"] == null)
            Response.Redirect("Login.aspx");
    }

    [WebMethod]
    public static void CrearNuevaUnidadMedida(string codigounidad, string descripcionunidad)
    {
        DataClassesModelDataContext dc = new DataClassesModelDataContext();

        UnidadMedida um = new UnidadMedida { CodUnidad = codigounidad, DescripcionUnidad = descripcionunidad };

        dc.UnidadMedida.InsertOnSubmit(um);
        dc.SubmitChanges();
        
    }
}