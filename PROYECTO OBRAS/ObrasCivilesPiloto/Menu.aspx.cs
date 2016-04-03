using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class Menu : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
          
            
        if(Session["Usuario"] == null)
            Response.Redirect("Login.aspx");
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        
    }
    protected void Linkbutton3_Click(object sender, EventArgs e)
    {

    }
    protected void LinkButton4_Click(object sender, EventArgs e)
    {

    }
    protected void LinkButton5_Click(object sender, EventArgs e)
    {

    }
    protected void LinkButton6_Click(object sender, EventArgs e)
    {

    }
    protected void LinkButton7_Click(object sender, EventArgs e)
    {

    }
    protected void LinkButton8_Click(object sender, EventArgs e)
    {

    }
    protected void LinkButton9_Click(object sender, EventArgs e)
    {

    }

    protected void LinkButton10_Click(object sender, EventArgs e)
    {

    }
}