using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Drawing;
using System.IO;
using System.Web.Profile;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Linq;

public partial class Pages_StudAdmission : System.Web.UI.Page
{
    
    Hashtable hashtable = new Hashtable();
    Classdal OBJ = new Classdal();
    public static string id = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack)
            return;
        ViewState["StudNImg"] = "";
        Fillcategory();
        FillReligion();
        if (Request.QueryString["FormNo"] != null)
            fillData();
    }
    private void Fillcategory()
    {
        drpcat.DataSource = new Classdal().GetDataTableQry("select * from PS_CategoryMaster order by CatName");
        drpcat.DataTextField = "CatName";
        drpcat.DataValueField = "CatID";
        drpcat.DataBind();
        drpcat.Items.Insert(0, (new ListItem("-select-", "0")));
    }

    private void FillReligion()
    {
        drpRegion.DataSource = new Classdal().GetDataTableQry("select * from ps_studentreligion order by ReligionId");
        drpRegion.DataTextField = "Religion";
        drpRegion.DataValueField = "ReligionId";
        drpRegion.DataBind();
        drpRegion.Items.Insert(0, (new ListItem("-select-", "0")));
    }
    private void FillClass()
    {
        drpcat.DataSource = new Classdal().GetDataTableQry("select ClassName from PS_ClassMaster where ClassID in('14','15' )");
        drpcat.DataTextField = "ClassName";
        drpcat.DataValueField = "ClassID";
        drpcat.DataBind();
    }
    protected void submit_Click(object sender, EventArgs e)
    {
        if (Allcheck.Checked == false)
        {
            //ScriptManager.RegisterClientScriptBlock((Page)this, GetType(), "ShowMessage", "alert(' Pass Msg here !');", true);
            Allcheck.Focus();
            return;
        }
        ViewState["FormNo"] = null;
        ViewState["classid"] = null;
        ViewState["SessYr"] = null;
        ViewState["StudImg"] = string.Empty;
        SaveRecord();
    }
    protected void SaveRecord()
    {
        if (Request.QueryString["sid"] != null)
        {
            try
            {
                InsertStudDetails();
                ScriptManager.RegisterClientScriptBlock((Page)this, GetType(), "ShowMessage", "alert('Record Updated Successfully !');", true);
            }
            catch (Exception ex)
            {
            }
        }
        else
        {
            try
            {
                InsertStudDetails();
                string confmsg = "Student record inserted successfully with Form No: " + ViewState["FormNo"].ToString();
                ScriptManager.RegisterClientScriptBlock((Page)this, GetType(), "ShowMessage", "alert('" + confmsg + "');", true);
                ViewState["StudNImg"] = "";
                ViewState["tempImg"] = "";
                Response.Redirect("~/Pages/ShowApplyStudList.aspx?formNo=" + ViewState["FormNo"]);
            }
            catch (Exception ex)
            {
            }
        }
    }
    private void fillData()
    {
        DataTable dt = new Classdal().GetDataTableQry("select *,SR.Religion,cm.CatName from PS_StudMaster_ApplyForAdmn SMA left join ps_studentreligion SR on SMA.religion=SR.ReligionId left join PS_CategoryMaster CM on SMA.Cat=cm.CatID where FormNo='" + Request.QueryString["FormNo"] + "'");
        txtname.Text = dt.Rows[0]["FullName"].ToString();
        txtDate.Text = Convert.ToDateTime(dt.Rows[0]["DOB"]).ToString("dd/MM/yyyy");
        txtBirthPlace.Text = dt.Rows[0]["PlaceOfBirth"].ToString();
        drpGender.Text = dt.Rows[0]["sex"].ToString();
        drpClass.Text = dt.Rows[0]["Class"].ToString();
        //blExamType.Text = dt.Rows[0]["DOB"].ToString();
        txtlastSchAtt.Text = dt.Rows[0]["PrevSchoolname"].ToString();
        Drplstclass.Text = dt.Rows[0]["PrevClass"].ToString();
        txtTc.Text = dt.Rows[0]["TCNo"].ToString();
        imgStud.Src= "~/Temporary_Files/Temp_Images/" + dt.Rows[0]["StudentPhoto"].ToString();
        drpRegion.Text = dt.Rows[0]["religion"].ToString();
        rdobtnCourse.Text= dt.Rows[0]["Stream"].ToString();
        drpMotToung.Text = dt.Rows[0]["MotherTongue"].ToString();
        drpnationlity.Text = dt.Rows[0]["Nationality"].ToString();
        drpcat.Text = dt.Rows[0]["Cat"].ToString();
        txtTribe.Text = dt.Rows[0]["TribeName"].ToString();
        txtStudAdhar.Text = dt.Rows[0]["StudAdhar"].ToString();
        txtAcNo.Text = dt.Rows[0]["BankAcNo"].ToString();
        txtbank.Text = dt.Rows[0]["BankName"].ToString();
        txtIFSC.Text = dt.Rows[0]["IFSCCode"].ToString();
        txtFatName.Text = dt.Rows[0]["FatherName"].ToString();
        txtFatSchoolAttn.Text = dt.Rows[0]["FatherSchool"].ToString();
        txtFatSchWhe.Text = dt.Rows[0]["FatherSchlPlace"].ToString();
        txtFatCollAtten.Text = dt.Rows[0]["FatherCollege"].ToString();
        txtFatCollwhre.Text = dt.Rows[0]["FatherClgPlace"].ToString();
        txtFatAdhr.Text = dt.Rows[0]["FatherAdhar"].ToString();
        txtFatOcpton.Text = dt.Rows[0]["FatherOccupation"].ToString();
        txtFatEdon.Text = dt.Rows[0]["FatherEQ"].ToString();
        txtFatcompanynm.Text = dt.Rows[0]["FatherComp"].ToString();
        txtFatdesign.Text = dt.Rows[0]["FatherDesig"].ToString();
        txtMotherNm.Text = dt.Rows[0]["MotherName"].ToString();
        txtMotsclattnd.Text = dt.Rows[0]["MotherSchool"].ToString();
        txtMotSchwhr.Text = dt.Rows[0]["MotherSchlPlace"].ToString();
        txtMotclgatnd.Text = dt.Rows[0]["MotherCollege"].ToString();
        txtMotclgwrh.Text = dt.Rows[0]["MotherClgPlace"].ToString();
        txtMotAdhr.Text = dt.Rows[0]["MotherAdhar"].ToString();
        txtMothOcc.Text = dt.Rows[0]["MotherOccupation"].ToString();
        txtMotEdcnQlfn.Text = dt.Rows[0]["MotherEQ"].ToString();
        txtMotdeprtmt.Text = dt.Rows[0]["MotherDept"].ToString();
        txtMotdeprtmt.Text = dt.Rows[0]["MotherDesig"].ToString();
        txtMotCompanyNm.Text = dt.Rows[0]["MotherComp"].ToString();
        txtPreplotnNo.Text = dt.Rows[0]["PresAddr1"].ToString();
        txtPreColony.Text = dt.Rows[0]["PresAddr2"].ToString();
        txtPreCity.Text = dt.Rows[0]["PresAddrCity"].ToString();
        txtPrePin.Text = dt.Rows[0]["PresAddrPin"].ToString();
        txtPreState.Text = dt.Rows[0]["PresAddrState"].ToString();
        txtPreCountry.Text = dt.Rows[0]["PresAddrCntry"].ToString();
        txtPerHouseNo.Text = dt.Rows[0]["PermAddr1"].ToString();
        txtPerStreet.Text = dt.Rows[0]["PermAddr2"].ToString();
        txtPreCity.Text = dt.Rows[0]["PermAddrCity"].ToString();
        txtPrePin.Text = dt.Rows[0]["PermAddrPin"].ToString();
        txtPerState.Text = dt.Rows[0]["PermAddrState"].ToString();
        txtPerCountry.Text = dt.Rows[0]["PermAddrCntry"].ToString();
        txtPhoneRes.Text = dt.Rows[0]["TelNoResidence"].ToString();
        txtPhoneOff.Text = dt.Rows[0]["TeleNoOffice"].ToString();
        txtMobile.Text = dt.Rows[0]["MobileNo1"].ToString();
        txtMobile2.Text = dt.Rows[0]["MobileNo2"].ToString();
        txtEmail1.Text = dt.Rows[0]["EmailId1"].ToString();
        txtEmails2.Text = dt.Rows[0]["EmailId2"].ToString();
        drpBoardType.Text = dt.Rows[0]["BoardType"].ToString();
        string name = dt.Rows[0]["Nationality"].ToString();
        drpBoardType.SelectedIndex = drpBoardType.Items.IndexOf(drpBoardType.Items.FindByText(dt.Rows[0]["BoardType"].ToString()));
        drpbloodgrp.Text = dt.Rows[0]["BloodGroup"].ToString();
        drpbloodgrp.SelectedIndex = drpbloodgrp.Items.IndexOf(drpbloodgrp.Items.FindByText(dt.Rows[0]["BloodGroup"].ToString()));
        drpdenomination.Text = dt.Rows[0]["Denomination"].ToString();
        drpdenomination.SelectedIndex = drpdenomination.Items.IndexOf(drpdenomination.Items.FindByText(dt.Rows[0]["Denomination"].ToString()));
        drpnationlity.Text = dt.Rows[0]["Nationality"].ToString();
        drpnationlity.SelectedIndex = drpnationlity.Items.IndexOf(drpnationlity.Items.FindByText(" "+name.Trim()));
    }
    private void InsertStudDetails()
    {
        Classdal clsDal = new Classdal();
        Hashtable hashtable = new Hashtable();
        if (Request.QueryString["formNo"] != null)
            hashtable.Add("FormNo", Request.QueryString["formNo"]);
        hashtable.Add("FullName", txtname.Text.Trim());
        hashtable.Add("@DOB", Convert.ToDateTime(txtDate.Text));
        hashtable.Add("@POB", txtBirthPlace.Text.Trim());
        if(drpMotToung.SelectedIndex>0)
        hashtable.Add("@MotherTongue", drpMotToung.SelectedItem.ToString());
        hashtable.Add("@Locality","");
        hashtable.Add("@FatherName", txtFatName.Text.Trim());
        hashtable.Add("@FatherOccupation", txtFatOcpton.Text.Trim());
        hashtable.Add("@MotherName", txtMotherNm.Text.Trim());
        hashtable.Add("@MotherOccupation", txtMothOcc.Text.Trim());
        hashtable.Add("@PresentAddress1", txtPreplotnNo.Text.Trim());
        hashtable.Add("@PresentAddress2", txtPreColony.Text.Trim());
        hashtable.Add("@PresAddrState", txtPreState.Text.Trim());
        hashtable.Add("@PresAddrCon", txtPreCountry.Text.Trim());
        hashtable.Add("@PresAddrPin", txtPrePin.Text.Trim());
        hashtable.Add("@PresAddrCity", txtPreCity.Text.Trim());
        hashtable.Add("@PermAddress1", txtPerHouseNo.Text.Trim());
        hashtable.Add("@PermAddress2", txtPerStreet.Text.Trim());
        hashtable.Add("@PermAddrState", txtPerState.Text.Trim());
        hashtable.Add("@PermAddrCon", txtPerCountry.Text.Trim());
        hashtable.Add("@PermAddrPin", txtPerPin.Text.Trim());
        hashtable.Add("@PermAddrCity", txtPerCity.Text.Trim());
        hashtable.Add("@TelNoResidence", txtPhoneRes.Text.Trim());
        hashtable.Add("@TeleNoOffice", txtPhoneOff.Text.Trim());
        hashtable.Add("@Mobile1", txtMobile.Text.Trim());
        hashtable.Add("@Mobile2", txtMobile2.Text.Trim());
        hashtable.Add("@EmailId1", txtEmail1.Text.Trim());
        hashtable.Add("@EmailId2", txtEmails2.Text.Trim());
        if (drpnationlity.SelectedIndex > 0)
            hashtable.Add("@Nationality", drpnationlity.SelectedItem.ToString());
            hashtable.Add("@SportsProf", "");
        hashtable.Add("@Hobbies", "");
        if (drpcat.SelectedIndex > 0)
            hashtable.Add("@Cat", drpcat.SelectedValue);
            hashtable.Add("@TribeName", txtTribe.Text.Trim());
        hashtable.Add("@StudAdhar", txtStudAdhar.Text.Trim());
        hashtable.Add("@FatherAdhar", txtFatAdhr.Text.Trim());
        hashtable.Add("@FatherSchl", txtFatSchoolAttn.Text.Trim());
        hashtable.Add("@FatherSchlPlc", txtFatSchWhe.Text.Trim());
        hashtable.Add("@FatherClg", txtFatCollAtten.Text.Trim());
        hashtable.Add("@FatherClgPlc", txtFatCollwhre.Text.Trim());
        hashtable.Add("@FatherDesg", txtFatdesign.Text.Trim());
        hashtable.Add("@FatherDept", txtFatdept.Text.Trim());
        hashtable.Add("@FatherComp", txtFatcompanynm.Text.Trim());
        hashtable.Add("@FatherEQ", txtFatEdon.Text.Trim());
        hashtable.Add("@MotherEQ", txtMotEdcnQlfn.Text.Trim());
        hashtable.Add("@MotherSchl", txtMotsclattnd.Text.Trim());
        hashtable.Add("@MotherSchlPlc", txtMotSchwhr.Text.Trim());
        hashtable.Add("@MotherClg", txtMotclgatnd.Text.Trim());
        hashtable.Add("@MotherClgPlc", txtMotclgwrh.Text.Trim());
        hashtable.Add("@MotherDesg", txtMotdgn.Text.Trim());
        hashtable.Add("@MotherDept", txtMotdeprtmt.Text.Trim());
        hashtable.Add("@MotherComp", txtMotCompanyNm.Text.Trim());
        hashtable.Add("@MotherAdhar", txtMotAdhr.Text.Trim());
        hashtable.Add("@BankName", txtbank.Text.Trim());
        hashtable.Add("@BankAcNo", txtAcNo.Text.Trim());
        hashtable.Add("@IFSCCode", txtIFSC.Text.Trim());
        if (drpBoardType.SelectedIndex > 0)
            hashtable.Add("@BoardType", drpBoardType.SelectedItem.ToString());
            hashtable.Add("@HouseID", 1);
        if (Request.QueryString["status"] != null)
        {
            hashtable.Add("@Status", Request.QueryString["status"].ToString());
        }
        else
            hashtable.Add("@Status", 1);
        if (drpGender.SelectedIndex > 0)
            hashtable.Add("@sex", drpGender.SelectedItem.ToString());
            if (drpRegion.SelectedIndex > 0)
                hashtable.Add("@religion", drpRegion.SelectedValue);
                if (drpdenomination.SelectedIndex > 0)
                    hashtable.Add("@Denomination", drpdenomination.SelectedItem.ToString());   
                    hashtable.Add("@PrevSchoolname", txtlastSchAtt.Text.Trim());
        hashtable.Add("@AdmnSessYr", DateTime.Now.ToString("yyyy") + "-" + (Convert.ToInt32(DateTime.Now.ToString("yy")) + 1).ToString());
        if (drpClass.SelectedIndex > 0)
            hashtable.Add("@Class", drpClass.SelectedValue);
            //if (Drplstclass.SelectedIndex > 0)
                hashtable.Add("@PrevClass", Drplstclass.SelectedValue);
                hashtable.Add("@TCNo", txtTc.Text);
        hashtable.Add("@StudType", "N");
        ViewState["FormNo"] = string.Empty;
        if (drpbloodgrp.SelectedIndex > 0)
             hashtable.Add("@BloodGroup", drpbloodgrp.SelectedItem.ToString());
            hashtable.Add("@Stream", rdobtnCourse.SelectedValue);
        if (fldUpImage.HasFile)
        {

            string str = DateTime.Now.ToString("yyyyMMddhhmmss") + Path.GetExtension(fldUpImage.FileName);
            hashtable.Add("StudentPhoto", str);
            fldUpImage.SaveAs(Server.MapPath("~/Temporary_Files/Temp_Images/" + str));


        }
        else if (ViewState["StudNImg"].ToString() != "")
        {
            string filePath = "~/Temporary_Files/Temp_Images/" + ViewState["tempImg"].ToString();
            File.Copy(Server.MapPath(filePath), Server.MapPath("~/Temporary_Files/Templorary_Img/" + ViewState["tempImg"].ToString()));
            hashtable.Add("StudentPhoto", ViewState["StudNImg"].ToString());

        }
        else if (ViewState["StudImg"] != null)
            hashtable.Add("StudentPhoto", ViewState["StudImg"].ToString());
        else
            hashtable.Add("StudentPhoto", "NoImage.jpg");

        DataTable dataTable = clsDal.GetDataTable("insert_Studentinfo_ForAdmn", hashtable);
        if (dataTable.Rows.Count > 0)
        {
            // ViewState["FormNo"] = Request.QueryString["FormNo"].ToString();
            ViewState["FormNo"] = dataTable.Rows[0]["formNo"]; 
        }

    }
    protected void drpcat_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void btnPreview_Click(object sender, EventArgs e)
    {
        if (!fldUpImage.HasFile)
        {
            lblimg.Text = "please select a image"; //if file uploader has no file selected  
        }
        else if (fldUpImage.HasFile)
        {
            string str = DateTime.Now.ToString("yyyyMMddhhmmss") + Path.GetExtension(fldUpImage.FileName);
            string pht = fldUpImage.FileName;


            lblimg.Visible = true;
            string filePath = fldUpImage.PostedFile.FileName; // getting the file path of uploaded file  
            string filename1 = Path.GetFileName(filePath); // getting the file name of uploaded file  
            string ext = Path.GetExtension(filename1); // getting the file extension of uploaded file  
            string type = String.Empty;

            fldUpImage.SaveAs(Server.MapPath("../Temporary_Files/Temp_Images/" + str));
            ViewState["tempImg"] = str;
            ViewState["StudNImg"] = str;

            try
            {
                switch (ext)
                {
                    case ".png":
                        type = "image/png";
                        break;
                    case ".jpeg":
                        type = "image/jpeg";
                        break;
                    case ".jpg":
                        type = "image/jpg";
                        break;
                    case ".webp":
                        type = "image/webp";
                        break;
                }
                if (type != string.Empty)
                {
                    Stream strm = fldUpImage.PostedFile.InputStream;
                    BinaryReader reader = new BinaryReader(strm);
                    Byte[] bytes = reader.ReadBytes(Convert.ToInt32(strm.Length));
                    imgStud.Src = "data:image/png;base64," + Convert.ToBase64String(bytes, 0, bytes.Length);
                    imgStud.Src = "data:image/jpg;base64," + Convert.ToBase64String(bytes, 0, bytes.Length);
                    imgStud.Src = "data:image/jpeg;base64," + Convert.ToBase64String(bytes, 0, bytes.Length);
                    imgStud.Visible = true;
                    lblimg.Text = "image Upload Successfully";
                }
                else
                {
                    lblimg.ForeColor = System.Drawing.Color.Red;
                    lblimg.Text = "Select only image";
                }
            }
            catch (Exception ex)
            {
                lblimg.Text = "Error: " + ex.Message.ToString();
            }

        }
        else
        {
            if (imgStud.Src == "~/images/student.png")
            {
                ScriptManager.RegisterStartupScript(btnPreview, btnPreview.GetType(), "Alert", "alert('Upload an image to preview');", true);
            }

        }
    }

    protected void chkboxAdd_CheckedChanged(object sender, EventArgs e)
    {
            if (chkboxAdd.Checked)
            {
            txtPerHouseNo.Text = txtPreplotnNo.Text;
            txtPerStreet.Text = txtPreColony.Text;
            txtPerCity.Text = txtPreCity.Text;
             txtPerState.Text= txtPrePin.Text;
              txtPerCountry.Text= txtPreState.Text;
          txtPerPin.Text = txtPreCountry.Text;
        }
            else
            {
            txtPerHouseNo.Text = "";
            txtPerStreet.Text = "";
            txtPerCity.Text = "";
            txtPerPin.Text = "";
            txtPerState.Text = "";
            txtPerCountry.Text = "";
            }
        }

    protected void fldUpImage_DataBinding(object sender, EventArgs e)
    {
        if (!fldUpImage.HasFile)
        {
            lblimg.Text = "please select a image"; //if file uploader has no file selected  
        }
        else if (fldUpImage.HasFile)
        {
            string str = DateTime.Now.ToString("yyyyMMddhhmmss") + Path.GetExtension(fldUpImage.FileName);
            string pht = fldUpImage.FileName;


            lblimg.Visible = true;
            string filePath = fldUpImage.PostedFile.FileName; // getting the file path of uploaded file  
            string filename1 = Path.GetFileName(filePath); // getting the file name of uploaded file  
            string ext = Path.GetExtension(filename1); // getting the file extension of uploaded file  
            string type = String.Empty;

            fldUpImage.SaveAs(Server.MapPath("../Temporary_Files/Temp_Images/" + str));
            ViewState["tempImg"] = str;
            ViewState["StudNImg"] = str;

            try
            {
                switch (ext)
                {
                    case ".png":
                        type = "image/png";
                        break;
                    case ".jpeg":
                        type = "image/jpeg";
                        break;
                    case ".jpg":
                        type = "image/jpg";
                        break;
                    case ".webp":
                        type = "image/webp";
                        break;
                }
                if (type != string.Empty)
                {
                    Stream strm = fldUpImage.PostedFile.InputStream;
                    BinaryReader reader = new BinaryReader(strm);
                    Byte[] bytes = reader.ReadBytes(Convert.ToInt32(strm.Length));
                    imgStud.Src = "data:image/png;base64," + Convert.ToBase64String(bytes, 0, bytes.Length);
                    imgStud.Src = "data:image/jpg;base64," + Convert.ToBase64String(bytes, 0, bytes.Length);
                    imgStud.Src = "data:image/jpeg;base64," + Convert.ToBase64String(bytes, 0, bytes.Length);
                    imgStud.Visible = true;
                    lblimg.Text = "image Upload Successfully";
                }
                else
                {
                    lblimg.ForeColor = System.Drawing.Color.Red;
                    lblimg.Text = "Select only image";
                }
            }
            catch (Exception ex)
            {
                lblimg.Text = "Error: " + ex.Message.ToString();
            }



        }
        else
        {
            if (imgStud.Src == "~/images/student.png")
            {
                ScriptManager.RegisterStartupScript(btnPreview, btnPreview.GetType(), "Alert", "alert('Upload an image to preview');", true);
            }

        }
    }

   
}
