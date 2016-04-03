using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

public partial class Custom_frm_contratos : System.Web.UI.Page
{
    private DataClassesModelDataContext dc;
    public static bool inserto;
        protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["Usuario"] == null)
            Response.Redirect("Login.aspx");

        dc = new DataClassesModelDataContext();
        if (!IsPostBack || inserto) 
        {
            BindData();
            inserto = false;
        }
        
        
      
    }

    [WebMethod]
        public static bool InsertContrato(string contrato, string nombreContrato, string tipoObra, string Oferente, string interventor, string Asignacion, string Supervisor, string Contratante, decimal? Valor, string Subsidio, string Beneficiario, string aportesContratante, string Predio, string Proyecto, string Estado, string PlazoInicial, string PlazoAdicional, string tiempoSuspencion, string PlazoTotal, string fechaInicio, string fechaReinicio, string fechaTerminacion) 
        {
            Contrato nContrato = new Contrato();
            nContrato.CodigoContrato = Convert.ToInt32(contrato);
            nContrato.NombreContrato = nombreContrato;
            nContrato.TipoObra = Convert.ToInt32(tipoObra);
            nContrato.Oferente = Convert.ToInt32(Oferente);
            nContrato.Interventor = Convert.ToInt32(interventor);
            nContrato.Asignacion = Convert.ToInt32(Asignacion);
            nContrato.Supervisor = Convert.ToInt32(Supervisor);
            nContrato.ContratanteContrato = Convert.ToInt32(Contratante);
            nContrato.ValorContrato = Valor;
            nContrato.ValorSubsidio = Convert.ToInt32(Subsidio);
            nContrato.ValorAportesBeneficiario = Convert.ToInt32(Beneficiario);
            nContrato.ValorAportesOferente = Convert.ToInt32(aportesContratante);
            nContrato.PredioContrato = Predio;
            nContrato.Proyecto = Proyecto;
            nContrato.Estado = Convert.ToInt32(Estado);
            nContrato.PlazoInicial = Convert.ToInt32(PlazoInicial);
            nContrato.PlazoAdicional = Convert.ToInt32(PlazoAdicional);
            nContrato.TiempoSuspencion = Convert.ToInt64(tiempoSuspencion);
            nContrato.PlazoTotal = Convert.ToInt32(PlazoTotal);
            nContrato.FechaActaInicio = Convert.ToDateTime(fechaInicio);
            nContrato.FechaReinicio = Convert.ToDateTime(fechaReinicio);
            nContrato.FechaTerminacion = Convert.ToDateTime(fechaTerminacion);
            DataClassesModelDataContext dc = new DataClassesModelDataContext();
            dc.Contrato.InsertOnSubmit(nContrato);
            dc.SubmitChanges();
            inserto = true;
            return true;
        }
    private void BindData() 
    {
        var dsMaster = from u in dc.vista_contratos
                       //  where u.Login == txtUsuario.Text && u.Contrasena == txtPwd.Text
                       select u;
        gvMaster.DataSource = dsMaster;
        gvMaster.DataBind();

        
        var dsTipoObra = from to in dc.TipoObra
                         select to;

        ddlTipoObraInsert.DataSource = dsTipoObra;
        ddlTipoObraInsert.DataValueField = "IdTipoObra";
        ddlTipoObraInsert.DataTextField = "DescripcionObra";
        ddlTipoObraInsert.DataBind();

        var dsOferente = from of in dc.Tercero where of.TipoTercero == 4
                         select of;

        ddlOferenteInsert.DataSource = dsOferente;
        ddlOferenteInsert.DataValueField = "IdTercero";
        ddlOferenteInsert.DataTextField = "Nombre";
        ddlOferenteInsert.DataBind();

        var dsInterventor = from tor in dc.Tercero where tor.TipoTercero == 2
                         select tor;
        ddlInterventorInsert.DataSource = dsInterventor;
        ddlInterventorInsert.DataValueField = "IdTercero";
        ddlInterventorInsert.DataTextField = "Nombre";
        ddlInterventorInsert.DataBind();

        var dsAsignacion = from asg in dc.AsignacionObra 
                         select asg;
        ddlAsignacion.DataSource = dsAsignacion;
        ddlAsignacion.DataValueField = "IdAsignacion";
        ddlAsignacion.DataTextField = "DescripcionAsignacion";
        ddlAsignacion.DataBind();


        var dsSupervisor = from sup in dc.Tercero where sup.TipoTercero == 3
                         select sup;
        ddlSupervisor.DataSource = dsSupervisor;
        ddlSupervisor.DataValueField = "IdTercero";
        ddlSupervisor.DataTextField = "Nombre";
        ddlSupervisor.DataBind();


        var dsContratante = from sup in dc.Tercero where sup.TipoTercero == 1
                         select sup;
        ddlContratanteins.DataSource = dsContratante;
        ddlContratanteins.DataValueField = "IdTercero";
        ddlContratanteins.DataTextField = "Nombre";
        ddlContratanteins.DataBind();

               
        var dsPredio = from sup in dc.Predio
                         select sup;

        ddlPredio.DataSource = dsPredio;
        ddlPredio.DataValueField = "chip";
        ddlPredio.DataTextField = "chip";
        ddlPredio.DataBind();


        var dsProyecto = from sup in dc.Proyecto
                         select sup;

        ddlProyecto.DataSource = dsProyecto;
        ddlProyecto.DataValueField = "IdProyecto";
        ddlProyecto.DataTextField = "IdProyecto";
        ddlProyecto.DataBind();


        var dsEstado = from sup in dc.EstadoContrato
                         select sup;

        ddlEstado.DataSource = dsEstado;
        ddlEstado.DataValueField = "IdEstado";
        ddlEstado.DataTextField = "DescripcionEstado";
        ddlEstado.DataBind();

    }
    protected void gvMaster_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        //int intConID = Convert.ToInt32(gvMaster.Rows[e.RowIndex].Cells[47].Text);
        int intConID = Convert.ToInt32(gvMaster.DataKeys[e.RowIndex].Values["CodigoContrato"]);
        /*SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["NorthWindCSConnectionString"].ConnectionString);
        SqlCommand command = new SqlCommand("select * from Products where CategoryID = " + intCatID, connection);*/

        var dsMaster = from u in dc.ContratoActividad
                       where u.Contrato == intConID
                       select u;


        try
        {
            if (dsMaster.Count() != 0)
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), Guid.NewGuid().ToString(), "alert('Este contrato no se puede borrar, ya que tiene actividades asociadas');", true);
                e.Cancel = true;
                return;
            }
        }
        catch (Exception exp)
        {
            ScriptManager.RegisterStartupScript(Page, GetType(), Guid.NewGuid().ToString(), "alert('SQLException : " + exp.Message + "');", true);
            e.Cancel = true;
            return;
        }
        finally
        {

        }
        ScriptManager.RegisterStartupScript(Page, GetType(), Guid.NewGuid().ToString(), "javascript:if(confirm('Are you sure you want to delete?') == false) return false;", true);
        e.Cancel = true;
        var Cdelete = (from d in dc.Contrato
                      where d.CodigoContrato == intConID select d).Single();

        Cdelete.Estado = 2;
        dc.SubmitChanges();
        BindData();
    }
    protected void gvMaster_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvMaster.EditIndex = e.NewEditIndex;
        GridViewRow editingRow = gvMaster.Rows[e.NewEditIndex];
        DropDownList ddlTipoObra = (editingRow.FindControl("ddlTipoObra") as DropDownList);
        var tipoObras = from o in dc.TipoObra
                        select o;
        ddlTipoObra.DataSource = tipoObras;
        ddlTipoObra.DataTextField = "DescripcionObra";
        ddlTipoObra.DataValueField = "IdTipoObra";
        ddlTipoObra.DataBind();
        TextBox prub = (TextBox)editingRow.FindControl("CodigoContrato");
        
        BindData();

    }
    protected void gvMaster_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvMaster.EditIndex = -1;
        BindData();
    }
    protected void gvMaster_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void btnEliminar_Click(object sender, EventArgs e)
    {
        
    }
    protected void gvMaster_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

    }
    protected void gvMaster_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "EditRow")
        {
            int rowindex = ((GridViewRow)((LinkButton)e.CommandSource).NamingContainer).RowIndex;
            gvMaster.EditIndex = rowindex;
            BindData();
            DropDownList ddlTipoObra = (gvMaster.Rows[rowindex].FindControl("ddlTipoObra") as DropDownList);
            var tipoObras = from o in dc.TipoObra
                            select o;
            ddlTipoObra.DataSource = tipoObras;
            ddlTipoObra.DataTextField = "DescripcionObra";
            ddlTipoObra.DataValueField = "IdTipoObra";
            llenarCombosEdicion(rowindex, ref ddlTipoObra, "IdTipoObra");
            ddlTipoObra.DataBind();


            DropDownList ddlTerceroOferente = (gvMaster.Rows[rowindex].FindControl("ddlOferente") as DropDownList);
            var TerceroOferentes = from o in dc.Tercero where o.TipoTercero == 4
                            select o;
            ddlTerceroOferente.DataSource = TerceroOferentes;
            ddlTerceroOferente.DataTextField = "Nombre";
            ddlTerceroOferente.DataValueField = "IdTercero";
            llenarCombosEdicion(rowindex, ref ddlTerceroOferente, "TerceroOferente");
            ddlTerceroOferente.DataBind();


            DropDownList ddltercerointerventor = (gvMaster.Rows[rowindex].FindControl("ddlinterventor") as DropDownList);
            var TerceroInterventor = from o in dc.Tercero
                                   where o.TipoTercero == 2
                                   select o;
            ddltercerointerventor.DataSource = TerceroInterventor;
            ddltercerointerventor.DataTextField = "Nombre";
            ddltercerointerventor.DataValueField = "IdTercero";
            llenarCombosEdicion(rowindex, ref ddltercerointerventor, "terceroInterventor");
            ddltercerointerventor.DataBind();


            DropDownList ddlterceroContratante = (gvMaster.Rows[rowindex].FindControl("ddlcontratante") as DropDownList);
            var TerceroContratante = from o in dc.Tercero
                                   where o.TipoTercero == 1
                                   select o;
            ddlterceroContratante.DataSource = TerceroContratante;
            ddlterceroContratante.DataTextField = "Nombre";
            ddlterceroContratante.DataValueField = "IdTercero";
            llenarCombosEdicion(rowindex, ref ddlterceroContratante, "terceroContratante");
            ddlterceroContratante.DataBind();


            DropDownList ddlSupervisor = (gvMaster.Rows[rowindex].FindControl("ddlsupervisor") as DropDownList);
            var TerceroSupervisor = from o in dc.Tercero
                                   where o.TipoTercero == 3
                                   select o;
            ddlSupervisor.DataSource = TerceroSupervisor;
            ddlSupervisor.DataTextField = "Nombre";
            ddlSupervisor.DataValueField = "IdTercero";
            llenarCombosEdicion(rowindex, ref ddlSupervisor, "tercerosupervisor");
            ddlSupervisor.DataBind();
            

            DropDownList ddlAsignacion = (gvMaster.Rows[rowindex].FindControl("ddlDescripcionAsignacion") as DropDownList);
            var asignacion = from o in dc.AsignacionObra
                                   select o;
            ddlAsignacion.DataSource = asignacion;
            ddlAsignacion.DataTextField = "DescripcionAsignacion";
            ddlAsignacion.DataValueField = "IdAsignacion";
            llenarCombosEdicion(rowindex, ref ddlAsignacion, "IdAsignacion");
            ddlAsignacion.DataBind();



            DropDownList ddlEstado = (gvMaster.Rows[rowindex].FindControl("ddlDescripcionEstado") as DropDownList);
            var estado = from o in dc.EstadoContrato
                             select o;
            ddlEstado.DataSource = estado;
            ddlEstado.DataTextField = "DescripcionEstado";
            ddlEstado.DataValueField = "IdEstado";
            llenarCombosEdicion(rowindex, ref ddlEstado, "IdEstado");
            ddlEstado.DataBind();




            DropDownList ddlProyecto = (gvMaster.Rows[rowindex].FindControl("ddlProyecto") as DropDownList);
            var proyecto = from o in dc.Proyecto
                             select o;
            ddlProyecto.DataSource = proyecto;
            ddlProyecto.DataTextField = "IdProyecto";
            ddlProyecto.DataValueField = "IdProyecto";
            llenarCombosEdicion(rowindex, ref ddlProyecto, "Proyecto");
            ddlProyecto.DataBind();





            DropDownList ddlPredio = (gvMaster.Rows[rowindex].FindControl("ddlPredioContrato") as DropDownList);
            var predio = from o in dc.Predio
                             select o;
            ddlPredio.DataSource = predio;
            ddlPredio.DataTextField = "chip";
            ddlPredio.DataValueField = "chip";
            llenarCombosEdicion(rowindex, ref ddlPredio, "PredioContrato");
            ddlPredio.DataBind();
            
            TextBox dateinicio = (gvMaster.Rows[rowindex].FindControl("txtPickerFechaInicio") as TextBox);
             var colsNoVisible = gvMaster.DataKeys[rowindex].Values;
             dateinicio.Text = colsNoVisible["FechaActaInicio"].ToString();
             

             TextBox dateReinicio = (gvMaster.Rows[rowindex].FindControl("txtPickerFechaReinicio") as TextBox);
             dateReinicio.Text = colsNoVisible["FechaReinicio"].ToString();
         

             TextBox dateTerminacion = (gvMaster.Rows[rowindex].FindControl("txtPickerFechaTerminacion") as TextBox);
             dateTerminacion.Text = colsNoVisible["FechaTerminacion"].ToString();
         

             TextBox txtCodigoContrato = (gvMaster.Rows[rowindex].FindControl("txtCodigoContrato") as TextBox);
             txtCodigoContrato.Text = colsNoVisible["CodigoContrato"].ToString();
             txtCodigoContrato.ReadOnly = true;
            

             TextBox txtNombreContrato = (gvMaster.Rows[rowindex].FindControl("txtNombreContrato") as TextBox);
             txtNombreContrato.Text = colsNoVisible["NombreContrato"].ToString();
         
            

            TextBox txtValorContrato = (gvMaster.Rows[rowindex].FindControl("txtValorContrato") as TextBox);
            txtValorContrato.Text = colsNoVisible["ValorContrato"].ToString();
         

            TextBox txtValorSubsidio = (gvMaster.Rows[rowindex].FindControl("txtValorSubsidio") as TextBox);
            txtValorSubsidio.Text = colsNoVisible["ValorSubsidio"].ToString();
         


            TextBox txtValorAportesBeneficiario = (gvMaster.Rows[rowindex].FindControl("txtValorAportesBeneficiario") as TextBox);
            txtValorAportesBeneficiario.Text = colsNoVisible["ValorAportesBeneficiario"].ToString();
          

            TextBox txtValorAportesOferente = (gvMaster.Rows[rowindex].FindControl("txtValorAportesOferente") as TextBox);
            txtValorAportesOferente.Text = colsNoVisible["ValorAportesOferente"].ToString();
          


            TextBox txtPlazoAdicional = (gvMaster.Rows[rowindex].FindControl("txtPlazoAdicional") as TextBox);
            txtPlazoAdicional.Text = colsNoVisible["PlazoAdicional"].ToString();
          

            TextBox txtPlazoInicial = (gvMaster.Rows[rowindex].FindControl("txtPlazoInicial") as TextBox);
            txtPlazoInicial.Text = colsNoVisible["PlazoInicial"].ToString();
          
  


            TextBox txtTiempoSuspencion = (gvMaster.Rows[rowindex].FindControl("txtTiempoSuspencion") as TextBox);
            txtTiempoSuspencion.Text = colsNoVisible["TiempoSuspencion"].ToString();
          

            TextBox txtPlazoTotal = (gvMaster.Rows[rowindex].FindControl("txtPlazoTotal") as TextBox);
            txtPlazoTotal.Text = colsNoVisible["PlazoTotal"].ToString(); 
          
            
            
                        
        }
        else if(e.CommandName=="CancelUpdate")
        {
            gvMaster.EditIndex = -1;
            BindData();
        }
        else if (e.CommandName == "UpdateRow") 
        {
            int rowindex = ((GridViewRow)((LinkButton)e.CommandSource).NamingContainer).RowIndex;
            var contratoUpdate = (from d in dc.Contrato where d.CodigoContrato == Convert.ToInt32(e.CommandArgument) select d).Single();

            contratoUpdate.FechaActaInicio = Convert.ToDateTime((gvMaster.Rows[rowindex].FindControl("txtPickerFechaInicio") as TextBox).Text); //Convert.ToDateTime(controlesTextoEdicion[0].Text);
            contratoUpdate.FechaReinicio = Convert.ToDateTime((gvMaster.Rows[rowindex].FindControl("txtPickerFechaReinicio") as TextBox).Text);
            contratoUpdate.FechaTerminacion = Convert.ToDateTime((gvMaster.Rows[rowindex].FindControl("txtPickerFechaTerminacion") as TextBox).Text); 
            contratoUpdate.NombreContrato = (gvMaster.Rows[rowindex].FindControl("txtNombreContrato") as TextBox).Text;
            contratoUpdate.ValorContrato = Convert.ToDecimal((gvMaster.Rows[rowindex].FindControl("txtValorContrato") as TextBox).Text);
            contratoUpdate.ValorSubsidio = Convert.ToDecimal((gvMaster.Rows[rowindex].FindControl("txtValorSubsidio") as TextBox).Text);
            contratoUpdate.ValorAportesBeneficiario = Convert.ToDecimal((gvMaster.Rows[rowindex].FindControl("txtValorAportesBeneficiario") as TextBox).Text);
            contratoUpdate.ValorAportesOferente = Convert.ToDecimal((gvMaster.Rows[rowindex].FindControl("txtValorAportesOferente") as TextBox).Text);
            contratoUpdate.PlazoAdicional = Convert.ToInt32((gvMaster.Rows[rowindex].FindControl("txtPlazoAdicional") as TextBox).Text);
            contratoUpdate.PlazoInicial = Convert.ToInt32((gvMaster.Rows[rowindex].FindControl("txtPlazoInicial") as TextBox).Text);
            contratoUpdate.TiempoSuspencion = Convert.ToInt32((gvMaster.Rows[rowindex].FindControl("txtTiempoSuspencion") as TextBox).Text);
            contratoUpdate.PlazoTotal = Convert.ToInt32((gvMaster.Rows[rowindex].FindControl("txtPlazoTotal") as TextBox).Text);
            contratoUpdate.TipoObra = Convert.ToInt32((gvMaster.Rows[rowindex].FindControl("ddlTipoObra") as DropDownList).SelectedValue);
            contratoUpdate.Oferente = Convert.ToInt32((gvMaster.Rows[rowindex].FindControl("ddlOferente") as DropDownList).SelectedValue);
            contratoUpdate.Interventor = Convert.ToInt32((gvMaster.Rows[rowindex].FindControl("ddlinterventor") as DropDownList).SelectedValue);
            contratoUpdate.Asignacion = Convert.ToInt32((gvMaster.Rows[rowindex].FindControl("ddlDescripcionAsignacion") as DropDownList).SelectedValue);
            contratoUpdate.Supervisor = Convert.ToInt32((gvMaster.Rows[rowindex].FindControl("ddlsupervisor") as DropDownList).SelectedValue);
            contratoUpdate.ContratanteContrato = Convert.ToInt32((gvMaster.Rows[rowindex].FindControl("ddlcontratante") as DropDownList).SelectedValue);
            contratoUpdate.PredioContrato = (gvMaster.Rows[rowindex].FindControl("ddlPredioContrato") as DropDownList).SelectedValue;
            contratoUpdate.Proyecto = (gvMaster.Rows[rowindex].FindControl("ddlProyecto") as DropDownList).SelectedValue;
            contratoUpdate.Estado = Convert.ToInt32((gvMaster.Rows[rowindex].FindControl("ddlDescripcionEstado") as DropDownList).SelectedValue);
             
            dc.SubmitChanges();
            gvMaster.EditIndex = -1;
            BindData();

        }
    }
    private void llenarCombosEdicion(int rowindex, ref DropDownList combo,string columna) 
    {
        var colsNoVisible = gvMaster.DataKeys[rowindex].Values;
        string valor = colsNoVisible[columna].ToString();
        combo.SelectedValue = valor;
    }
}