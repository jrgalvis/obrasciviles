using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DynamicData_CustomPages_GarantiaProyecto : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["Usuario"] == null)
            Response.Redirect("Login.aspx");
    }

    [WebMethod]
    public static void CrearNuevaGarantiaProyecto(string id_proyecto,
        string tipo_garantia,
        string nombre_asegurador,
        string num_poliza,
        string fecha_ini_vigencia,
        string fecha_fin_vigencia,
        string num_cert_modificatorio)
    {
        DataClassesModelDataContext dc = new DataClassesModelDataContext();

        GarantiaProyecto gp = new GarantiaProyecto
        {
            Proyecto= id_proyecto,
            TipoGarantia= Convert.ToInt32(tipo_garantia),
            NombreAsegurador= nombre_asegurador,
            NumPoliza= num_poliza,
            FechaInicioVigencia= Convert.ToDateTime(fecha_ini_vigencia),
            FechaFinVigencia = Convert.ToDateTime(fecha_fin_vigencia),
            NumCertModificatorio= num_cert_modificatorio
        };

        dc.GarantiaProyecto.InsertOnSubmit(gp);
        dc.SubmitChanges();

    }
}