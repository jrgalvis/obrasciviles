using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DynamicData_CustomPages_TipoGarantia : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["Usuario"] == null)
            Response.Redirect("Login.aspx");
    }

    [WebMethod]
    public static void CrearNuevoTipoGarantia(string id_garantia,
        string descrp_garantia
       )
    {
        DataClassesModelDataContext dc = new DataClassesModelDataContext();

        TipoGarantia tg = new TipoGarantia
        {
            IdGarantia = Convert.ToInt32(id_garantia),
            DescripcionGarantia = descrp_garantia
          
        };

        dc.TipoGarantia.InsertOnSubmit(tg);
        dc.SubmitChanges();

    }
}