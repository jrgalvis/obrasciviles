using Microsoft.Reporting.WebForms;
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

        if (Session["Usuario"] == null)
            Response.Redirect("Login.aspx");

        if (!IsPostBack)
        {          
  
        }        
    }

    

    
    protected void ReportViewer1_Load(object sender, EventArgs e)
    {
        SqlPagos.SelectCommand = "SELECT * FROM [Vista_PagosContrato] WHERE CodigoContrato=" + tbCodContratoConsulta.Text;
        SqlCostosIndirectos.SelectCommand = "SELECT * FROM [Vista_CostosIndirectosContrato] WHERE CodigoContrato=" + tbCodContratoConsulta.Text;
        SqlActividades.SelectCommand = "SELECT * FROM [Vista_ActividadesContrato] WHERE CodigoContrato=" + tbCodContratoConsulta.Text;
        SqlContrato.SelectCommand = "SELECT * FROM [Vista_Contrato] WHERE CodigoContrato=" + tbCodContratoConsulta.Text;
    }

    protected void btConsultar_Click(object sender, EventArgs e)
    {
                
        //Array que contendrá los parámetros
        ReportParameter[] parameters = new ReportParameter[1];
        //Establecemos el valor de los parámetros
        parameters[0] = new ReportParameter("CodigoContrato", tbCodContratoConsulta.Text);
            
        //Pasamos el array`de los parámetros al ReportViewer
        ReportViewer1.LocalReport.SetParameters(parameters);
    }
}