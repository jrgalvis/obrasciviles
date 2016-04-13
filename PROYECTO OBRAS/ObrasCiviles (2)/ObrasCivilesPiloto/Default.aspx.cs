﻿using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;
using System.Web.DynamicData;

public partial class _Default : System.Web.UI.Page {
    protected void Page_Load(object sender, EventArgs e) {
        if (Session["Usuario"] == null)
            Response.Redirect("Login.aspx");
        System.Collections.IList visibleTables = MetaModel.Default.VisibleTables;
        if (visibleTables.Count == 0) {
            throw new InvalidOperationException("No hay tablas accesibles. Asegúrese de que hay al menos un modelo de datos registrado en Global.asax y de que está habilitada la técnica scaffolding, o bien implemente páginas personalizadas.");
        }
        Menu1.DataSource = visibleTables;
        Menu1.DataBind();
        
        DataClassesModelDataContext dc = new DataClassesModelDataContext();
        
        var contracts = from c in dc.Contrato
                            select c;
        
        gv_contratoMaster.DataSource = contracts;
        gv_contratoMaster.DataBind();
        
    }

}
