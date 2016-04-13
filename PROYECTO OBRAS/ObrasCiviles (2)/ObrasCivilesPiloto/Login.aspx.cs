using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnOK_Click(object sender, EventArgs e)
    {
        DataClassesModelDataContext dc = new DataClassesModelDataContext();
        var user = from u in dc.Usuarios 
                   where u.Login == txtUsuario.Text && u.Contrasena == txtPwd.Text  
                        select u;
        if (user.Count() == 0)
            lblErr.Visible = true;
        else {
            Session.Add("Usuario", user);    
            Response.Redirect("Menu.aspx");
             }

    }
}