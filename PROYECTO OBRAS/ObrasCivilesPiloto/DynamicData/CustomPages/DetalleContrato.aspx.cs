using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

public partial class DynamicData_CustomPages_DetalleContrato : System.Web.UI.Page
{
    private static string codcontrato;
    public static bool inserto;

    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["Usuario"] == null)
            Response.Redirect("Login.aspx");

        codcontrato = Request.QueryString["CodigoContrato"].ToString();

        if (inserto)
        {
            //gvActContrato.DataSource = ContratoActividadDS;
            gvActContrato.DataBind();

            //gvCostosIndContrato.DataSource = CostosIndirectosDS;
            gvCostosIndContrato.DataBind();

            //gvPagosContrato.DataSource = PagosContratoDS;
            gvPagosContrato.DataBind();

            gvSanciones.DataBind();

            gvSuspenciones.DataBind();

            gvGarantias.DataBind();

            gvModificaciones.DataBind();

            gvAcciones.DataBind();

            inserto = false;
        }

        if (gvActContrato.Rows.Count > 0)
        {

            decimal totalvalorpresupuestado = 0;

            decimal totalvalorreal = 0;
            int fila;

            for (fila = 0; fila <= gvActContrato.Rows.Count - 1; fila++)
            {

                totalvalorpresupuestado = totalvalorpresupuestado + Convert.ToDecimal(gvActContrato.Rows[fila].Cells[4].Text);
                totalvalorreal = totalvalorreal + Convert.ToDecimal(gvActContrato.Rows[fila].Cells[6].Text);
            }

            gvActContrato.FooterRow.Cells[2].Text = "TOTAL";
            gvActContrato.FooterRow.Cells[4].Text = totalvalorpresupuestado.ToString();
            gvActContrato.FooterRow.Cells[6].Text = totalvalorreal.ToString();
        }

        
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
        
        ContratoActividad ca = new ContratoActividad
        {

            Contrato = Convert.ToInt32(codcontrato),
            Actividad = Convert.ToInt32(actividad),
            CantidadPresupuestada = Convert.ToDouble(cantidadpresupuestada),
            ValorPresupuestado = Convert.ToDecimal(valorpresupuestado),
            CantidadReal = Convert.ToDouble(cantidadreal),
            ValorReal = Convert.ToDecimal(valorreal)
        };

        dc.ContratoActividad.InsertOnSubmit(ca);
        dc.SubmitChanges();

        inserto = true;
    }

    [WebMethod]
    public static void CrearNuevoCostoIndirecto(string codigocontrato,
        string codcostocontrato,
        string porcentajecosto,
        string valorpresupuestado,
        string valorreal)
    {
        DataClassesModelDataContext dc = new DataClassesModelDataContext();

        CostosIndirectosContrato cic = new CostosIndirectosContrato
        {
            CodigoContrato = Convert.ToInt32(codcontrato),
            IdTipoCostoIndirecto = Convert.ToInt32(codcostocontrato),
            Porcentaje = Convert.ToDouble(porcentajecosto),
            ValorPresupuestado = Convert.ToDecimal(valorpresupuestado),
            ValorReal = Convert.ToDecimal(valorreal)
        };

        dc.CostosIndirectosContrato.InsertOnSubmit(cic);
        dc.SubmitChanges();

        inserto = true;
    }

    [WebMethod]
    public static void CrearNuevoPago(string codigocontratopago,
        string descpago,
        string porcentajepago,
        string fecpago,
        string valorpago)
    {
        DataClassesModelDataContext dc = new DataClassesModelDataContext();

        PagosContrato pc = new PagosContrato
        {
            Contrato = Convert.ToInt32(codcontrato),
            DescripcionPago = descpago,
            PorcentajePago = Convert.ToDouble(porcentajepago),
            FechaPago = Convert.ToDateTime(fecpago),
            ValorPago = Convert.ToDecimal(valorpago)
                        
        };

        dc.PagosContrato.InsertOnSubmit(pc);
        dc.SubmitChanges();
        inserto = true;

    }

    [WebMethod]
    public static void CrearNuevaSancion(string idcontrato,
        string num_resolucion,
        string objeto_sancion,
        string fecha_sancion
       )
    {
        DataClassesModelDataContext dc = new DataClassesModelDataContext();

        SancionesContrato sc = new SancionesContrato
        {
            Contrato = Convert.ToInt32(codcontrato),
            NumResolucion = Convert.ToInt32(num_resolucion),
            Objeto = objeto_sancion,
            Fecha = Convert.ToDateTime(fecha_sancion)

        };

        dc.SancionesContrato.InsertOnSubmit(sc);
        dc.SubmitChanges();
        inserto = true;

    }

    [WebMethod]
    public static void CrearNuevaSuspencion(string idcontrato,
        string num_acta,
        string tipo_acta,
        string fecha_acta_susp,
        string fecha_inicio_susp,
        string fecha_fin_susp,
        string duracion_sancion,
        string fecha_reanu_susp
       )
    {
        DataClassesModelDataContext dc = new DataClassesModelDataContext();

        SuspencionContrato suspc = new SuspencionContrato
        {
            Contrato = Convert.ToInt32(codcontrato),
            NumActa = Convert.ToInt32(num_acta),
            TipoActa = tipo_acta,
            FechaActaSuspencion = Convert.ToDateTime(fecha_acta_susp),
            FechaInicioSuspencion = Convert.ToDateTime(fecha_inicio_susp),
            FechaFinSuspencion = Convert.ToDateTime(fecha_fin_susp),
            Duracion = Convert.ToInt32(duracion_sancion),
            FechaReanudacion = Convert.ToDateTime(fecha_reanu_susp)

        };

        dc.SuspencionContrato.InsertOnSubmit(suspc);
        dc.SubmitChanges();
        inserto = true;
    }

    [WebMethod]
    public static void CrearNuevaGarantiaContrato(string id_contrato,
        string tipo_garantia,
        string nombre_asegurador,
        string num_poliza,
        string fecha_ini_vigencia,
        string fecha_fin_vigencia,
        string num_cert_modificatorio)
    {
        DataClassesModelDataContext dc = new DataClassesModelDataContext();

        GarantiaContrato gc = new GarantiaContrato
        {
            Contrato = Convert.ToInt32(codcontrato),
            TipoGarantia = Convert.ToInt32(tipo_garantia),
            NombreAsegurador = nombre_asegurador,
            NumPoliza = num_poliza,
            FechaInicioVigencia = Convert.ToDateTime(fecha_ini_vigencia),
            FechaFinVigencia = Convert.ToDateTime(fecha_fin_vigencia),
            NumCertModificatorio = num_cert_modificatorio
        };

        dc.GarantiaContrato.InsertOnSubmit(gc);
        dc.SubmitChanges();
        inserto = true;
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
            Contrato = Convert.ToInt32(codcontrato),
            TipoModificacion = Convert.ToInt32(tipo_modificacion),
            FechaModificacion = Convert.ToDateTime(fecha_modificacion),
            PlazoModificacion = Convert.ToInt32(plazo_modificacion),
            ValorModificacion = Convert.ToDecimal(valor_modificacion)
        };

        dc.ModificacionesContrato.InsertOnSubmit(mc);
        dc.SubmitChanges();
        inserto = true;
    }

    [WebMethod]
    public static void CrearNuevaAccionLegal(string idcontrato,
        string clase_accion,
        string etapa_procesal,
        string fecha_accion,
        string despacho_accion,
        string num_expediente
       )
    {
        DataClassesModelDataContext dc = new DataClassesModelDataContext();

        AccionesLegalesContrato alc = new AccionesLegalesContrato
        {
            Contrato = Convert.ToInt32(codcontrato),
            Clase = clase_accion,
            EtapaProcesal = etapa_procesal,
            Fecha = Convert.ToDateTime(fecha_accion),
            Despacho = despacho_accion,
            NumExpediente = num_expediente

        };

        dc.AccionesLegalesContrato.InsertOnSubmit(alc);
        dc.SubmitChanges();
        inserto = true;
    }

    protected void ContratoActividadDS_Selecting(object sender, LinqDataSourceSelectEventArgs e)
    {
        DataClassesModelDataContext dc = new DataClassesModelDataContext();
        string contratoact = Request.QueryString["CodigoContrato"].ToString();

        var actividadescontrato = from a in dc.ContratoActividad
                                  where a.Contrato == Convert.ToInt32(contratoact)
                                  select a;

        e.Result = actividadescontrato;
    }

    protected void CostosIndirectosDS_Selecting(object sender, LinqDataSourceSelectEventArgs e)
    {
        DataClassesModelDataContext dc = new DataClassesModelDataContext();
        string contratocosto = Request.QueryString["CodigoContrato"].ToString();

        var costoscontrato = from c in dc.CostosIndirectosContrato
                             where c.CodigoContrato == Convert.ToInt32(contratocosto)
                                  select c;

        e.Result = costoscontrato;

    }

    protected void PagosContratoDS_Selecting(object sender, LinqDataSourceSelectEventArgs e)
    {
        DataClassesModelDataContext dc = new DataClassesModelDataContext();
        string contratopagos = Request.QueryString["CodigoContrato"].ToString();

        var pagoscontrato = from p in dc.PagosContrato
                                  where p.Contrato == Convert.ToInt32(contratopagos)
                                  select p;

        e.Result = pagoscontrato;
    }

    protected void SancionesContratoDS_Selecting(object sender, LinqDataSourceSelectEventArgs e)
    {
        DataClassesModelDataContext dc = new DataClassesModelDataContext();
        string contratosanciones = Request.QueryString["CodigoContrato"].ToString();

        var sancionescontrato = from s in dc.SancionesContrato
                                where s.Contrato == Convert.ToInt32(contratosanciones)
                            select s;

        e.Result = sancionescontrato;
    }

    protected void SuspencionesContratoDS_Selecting(object sender, LinqDataSourceSelectEventArgs e)
    {
        DataClassesModelDataContext dc = new DataClassesModelDataContext();
        string contratosuspenciones = Request.QueryString["CodigoContrato"].ToString();

        var suspencionescontrato = from su in dc.SuspencionContrato
                                where su.Contrato == Convert.ToInt32(contratosuspenciones)
                                select su;

        e.Result = suspencionescontrato;
    }

    protected void GarantiaContratoDS_Selecting(object sender, LinqDataSourceSelectEventArgs e)
    {
        DataClassesModelDataContext dc = new DataClassesModelDataContext();
        string contratogarantias = Request.QueryString["CodigoContrato"].ToString();

        var garantiascontrato = from g in dc.GarantiaContrato
                                where g.Contrato == Convert.ToInt32(contratogarantias)
                                   select g;

        e.Result = garantiascontrato;
    }

    protected void ModificacionContratoDS_Selecting(object sender, LinqDataSourceSelectEventArgs e)
    {
        DataClassesModelDataContext dc = new DataClassesModelDataContext();
        string contratomodificaciones = Request.QueryString["CodigoContrato"].ToString();

        var modificacionescontrato = from m in dc.ModificacionesContrato
                                     where m.Contrato == Convert.ToInt32(contratomodificaciones)
                                select m;

        e.Result = modificacionescontrato;
    }

    protected void AccionesLegalesDS_Selecting(object sender, LinqDataSourceSelectEventArgs e)
    {
        DataClassesModelDataContext dc = new DataClassesModelDataContext();
        string contratoacciones = Request.QueryString["CodigoContrato"].ToString();

        var accionescontrato = from a in dc.AccionesLegalesContrato
                                     where a.Contrato == Convert.ToInt32(contratoacciones)
                                     select a;

        e.Result = accionescontrato;
    }
}