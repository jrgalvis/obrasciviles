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
        Usuarios login = (Usuarios)Session["Usuario"];
          var user = from u in dc.Usuarios
                     where u.Login == login.Login && u.Contrasena == login.Contrasena
                        select u;

          if (txtConfPwd.Text == txtPwd2.Text)
          {
              foreach (Usuarios u in user)
              {
                  u.Contrasena = txtPwd2.Text;
              }

              dc.SubmitChanges();
              Response.Redirect("Menu.aspx");
          }
          else 
          {
              lblErr.Visible = true;
          }
        
            
            

    }
}