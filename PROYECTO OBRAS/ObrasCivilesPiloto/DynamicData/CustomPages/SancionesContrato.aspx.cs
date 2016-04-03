using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DynamicData_CustomPages_SancionesContrato : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["Usuario"] == null)
            Response.Redirect("Login.aspx");
    }

    [WebMethod]
    public static void CrearNuevaSancion(string idcontrato,
        string num_resolucion,
        string objeto_sancion,
        string fecha_sancion
       )
    {
        DataClassesModelDataContext dc = new DataClassesModelDataContext();

        SancionesContrato sc = new SancionesContrato
        {
            Contrato = Convert.ToInt32(idcontrato),
            NumResolucion = Convert.ToInt32(num_resolucion),
            Objeto = objeto_sancion,
            Fecha = Convert.ToDateTime(fecha_sancion)

        };

        dc.SancionesContrato.InsertOnSubmit(sc);
        dc.SubmitChanges();

    }
}