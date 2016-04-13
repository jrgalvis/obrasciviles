using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DynamicData_CustomPages_ModificacionesContrato : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["Usuario"] == null)
            Response.Redirect("Login.aspx");
    }

    [WebMethod]
    public static void CrearNuevaModificacionContrato(string id_contrato,
        string tipo_modificacion,
        string fecha_modificacion,
        string plazo_modificacion,
        string valor_modificacion)
    {
        DataClassesModelDataContext dc = new DataClassesModelDataContext();

        ModificacionesContrato mc = new ModificacionesContrato
        {
            Contrato = Convert.ToInt32(id_contrato),
            TipoModificacion = Convert.ToInt32(tipo_modificacion),
            FechaModificacion = Convert.ToDateTime(fecha_modificacion),
            PlazoModificacion = Convert.ToInt32(plazo_modificacion),
            ValorModificacion = Convert.ToDecimal(valor_modificacion)
        };

        dc.ModificacionesContrato.InsertOnSubmit(mc);
        dc.SubmitChanges();

    }

    public string desdModificacion(int idmod) {
        
        DataClassesModelDataContext dc = new DataClassesModelDataContext();

         var descrmod = from t in dc.TipoModificacion
                                  where t.IdTipoModificacion == Convert.ToInt32(idmod)
                                  select t.DescripcionModificacion ;


        return descrmod.ToList()[0].ToString();
    }
}