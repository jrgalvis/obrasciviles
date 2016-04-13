using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DynamicData_CustomPages_AjusteContrato : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["Usuario"] == null)
            Response.Redirect("Login.aspx");
        if (GridView1.Rows.Count > 0)
        {

            decimal totalvalorpresupuestado = 0;
            decimal totalvalorreal = 0;
            decimal totalvalorrealajustado = 0;

            int fila;

            for (fila = 0; fila <= GridView1.Rows.Count - 1; fila++)
            {
                totalvalorpresupuestado = totalvalorpresupuestado + Convert.ToDecimal(GridView1.Rows[fila].Cells[3].Text);
                totalvalorreal = totalvalorreal + Convert.ToDecimal(GridView1.Rows[fila].Cells[5].Text);
                totalvalorrealajustado = totalvalorrealajustado + Convert.ToDecimal(GridView1.Rows[fila].Cells[7].Text);
            }

            GridView1.FooterRow.Cells[2].Text = "TOTAL";
            GridView1.FooterRow.Cells[3].Text = totalvalorpresupuestado.ToString();
            GridView1.FooterRow.Cells[5].Text = totalvalorreal.ToString();
            GridView1.FooterRow.Cells[7].Text = totalvalorrealajustado.ToString();
        }
    }


    protected void btnAjustar_Click(object sender, EventArgs e)
    {

    }
}