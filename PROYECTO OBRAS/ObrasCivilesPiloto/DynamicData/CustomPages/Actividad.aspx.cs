using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DynamicData_CustomPages_Actividad : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {


        if (Session["Usuario"] == null)
            Response.Redirect("Login.aspx");
    }
    [WebMethod]
    public static void CrearNuevaActividad(string desActividad,
        string tipoActividad,
        string unidadMedida,
        string valorUnitario)
    {
        DataClassesModelDataContext dc = new DataClassesModelDataContext();

        Actividad u = new Actividad
        {
            DescripcionActividad = desActividad,
            TipoActividad = Convert.ToInt32(tipoActividad),
            UnidadMedida = unidadMedida,
            ValorUnitario = Convert.ToDecimal(valorUnitario)
        };

        dc.Actividad.InsertOnSubmit(u);
        dc.SubmitChanges();

    }
}