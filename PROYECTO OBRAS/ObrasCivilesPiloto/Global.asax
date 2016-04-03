<%@ Application Language="C#" %>
<%@ Import Namespace="System.Web.Routing" %>
<%@ Import Namespace="System.Web.DynamicData" %>

<script RunAt="server">
    public static void RegisterRoutes(RouteCollection routes) {
        MetaModel model = new MetaModel();
        
        //                    IMPORTANTE: REGISTRO DEL MODELO DE DATOS 
        // Quite la marca de comentario de esta línea para registrar clases de LINQ to SQL
        // para datos dinámicos de ASP.NET. Establezca ScaffoldAllTables = true solo si está seguro 
        // de que desea que todas las tablas del modelo de datos admitan una vista con scaffold (es decir, plantillas) 
        // Para controlar la técnica scaffolding para tablas individuales, cree una clase parcial para 
        // la tabla y aplique el atributo [Scaffold(true)] a dicha clase.
        // Nota: asegúrese de que cambia "YourDataContextType" al nombre de la clase del contexto de datos
        // en la aplicación.
        model.RegisterContext(typeof(DataClassesModelDataContext), new ContextConfiguration() { ScaffoldAllTables = true });

        // La siguiente declaración admite el modo de páginas independientes, donde las tareas List, Detail, Insert y 
        // Update se realizan usando páginas independientes. Para habilitar este modo, quite las marcas de comentario de la siguiente 
        // definición del objeto route y marque como comentario las definiciones de route en la sección del modo de páginas combinadas siguiente.
        routes.Add(new DynamicDataRoute("{table}/{action}.aspx") {
            Constraints = new RouteValueDictionary(new { action = "List|Details|Edit|Insert" }),
            Model = model
        });

        // Las siguientes declaraciones admiten el modo de páginas combinadas, donde las tareas List, Detail, Insert y
        // Update se realizan usando la misma página. Para habilitar este modo, quite las marcas de comentario de las siguientes
        // routes y marque como comentario la definición del objeto route en la sección del modo de páginas independientes anterior.
        //routes.Add(new DynamicDataRoute("{table}/ListDetails.aspx") {
        //    Action = PageAction.List,
        //    ViewName = "ListDetails",
        //    Model = model
        //});

        //routes.Add(new DynamicDataRoute("{table}/ListDetails.aspx") {
        //    Action = PageAction.Details,
        //    ViewName = "ListDetails",
        //    Model = model
        //});
    }

    void Application_Start(object sender, EventArgs e) {
        RegisterRoutes(RouteTable.Routes);
    }

</script>
