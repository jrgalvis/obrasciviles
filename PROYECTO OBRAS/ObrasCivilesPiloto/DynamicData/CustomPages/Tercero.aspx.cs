using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DynamicData_CustomPages_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["Usuario"] == null)
            Response.Redirect("Login.aspx");
    }

    [WebMethod]
    public static void CrearNuevoTercero(string tipoId,
        string identificacion,
        string nombre,
        string direccion,
        string telefonofijo,
        string celular,
        string tipotercero)
    {
        DataClassesModelDataContext dc = new DataClassesModelDataContext();

        Tercero t = new Tercero
        {
            TipoIdentificacion = tipoId,
            Identificacion = identificacion,
            Nombre = nombre,
            Direccion = direccion,
            TelefonoFijo = Convert.ToDecimal(telefonofijo),
            Celular = Convert.ToDecimal(celular),
            TipoTercero = Convert.ToInt32(tipotercero)
        };

        dc.Tercero.InsertOnSubmit(t);
        dc.SubmitChanges();

    }
}