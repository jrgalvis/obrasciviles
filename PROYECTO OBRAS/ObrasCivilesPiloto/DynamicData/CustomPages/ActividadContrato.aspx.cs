using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

public partial class DynamicData_CustomPages_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["Usuario"] == null)
            Response.Redirect("Login.aspx");

        decimal totalvalorpresupuestado = 0;
        //double totalcantidadreal = 0;
        decimal totalvalorreal = 0;
        int fila;

        for (fila = 0; fila <= GridView1.Rows.Count-1; fila++ )
        {
            //totalcantidadpresupuestada = totalcantidadpresupuestada + Convert.ToDouble(GridView1.Rows[fila].Cells[3].Text);
            totalvalorpresupuestado = totalvalorpresupuestado + Convert.ToDecimal(GridView1.Rows[fila].Cells[4].Text);
            //totalcantidadreal = totalcantidadreal + Convert.ToDouble(GridView1.Rows[fila].Cells[5].Text);
            totalvalorreal = totalvalorreal + Convert.ToDecimal(GridView1.Rows[fila].Cells[6].Text);
        }

        GridView1.FooterRow.Cells[2].Text = "TOTAL";
        //GridView1.FooterRow.Cells[3].Text = totalcantidadpresupuestada.ToString();
        GridView1.FooterRow.Cells[4].Text = totalvalorpresupuestado.ToString();
        //GridView1.FooterRow.Cells[5].Text = totalcantidadreal.ToString();
        GridView1.FooterRow.Cells[6].Text = totalvalorreal.ToString();

    }

    [WebMethod]
    public static void CrearNuevaActividadContrato(string codigocontrato, 
        string actividad,
        string cantidadpresupuestada,
        string valorpresupuestado,
        string cantidadreal,
        string valorreal)
    {
        DataClassesModelDataContext dc = new DataClassesModelDataContext();

        ContratoActividad ca = new ContratoActividad { 
            Contrato = Convert.ToInt32(codigocontrato),
            Actividad = Convert.ToInt32(actividad),
            CantidadPresupuestada = Convert.ToDouble(cantidadpresupuestada),
            ValorPresupuestado = Convert.ToDecimal(valorpresupuestado),
            CantidadReal = Convert.ToDouble(cantidadreal),
            ValorReal = Convert.ToDecimal(valorreal)
        };

        dc.ContratoActividad.InsertOnSubmit(ca);
        dc.SubmitChanges();

    }
}