using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Security.Cryptography;
using System.Text;
using System.Net;
using System.IO;

public partial class Pages_ShowApplyStudList : System.Web.UI.Page
{
    public string action1 = string.Empty;
    public string hash1 = string.Empty;
    public string txnid1 = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        key.Value = ConfigurationManager.AppSettings["MERCHANT_KEY"];
        if (Page.IsPostBack)
            return;

        // surl - for success tranction, furl - for failure transaction, curl - for cancel transaction.
        surl.Text = HttpContext.Current.Request.Url.GetLeftPart(UriPartial.Authority) + HttpRuntime.AppDomainAppVirtualPath + "Pages/ResponseHandling.aspx";
        furl.Text = surl.Text.ToString();
        curl.Text = furl.Text.ToString();
        firstname.Text = lblStudName.Text.ToString();
        email.Text = lblEmailId1.Text.ToString();
        phone.Text = lblPhNo2.Text.ToString();
        // Contains information of integration type. Consult to PayU for more details.
        //  udf5.Text = "PayUBiz_ASP.NET_Kit";
        //Not mandatory but fixed code can be passed to Payment Gateway to show default payment 
        //option tab. e.g. NB, CC, DC, CASH, EMI. Refer PDF for more details.
        //pg.Text = "CC";
        if (Request.QueryString["FormNo"]!=null)
        ShowData();
    }
    public void ShowData()
    {
        DataTable dt = new Classdal().GetDataTableQry("select *,SR.Religion as Religion1,cm.CatName,c.ClassName  from PS_StudMaster_ApplyForAdmn SMA left join ps_studentreligion SR on SMA.religion=SR.ReligionId left join PS_CategoryMaster CM on SMA.Cat=cm.CatID left join PS_ClassMaster C on c.ClassID=sma.Class where sma.FormNo='" + Request.QueryString["FormNo"] + "'");
        //DataTable dt = new Classdal().GetDataTableQry("select *,SR.Religion,cm.CatName from PS_StudMaster_ApplyForAdmn SMA join ps_studentreligion SR on SMA.religion=SR.ReligionId join PS_CategoryMaster CM on SMA.Cat=cm.CatID where FormNo='S22/3'");
        ViewState["StudImg"] = dt.Rows[0]["StudentPhoto"].ToString();
        imgStud.Src = "~/Temporary_Files/Temp_Images/" + dt.Rows[0]["StudentPhoto"].ToString();
        firstname.Text = dt.Rows[0]["FullName"].ToString();
        if (Convert.ToDateTime(dt.Rows[0]["DOB"]).ToString("dd/MM/yyyy") != "")
        {
            //ClientScript.RegisterStartupScript(this.GetType(), "updateProgress", "updateProgress('" + updateProgress + "');", true);
            lblStudDOB.Text = Convert.ToDateTime(dt.Rows[0]["DOB"]).ToString("dd/MM/yyyy");
            ScriptManager.RegisterClientScriptBlock(this, typeof(string), "uniqueKey", "getAge('" + Convert.ToDateTime(dt.Rows[0]["DOB"]).ToString("dd/MM/yyyy") + "')", true);
        }
            lblBirthPlace.Text = dt.Rows[0]["PlaceOfBirth"].ToString();
        lblGender.Text = dt.Rows[0]["sex"].ToString();
        lblAdmnReqFor.Text = dt.Rows[0]["ClassName"].ToString();
       //blExamType.Text = dt.Rows[0]["DOB"].ToString();
        lblStudLastSch.Text = dt.Rows[0]["PrevSchoolname"].ToString();
        lbllastSchool.Text = dt.Rows[0]["PrevClass"].ToString();
        lblStudTC.Text = dt.Rows[0]["TCNo"].ToString();
        lblbloodGp.Text = dt.Rows[0]["BloodGroup"].ToString();
        lblreligion.Text = dt.Rows[0]["religion1"].ToString();
        lbldenomination.Text = dt.Rows[0]["Denomination"].ToString();
        lblMotToung.Text = dt.Rows[0]["MotherTongue"].ToString();
        lblNationality.Text = dt.Rows[0]["Nationality"].ToString();
        lblCatagory.Text = dt.Rows[0]["Cat"].ToString();
        lblStudTribName.Text = dt.Rows[0]["TribeName"].ToString();
        lblStudAdhar.Text = dt.Rows[0]["StudAdhar"].ToString();
        lblStudBankAc.Text = dt.Rows[0]["BankAcNo"].ToString();
        lblStudBankName.Text = dt.Rows[0]["BankName"].ToString();
        lblIFSC.Text = dt.Rows[0]["IFSCCode"].ToString();
        lblFatName.Text = dt.Rows[0]["FatherName"].ToString();
        lblFatSchAtten.Text = dt.Rows[0]["FatherSchool"].ToString();
        lblFatSchFrom.Text = dt.Rows[0]["FatherSchlPlace"].ToString();
        lblFatClgAtten.Text = dt.Rows[0]["FatherCollege"].ToString();
        lblFatClgAtten.Text = dt.Rows[0]["FatherClgPlace"].ToString();
        lblFatAdharNo.Text = dt.Rows[0]["FatherAdhar"].ToString();
        lblFatOccupation.Text = dt.Rows[0]["FatherOccupation"].ToString();
        lblFatQualification.Text = dt.Rows[0]["FatherEQ"].ToString();
        lblFatCom.Text = dt.Rows[0]["FatherComp"].ToString();
        lblFatDesig.Text = dt.Rows[0]["FatherDesig"].ToString();
        lblMotNane.Text = dt.Rows[0]["MotherName"].ToString();
        lblMotLastSch.Text = dt.Rows[0]["MotherSchool"].ToString();
        lblMotLastSchFrom.Text = dt.Rows[0]["MotherSchlPlace"].ToString();
        lblMotClg.Text = dt.Rows[0]["MotherCollege"].ToString();
        lblMotLastClgForm.Text = dt.Rows[0]["MotherClgPlace"].ToString();
        lblMotAdharNo.Text = dt.Rows[0]["MotherAdhar"].ToString();
        lblMotOccupation.Text = dt.Rows[0]["MotherOccupation"].ToString();
        lblMotQua.Text = dt.Rows[0]["MotherEQ"].ToString();
        lblMotDept.Text = dt.Rows[0]["MotherDept"].ToString();
        lblMotDeg.Text = dt.Rows[0]["MotherDesig"].ToString();
        lblMotCompName.Text = dt.Rows[0]["MotherComp"].ToString();
        lblPreLane1.Text = dt.Rows[0]["PresAddr1"].ToString();
        lblPreLane2.Text = dt.Rows[0]["PresAddr2"].ToString();
        lblPreCity.Text = dt.Rows[0]["PresAddrCity"].ToString();
        lblPrePin.Text = dt.Rows[0]["PresAddrPin"].ToString();
        lblPreState.Text = dt.Rows[0]["PresAddrState"].ToString();
        lblPreCountry.Text = dt.Rows[0]["PresAddrCntry"].ToString(); 
        lblPerLane1.Text = dt.Rows[0]["PermAddr1"].ToString();
        lblPerLane2.Text = dt.Rows[0]["PermAddr2"].ToString();
        lblPerCity.Text = dt.Rows[0]["PermAddrCity"].ToString();
        lblPerPin.Text = dt.Rows[0]["PermAddrPin"].ToString();
        lblPerState.Text = dt.Rows[0]["PermAddrState"].ToString();
        lblPerCountry.Text = dt.Rows[0]["PermAddrCntry"].ToString();
        lblPhNo1.Text = dt.Rows[0]["TelNoResidence"].ToString();
        lblPhNo2.Text = dt.Rows[0]["TeleNoOffice"].ToString();
        phone.Text = dt.Rows[0]["MobileNo1"].ToString();
        LblMob2.Text = dt.Rows[0]["MobileNo2"].ToString();
        email.Text = dt.Rows[0]["EmailId1"].ToString();
        lblEmailId2.Text = dt.Rows[0]["EmailId2"].ToString();
        lblExamType.Text = dt.Rows[0]["BoardType"].ToString();
    }


    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Pages/StudAdmission.aspx?formNo="+Request.QueryString["FormNo"]);
    }
    public string Generatehash512(string text)
    {

        byte[] message = Encoding.UTF8.GetBytes(text);

        UnicodeEncoding UE = new UnicodeEncoding();
        byte[] hashValue;
        SHA512Managed hashString = new SHA512Managed();
        string hex = "";
        hashValue = hashString.ComputeHash(message);
        foreach (byte x in hashValue)
        {
            hex += String.Format("{0:x2}", x);
        }
        return hex;

    }
    private string PreparePOSTForm(string url, System.Collections.Hashtable data)      // post form
    {
        //Set a name for the form
        string formID = "PostForm";
        //Build the form using the specified data to be posted.
        StringBuilder strForm = new StringBuilder();
        strForm.Append("<form id=\"" + formID + "\" name=\"" +
                       formID + "\" action=\"" + url +
                       "\" method=\"POST\">");

        foreach (System.Collections.DictionaryEntry key in data)
        {

            strForm.Append("<input type=\"hidden\" name=\"" + key.Key +
                           "\" value=\"" + key.Value + "\">");
        }


        strForm.Append("</form>");
        //Build the JavaScript which will do the Posting operation.
        StringBuilder strScript = new StringBuilder();
        strScript.Append("<script language='javascript'>");
        strScript.Append("var v" + formID + " = document." +
                         formID + ";");
        strScript.Append("v" + formID + ".submit();");
        strScript.Append("</script>");
        //Return the form and the script concatenated.
        //(The order is important, Form then JavaScript)
        return strForm.ToString() + strScript.ToString();
    }
    protected void btnPayment_Click(object sender, EventArgs e)
    {
        try
        {

            string[] hashVarsSeq;
            string hash_string = string.Empty;


            if (string.IsNullOrEmpty(Request.Form["txnid"])) // generating random txnid
            {
                Random rnd = new Random();
                string strHash = Generatehash512(rnd.ToString() + DateTime.Now);
                txnid1 = strHash.ToString().Substring(0, 20);

            }
            else
            {
                txnid1 = Request.Form["txnid"];
            }
            if (string.IsNullOrEmpty(Request.Form["hash"])) // generating hash value
            {
                if (
                    string.IsNullOrEmpty(ConfigurationManager.AppSettings["MERCHANT_KEY"])||
                    string.IsNullOrEmpty(txnid1) ||
                    string.IsNullOrEmpty(Request.Form["amount"]) ||
                    string.IsNullOrEmpty(Request.Form["firstname"]) ||
                    string.IsNullOrEmpty(Request.Form["email"]) ||
                    string.IsNullOrEmpty(Request.Form["phone"]) ||
                    string.IsNullOrEmpty(Request.Form["productinfo"]) ||
                    string.IsNullOrEmpty(Request.Form["surl"]) ||
                    string.IsNullOrEmpty(Request.Form["furl"])
                    )
                {
                    //error
                  string amount =  Request.Form["amount"];
                    string firstname = Request.Form["firstname"];
                    string email = Request.Form["email"];
                    string phone = Request.Form["phone"];
                    string surl = Request.Form["surl"];
                    string furl = Request.Form["furl"];
                    //frmError.Visible = true;
                    return;
                }

                else
                {
                   // frmError.Visible = false;
                    hashVarsSeq = ConfigurationManager.AppSettings["hashSequence"].Split('|'); // spliting hash sequence from config
                    hash_string = "";
                    foreach (string hash_var in hashVarsSeq)
                    {
                        if (hash_var == "key")
                        {
                            hash_string = hash_string + ConfigurationManager.AppSettings["MERCHANT_KEY"];
                            hash_string = hash_string + '|';
                        }
                        else if (hash_var == "txnid")
                        {
                            hash_string = hash_string + txnid1;
                            hash_string = hash_string + '|';
                        }
                        else if (hash_var == "amount")
                        {
                            hash_string = hash_string + Convert.ToDecimal(Request.Form[hash_var]).ToString("g29");
                            hash_string = hash_string + '|';
                        }
                        else
                        {

                            hash_string = hash_string + (Request.Form[hash_var] != null ? Request.Form[hash_var].Trim() : "");// isset if else
                            hash_string = hash_string + '|';
                        }
                    }

                      hash_string += ConfigurationManager.AppSettings["SALT"];// appending SALT
                   // hash_string += "7rnFly|c975c0ed016eddbe1f5b|400|fghgfh|adfsdf|dfgdfg|fghgfh|fghgfh|fghfg|fgh|PayUBiz_ASP.NET_Kit||||||pjVQAWpA";
                   hash1 = Generatehash512(hash_string).ToLower();         //generating hash
                  
                    action1 = ConfigurationManager.AppSettings["PAYU_BASE_URL"] + "/_payment";// setting URL

                }


            }

            else if (!string.IsNullOrEmpty(Request.Form["hash"]))
            {
                hash1 = Request.Form["hash"];
                action1 = ConfigurationManager.AppSettings["PAYU_BASE_URL"] + "/_payment";

            }

            if (!string.IsNullOrEmpty(hash1))
            {
                hash.Value = hash1;
                txnid.Value = txnid1;

                System.Collections.Hashtable data = new System.Collections.Hashtable(); // adding values in gash table for data post
                data.Add("hash", hash.Value);
                data.Add("txnid", txnid.Value);
                data.Add("key", key.Value);
                string AmountForm = Convert.ToDecimal(amount.Text.Trim()).ToString("g29");// eliminating trailing zeros
                amount.Text = AmountForm;
                data.Add("amount", AmountForm);
                data.Add("firstname", firstname.Text.Trim());
                data.Add("email", email.Text.Trim());
                data.Add("phone", phone.Text.Trim());
                data.Add("productinfo", productinfo.Text.Trim());
                data.Add("surl", surl.Text.Trim());
                data.Add("furl", furl.Text.Trim());
                data.Add("lastname", "");
                data.Add("curl", curl.Text.Trim());
                data.Add("address1","");
                data.Add("address2", "");
                data.Add("city","");
                data.Add("state","");
                data.Add("country","");
                data.Add("zipcode","");
                data.Add("udf1", udf1.Text.Trim());
                data.Add("udf2", udf2.Text.Trim());
                data.Add("udf3", udf3.Text.Trim());
                data.Add("udf4", udf4.Text.Trim());
                data.Add("udf5", udf5.Text.Trim());
                data.Add("pg", pg.Text.Trim());


                string strForm = PreparePOSTForm(action1, data);
                Page.Controls.Add(new LiteralControl(strForm));

            }

            else
            {
                //no hash

            }

        }

        catch (Exception ex)
        {
            Response.Write("<span style='color:red'>" + ex.Message + "</span>");

        }
    }

    protected void btnPreview_Click(object sender, EventArgs e)
    {

    }

    protected void drpcat_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void chkboxAdd_CheckedChanged(object sender, EventArgs e)
    {

    }

    protected void chkCheck_CheckedChanged(object sender, EventArgs e)
    {

    }
}