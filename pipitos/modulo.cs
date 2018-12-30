using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace pipitos
{
    public static class modulo
    {
        //Forma de mostrar un msj desde el codebehind
        public static void ShowToastr(this Page page, string message, string title, string type = "info")
        {
            page.ClientScript.RegisterStartupScript(page.GetType(), "toastr_message",
                  String.Format("toastr.{0}('{1}', '{2}');", type.ToLower(), message, title), addScriptTags: true);
        }

        public class mensaje
        {
            public string texto { get; set; }
            public string tipo { get; set; }
        }
    }
}