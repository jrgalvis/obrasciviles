using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DynamicData_CustomPages_ReciboDocumentos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["Usuario"] == null)
            Response.Redirect("Login.aspx");
    }

    [WebMethod]
    public static void CrearNuevoDocumento(string id_contrato,
        string clase_documento,
        string cantidad,
        string descripcion)
    {
        DataClassesModelDataContext dc = new DataClassesModelDataContext();

        ReciboDocumentos rd = new ReciboDocumentos
        {
            Contrato = Convert.ToInt32(id_contrato),
            Clase =clase_documento,
            Cantidad = cantidad,
            Descripcion = descripcion
        };

        dc.ReciboDocumentos.InsertOnSubmit(rd);
        dc.SubmitChanges();

    }

}
