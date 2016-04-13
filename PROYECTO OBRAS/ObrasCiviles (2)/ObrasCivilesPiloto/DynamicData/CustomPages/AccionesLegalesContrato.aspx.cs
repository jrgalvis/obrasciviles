using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DynamicData_CustomPages_AccionesLegalesContrato : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["Usuario"] == null)
            Response.Redirect("Login.aspx");
    }

    [WebMethod]
    public static void CrearNuevaAccionLegal(string idcontrato,
        string clase_accion,
        string etapa_procesal,
        string fecha_accion,
        string despacho_accion,
        string num_expediente
       )
    {
        DataClassesModelDataContext dc = new DataClassesModelDataContext();

        AccionesLegalesContrato alc = new AccionesLegalesContrato
        {
            Contrato = Convert.ToInt32(idcontrato),
            Clase = clase_accion,
            EtapaProcesal = etapa_procesal,
            Fecha = Convert.ToDateTime(fecha_accion),
            Despacho = despacho_accion,
            NumExpediente = num_expediente

        };

        dc.AccionesLegalesContrato.InsertOnSubmit(alc);
        dc.SubmitChanges();

    }
}