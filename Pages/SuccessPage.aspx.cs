using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_SuccessPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["mihpayid"] != "")
        { 
       
                lblPayment.Text = Request.QueryString["mihpayid"].ToString();
                lblName.Text = Request.QueryString["firstname"].ToString();

        }
    }
}
