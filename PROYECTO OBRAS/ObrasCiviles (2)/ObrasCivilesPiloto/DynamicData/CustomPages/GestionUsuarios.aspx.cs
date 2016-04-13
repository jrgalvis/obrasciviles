using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DynamicData_gestionusuarios : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["Usuario"] == null)
            Response.Redirect("Login.aspx");
    }

    [WebMethod]
    public static void CrearNuevoUsuario(string login,
        string psw,
        string tercero)
    {
        DataClassesModelDataContext dc = new DataClassesModelDataContext();

        Usuarios u = new Usuarios
        {
            Login = login,
            Contrasena = psw,
            Tercero = Convert.ToInt32(tercero)            
        };

        dc.Usuarios.InsertOnSubmit(u);
        dc.SubmitChanges();

    }
}