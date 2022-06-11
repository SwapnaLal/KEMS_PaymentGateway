<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ShowApplyStudList.aspx.cs" Inherits="Pages_ShowApplyStudList" %>

<!DOCTYPE html>

<%--<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
    </form>
</body>
</html>--%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>KEMS_ADMISSION</title>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.3/moment.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="js/mark.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
    <link rel="stylesheet" href="/resources/demos/style.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous" />

    <%--   css link--%>
    <link href="../css/NewStyle.css" rel="stylesheet" />

    <%--    Java Script--%>
    <script type="text/javascript">
        
    </script>

    <script type="text/javascript">
        function f1() {
            $("#fileup1").click();
            $(document).ready(function () {

                $("#fileup1").change(function () {

                    var File = this.files;

                    if (File && File[0]) {
                        ReadImage(File[0]);
                    }
                })
            })
            var ReadImage = function (file) {

                var reader = new FileReader;
                var image = new Image;

                reader.readAsDataURL(file);
                reader.onload = function (_file) {

                    image.src = _file.target.result;
                    image.onload = function () {

                        var height = this.height;
                        var width = this.width;
                        var type = file.type;
                        var size = ~~(file.size / 1024); //+ " KB";
                    }
                    $("#parent").attr('src', _file.target.result);

                }
            }
        }
    </script>
    <script>
        function isNumberKeyInquiry(evt) {
            var charCode = (evt.which) ? evt.which : event.keyCode
            if (charCode > 31 && (charCode < 48 || charCode > 57))
                return false;
            return true;
        }
    </script>
    <script type="text/javascript">
        function funcstudent() {
            $("#studentimg").click();
            $(document).ready(function () {

                $("#studentimg").change(function () {

                    var File = this.files;

                    if (File && File[0]) {
                        ReadImage(File[0]);
                    }
                })
            })
            var ReadImage = function (file) {

                var reader = new FileReader;
                var image = new Image;

                reader.readAsDataURL(file);
                reader.onload = function (_file) {

                    image.src = _file.target.result;
                    image.onload = function () {

                        var height = this.height;
                        var width = this.width;
                        var type = file.type;
                        var size = ~~(file.size / 1024) + "KB";
                        $("#student").attr('src', _file.target.result);

                    }

                }

            }
        }
    </script>
    <script type="text/javascript">

        function setFocus(myTextbox) {
            var textarea = document.getElementById("myTextbox");
            if (textarea = "this.value") {
                // document.getElementById("myTextbox").focus();
                document.getElementById("myTextbox").readOnly = false;
            }
            else {
                document.getElementById("myTextbox").readOnly = true;
            }
        }
    </script>

    <script>
        $(function () {
            $("#datepicker").datepicker({
                dateFormat: 'dd/mm/yy'
            });
        });
    </script>

    <script type="text/javascript">
        $(document).ready(function () {
            $("#studReligion").change(function () {
                var value = $("#studReligion option:selected").val();
                if (value === 'Christian') {
                    $("#ReliDenom").prop('disabled', false);
                } else {
                    $("#ReliDenom").prop('disabled', true);
                }
            });
        });
    </script>

    <script type="text/javascript">
        $(document).ready(function () {
            $('input[type="date"]').on('change', function () {
                getAge($(this).val());
                this.setAttribute(
                    "data-date",
                    moment(this.value, "YYYY-MM-DD")
                        .format(this.getAttribute("data-date-format"))
                );
            }).trigger("change");
        });
        function getAge(dateString) {
            if (dateString !== '') {
                var d1 = new Date("2022-03-31");
                var d2 = new Date(dateString);
                var dates = ["First", "Second", "Third", "Fourth", "Fifth", "Sixth", "Seventh", "Eighth", "Ninth", "Tenth", "Eleventh", "Tweleveth", "Thirteenth", "Fourteenth", "Fifteenth", "Sixteenth", "Seventeenth", "Eighteenth", "Nineteenth", "Twentieth", "Twenty First", "Twenty Second", "Twenty Third", "Twenty Fourth", "Twenty Fifth", "Twenty Sixth", "Twenty Seventh", "Twenty Eightth", "Twenty Nineth", "Thirtyth", "Thirty First"];
                var months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
                var AgeYrs = ["", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Eleven", "Tweleve", "Thirteen", "Fourteen", "Fifteen", "Sixteen", "Seventeen", "Eighteen"];
                var AgeMns = ["", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Eleven", "Tweleve", "Thirteen", "Fourteen", "Fifteen", "Sixteen", "Seventeen", "Eighteen"];
                var AgeDts = ["", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Eleven", "Tweleve", "Thirteen", "Fourteen", "Fifteen", "Sixteen", "Seventeen", "Eighteen", "Nineteen", "Twenty", "Twenty One", "Twenty Two", "Twenty Three", "Twenty Four", "Twenty Five", "Twenty Six", "Twenty Seven", "Twenty Eight", "Twenty Nine", "Thirty", "Thirty one"];
                var diff = new Date(
                    d1.getFullYear() - d2.getFullYear(),
                    d1.getMonth() - d2.getMonth(),
                    d1.getDate() - d2.getDate()
                );
                var dateword = dates[d2.getDate() - 1] + " " + months[d2.getMonth()] + " ";
                if (d2.getYear() == '100')
                    dateword = dateword + " Two Thousand";
                if (d2.getYear() == '101')
                    dateword = dateword + " Two Thousand One";
                if (d2.getYear() == '102')
                    dateword = dateword + " Two Thousand Two";
                if (d2.getYear() == '103')
                    dateword = dateword + " Two Thousand Three";
                if (d2.getYear() == '104')
                    dateword = dateword + " Two Thousand Four";
                if (d2.getYear() == '105')
                    dateword = dateword + " Two Thousand Five";
                if (d2.getYear() == '106')
                    dateword = dateword + " Two Thousand Six";
                if (d2.getYear() == '107')
                    dateword = dateword + " Two Thousand Seven";
                if (d2.getYear() == '108')
                    dateword = dateword + " Two Thousand Eight";
                if (d2.getYear() == '109')
                    dateword = dateword + " Two Thousand Nine";
                if (d2.getYear() == '110')
                    dateword = dateword + " Two Thousand Ten";
                if (d2.getYear() == '111')
                    dateword = dateword + " Two Thousand Eleven";
                if (d2.getYear() == '112')
                    dateword = dateword + " Two Thousand Tweleve";
                if (d2.getYear() == '113')
                    dateword = dateword + " Two Thousand Thirteen";
                if (d2.getYear() == '114')
                    dateword = dateword + " Two Thousand Fourteen";
                if (d2.getYear() == '115')
                    dateword = dateword + " Two Thousand Fifteen";
                if (d2.getYear() == '116')
                    dateword = dateword + " Two Thousand Sixteen";
                if (d2.getYear() == '117')
                    dateword = dateword + " Two Thousand Seventeen";

                var AgeWrds = AgeYrs[diff.getYear()] + " Years , ";

                if (AgeMns[diff.getMonth()] > 0) {
                    AgeWrds = AgeWrds + AgeMns[diff.getMonth()];
                    if (AgeMns[diff.getMonth()] == 1)
                        AgeWrds = AgeWrds + " Month , ";
                    else
                        AgeWrds = AgeWrds + " Months , ";
                }
                AgeWrds = AgeWrds + AgeDts[diff.getDate()] + " Days";

                $('input[name="stu_age"]').val(diff.getYear() + " Year , " + diff.getMonth() + " Month , " + diff.getDate() + " Days");
                $('input[name="stu_word1"]').val(dateword);
                $('input[name="stu_word2"]').val(AgeWrds);
            }
        }
    </script>
    <script type="text/javascript">
        function validateForm() {
            var a = document.getElementById("stu_adh").value;
            var b = document.getElementById("stu_ac_no").value;
            var c = document.getElementById("f_adh_no").value;
            var d = document.getElementById("m_adh_no").value;
            var e = document.getElementById("c_phone").value;
            var f = document.getElementById("c_mob").value;
            if (!a.match(/^[0-9]+$/)) {
                alert("Adhar number must be filled with numbers only");
                return false;
            } else if (a.length > 12) {
                alert("Adhar number must not be greater than 12 character length");
                return false;
            } else if (!b.match(/^[0-9]+$/)) {
                alert("Account must be filled with numbers only");
                return false;
            } else if (b.length > 11 {
                alert("Account number must not be greater than 11 character length");
                return false;
            } else if (!c.length) {
                alert("Adhar number must be filled out");
                return false;
            } else if (!c.match(/^[0-9]+$/)) {
                alert("Adhar must be filled with numbers only");
                return false;
            } else if (c.length > 12 {
                alert("Adhar number must not be greater than 12 character length");
                return false;
            }
        }else if (!d.length) {
            alert("Adhar number must be filled out");
            return false;
        } else if (!d.match(/^[0-9]+$/)) {
            alert("Adhar must be filled with numbers only");
            return false;
        } else if (d.length > 12 {
            alert("Adhar number must not be greater than 12 character length");
            return false;
        } else if (!e.match(/^[0-9]+$/)) {
            alert("filled with numbers only");
            return false;
        } else if (!f.match(/^[0-9]+$/)) {
            alert("Adhar must be filled with numbers only");
            return false;
        }
}
    </script>
    <script>
        function FillBilling(f) {
            if (f.billingtoo.checked == true) {
                f.c_line11.value = f.c_line1.value;
                f.c_line22.value = f.c_line2.value;
                f.c_city1.value = f.c_city.value;
                f.c_pin1.value = f.c_pin.value;
                f.c_state1.value = f.c_state.value;
                f.c_country1.value = f.c_country.value;
            }
        }
    </script>
    <script>
        function changeMothername() {
            //alert ("111111111");
            var stu_name = $("#stu_name").val();
            var stu_datbath = $("#stu_word1").val();
            var f_name = $("#f_name").val();
            var m_name = $("#m_name").val();
            var settingURl = "<?php echo $adminurl; ?>";
            var urls = settingURl + "ajax/namechk.php";
            $.ajax({
                type: "POST",
                url: urls,
                data: { stu_name: stu_name, stu_datbath: stu_datbath, f_name: f_name, m_name: m_name },
                success: function (response) {
                    $("#name_status").html(response);
                    if (response == "OK") {
                        return true;
                    }
                    else {
                        return false;
                    }
                }
            });
        }
    </script>
    <!-------------------radio button onclick function course---------------------->
    <script>
        $(document).ready(function () {
            $("input[name='optradio']").click(function () {
                $('#show-me1').css('display', ($(this).val() === 'ARTS') ? 'block' : 'none');
                $('#show-me2').css('display', ($(this).val() === 'ARTS') ? 'block' : 'none');
                //$('#show-me3').css('display', ($(this).val() === 'ARTS') ? 'block':'none');
                $('#ahed').css('display', ($(this).val() === 'ARTS') ? 'block' : 'none');


                $('#show-me11').css('display', ($(this).val() === 'COMMERCE') ? 'block' : 'none');
                $('#show-me22').css('display', ($(this).val() === 'COMMERCE') ? 'block' : 'none');
                //$('#show-me33').css('display', ($(this).val() === 'COMMERCE') ? 'block':'none');
                $('#ched').css('display', ($(this).val() === 'COMMERCE') ? 'block' : 'none');

                $('#show-me111').css('display', ($(this).val() === 'BIO-SCIENCE') ? 'block' : 'none');
                $('#show-me222').css('display', ($(this).val() === 'BIO-SCIENCE') ? 'block' : 'none');
                //$('#show-me333').css('display', ($(this).val() === 'BIO-SCIENCE') ? 'block':'none');
                $('#bhed1').css('display', ($(this).val() === 'BIO-SCIENCE') ? 'block' : 'none');
                $('#bhed2').css('display', ($(this).val() === 'BIO-SCIENCE') ? 'block' : 'none');

                $('#show-me1111').css('display', ($(this).val() === 'PURE-SCIENCE') ? 'block' : 'none');
                $('#show-me2222').css('display', ($(this).val() === 'PURE-SCIENCE') ? 'block' : 'none');
                //$('#show-me3333').css('display', ($(this).val() === 'PURE-SCIENCE') ? 'block':'none');
                $('#phed1').css('display', ($(this).val() === 'PURE-SCIENCE') ? 'block' : 'none');
                $('#phed2').css('display', ($(this).val() === 'PURE-SCIENCE') ? 'block' : 'none');
            });
        });
    </script>
    <!-------------------radio button onclick function course---------------------
    <script type="text/javascript">
    $(document).ready(function () {
        $("#bio_sci").change(function(){
        var value = $("#bio_sci checked").val();
        if (value === 'mathematics'){
            $( "#math" ).prop('checked', false);
        } else {
            $( "#math" ).prop('checked', true);
        }

    });
    $("#pure_sci").change(function(){
        var value = $("#pure_sci checked").val();
        if (value === 'PURE-SCIENCE'){
            $( "#com_sci" ).prop('checked', false);
        } else {
            $( "#com_sci" ).prop('checked', true);
        }

    });
    });
    </script>-->
    <script>
        $(document).ready(function () {
            $(':radio').change(function (event) {
                var id = $(this).data('id');

                $('#' + id).addClass('none').siblings().removeClass('none');
            });
        });
    </script>
    <script type="text/javascript">
        function Validate(event) {
            var regex = new RegExp("^[0-9-!@#$%*.?]");
            var key = String.fromCharCode(event.charCode ? event.which : event.charCode);
            if (!regex.test(key)) {
                event.preventDefault();
                return false;
            }
        }
    </script>
    <!-------------------total and avg mark---------------------->
    <script>


</script>
    <script>
        $(function () {
            $("#math").click(function () {
                if ($(this).is(":checked")) {
                    $("#mathc").show();

                } else {
                    $("#mathc").hide();

                }
            });
        });

    </script>
    <script>
        $(function () {
            $("#com_sci").click(function () {
                if ($(this).is(":checked")) {
                    $("#coms").show();

                } else {
                    $("#coms").hide();

                }
            });
        });
    </script>
    <script>

        $(document).ready(function () {
            $('#scll').on('change', function () {
                if (this.value == '1') {
                    $("#adm").show();
                    $("#adm1").show();
                    $("#admno").attr('required', '');
                }
                else {
                    $("#adm").hide();
                    $("#adm1").hide();
                    $("#admno").removeAttr('required');
                }
                if (this.value == '2') {
                    $("#scl").show();
                    $("#scl1").show();
                    $("#schol").attr('required', '');
                }
                else {
                    $("#scl").hide();
                    $("#scl1").hide();
                    $("#schol").removeAttr('required');
                }
            });
        });
    </script>

</head>
  
<body>
     <input type="hidden" runat="server" id="key" name="key" />
      <input type="hidden" runat="server" id="hash" name="hash"  />
            <input type="hidden" runat="server" id="txnid" name="txnid" />
    <form class="form-inline" id="form1" runat="server">
        <asp:ScriptManager ID="scriptmanager1" runat="server">  
</asp:ScriptManager> 
           <asp:UpdatePanel ID="updatepnl" runat="server">  
                <ContentTemplate> 
        <div class="container sec">
            <table class=" fst-tbl">
                <tbody>
                    <tr>
                        <td class="auto-style1">
                            <img src="../image/kems_logo2.png" style="width:100%"/>
                        </td>
                    </tr>
                </tbody>
            </table>
            </div>

        <div class="container sec">
         <center> <b style="color:red">All fields marked with * are mandatory.</b> </center>
            <br />
            <table class=" fst-tbl">
                <tbody>

                    <tr>
                        <td rowspan="2" style="padding-left: 60px;" class="auto-style1">
                            <h3>COURSE APPLIED FOR (select the course)*</h3>
                            <asp:RadioButtonList ID="rdobtnCourse" runat="server" Height="33px" RepeatDirection="Horizontal" Width="373px" Enabled="false">
                                <asp:ListItem Selected="True" Value="4">001 – BIO-SCIENCE(Biology)</asp:ListItem>
                                <asp:ListItem Value="3"> 002 – COMMERCE</asp:ListItem>
                            </asp:RadioButtonList>
                            <br />
<%--                            <div id='show-me1' style='display: ;'>
                                <p>Optional subject(s): (Select the appropriate options)</p>
                                <p style="padding-bottom: 10px;">
                                    I want to take
                                <asp:RadioButtonList ID="RadioButtonList2" runat="server" Height="25px" RepeatDirection="Horizontal" Width="348px">
                                    <asp:ListItem Selected="True" Value="1">Mathematics /</asp:ListItem>
                                    <asp:ListItem Value="2"> Psychology  as 5th Subjects</asp:ListItem>
                                </asp:RadioButtonList>

                                </p>
                                <div id='show-mes1' style='display: none;'>
                                    <p style="padding-bottom: 10px;">
                                        I want to take <b>Mathematics</b>
                                        <label>
                                            <input type="radio" value="Mathematics" name="subject" data-id="maths" />/ Psychology</label>
                                        <label>
                                            <input type="radio" name="subject" value="Psychology" data-id="psy" /></label>
                                        as 5th Subjects
                                    </p>
                                </div>
                            </div>--%>
                        </td>
                    </tr>
            <tr>
                        <%--    width:68%;--%>
                        <td colspan="2">
                            <img id="imgStud" runat="server" src="../image/in_visa.jpg" style="margin-left: 120px; height: 150px;" />
                            <asp:FileUpload ID="uploadImg" runat="server" Style="margin-bottom:-50px; margin-left: 105px;"/>
                            <asp:Button ID="btnPreview" runat="server" class="btn btn-warning" Text="Preview" style="margin-top:25px; height:30px; margin-left: 300px;" OnClick="btnPreview_Click" />
                            <br />
                            <span class="notiec" style="margin-bottom:-50px; margin-left: 105px;">Image (JPG/PNG) size 1MB Max.</span>

                        </td>
                    </tr>
                </tbody>
            </table>

            <%--table stated--%>
        </div>

        <div class="container">
            <table class="table">
                <tbody>
                    <tr>
                        <td rowspan="13" class="td-left-name">
                            <h1>
                                <span>S </span>
                                <span>T </span>
                                <span>U </span>
                                <span>D </span>
                                <span>E </span>
                                <span>N </span>
                                <span>T </span>
                            </h1>
                        </td>
                        <td>1.</td>
                        <td>Student's Name<br />
                            <span class="td-spn">(As it appears in Birth Certificate)</span><span class="star">*</span></td>
                        <td colspan="5">
                              <asp:Label ID="lblStudName" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>2.</td>
                        <td>Date of Birth <span class="td-spn">(mm-dd-yyyy)</span><span class="star">*</span></td>
                            <td colspan="2">
                                 <asp:Label ID="lblStudDOB" runat="server" Text="Label"></asp:Label>
                            </td>
                            <td colspan="3">
                                <asp:TextBox ID="txtstu_word1" class="form-control" runat="server" placeholder="" ></asp:TextBox>
                            </td>
                    </tr>
                    <tr>
                        <td>3.</td>
                        <td>Age <span class="td-spn">(As on 31st March 2022)</span><span class="star">*</span></td>
                        <td colspan="2">
                              <asp:TextBox ID="txtAge" class="form-control" runat="server" placeholder="Age" ></asp:TextBox>
                        </td>
                        <td colspan="3">
                             <asp:TextBox ID="txtstu_word2" class="form-control" runat="server" placeholder="" ></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>4.</td>
                        <td>Place Of Birth<span class="star">*</span></td>
                        <td>
                              <asp:Label ID="lblBirthPlace" runat="server" Text="Label"></asp:Label></td>
                        <td>5.</td>
                        <td>Gender<span class="star">*</span></td>
                        <td>
                           <asp:Label ID="lblGender" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>6.</td>
                        <td>Admission requested for</td>
                            <td>
                               <asp:Label ID="lblAdmnReqFor" runat="server" Text="Label"></asp:Label> 
                            </td>
                            <td>7.</td>
                            <td>Name of Examination/Board<span class="star">*</span></td>
                            <td>

                                <asp:Label ID="lblExamType" runat="server" Text="Label"></asp:Label> 

                            </td>
                    </tr>
                    <tr>
                        <td>8.</td>
                        <td>School Last Attended<span class="star">*</span></td>
                          <td>
                                <asp:Label ID="lblStudLastSch" runat="server" Text="Label"></asp:Label>
                        </td>
                        <td>9.</td>
                        <td>Class Last Attended<span class="star">*</span></td>
                        <td>
                            
  <asp:Label ID="lbllastSchool" runat="server" Text="Label"></asp:Label>
                            
                        </td>
                    </tr>
                    <tr>
                        <td>10.</td>
                        <td>T.C No. <span class="td-spn">(If Any)</span></td>
                        <td>
                              <asp:Label ID="lblStudTC" runat="server" Text="Label"></asp:Label></td>
                        <td>11.</td>
                        <td>Blood Group<span class="star">*</span></td>
                        <td>

   <asp:Label ID="lblbloodGp" runat="server" Text="Label"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>12.</td>
                        <td>Religion<span class="star">*</span></td>
                        <td>
                              <asp:Label ID="lblreligion" runat="server" Text="Label"></asp:Label></td>
                        <td>13.</td>
                        <td>Denomination (If Christians)</td>
                        <td>

                               <asp:Label ID="lbldenomination" runat="server" Text="Label"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>14.</td>
                        <td>Mother Tongue<span class="star">*</span></td>
                        <td>
                            <%--<select id="drpMotToung" runat="server" class="form-control" name="stu_lang">--%>
                              <asp:Label ID="lblMotToung" runat="server" Text="Label"></asp:Label></td>
                            <%--</select>--%>
                        <td>15.</td>
                        <td>Nationality<span class="star">*</span></td>
                        <td>
                            <asp:Label ID="lblNationality" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>16.</td>
                        <td>Category<span class="star">*</span></td>
                        <td>
                            <asp:Label ID="lblCatagory" runat="server" Text="Label"></asp:Label>
                        </td>

                        <td>17.</td>
                        <td>Tribe Name (If S.T.)</td>
                        <td>
                                   <asp:Label ID="lblStudTribName" runat="server" Text="Label"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>18.</td>
                        <td>Aadhaar Card No.</td>
                        <td>
                              <asp:Label ID="lblStudAdhar" runat="server" Text="Label"></asp:Label></td>
                        <td>19.</td>
                        <td>Bank Account No.</td>
                        <td>
                              <asp:Label ID="lblStudBankAc" runat="server" Text="Label"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>20.</td>
                        <td>Bank Name</td>
                        <td>
                              <asp:Label ID="lblStudBankName" runat="server" Text="Label"></asp:Label></td>
                        <td>21.</td>
                        <td>Bank IFSC</td>
                        <td>
                             <asp:Label ID="lblIFSC" runat="server" Text="Label"></asp:Label></td>
                    </tr>
                </tbody>
            </table>

            <table class="table">
                <tbody>
                    <tr>
                        <td rowspan="7" class="td-left-name">
                            <h1>
                                <span>F </span>
                                <span>A </span>
                                <span>T </span>
                                <span>H </span>
                                <span>E </span>
                                <span>R </span>
                            </h1>
                        </td>
                        <td>1.</td>
                        <td>Name<br />
                            <span class="td-spn">(As it appears in Identity Proof)</span><span class="star">*</span></td>
                        <td colspan="4">
                              <asp:Label ID="lblFatName" runat="server" Text="Label"></asp:Label>

                        </td>

                    </tr>
                    <tr>
                        <td>2.</td>
                        <td>School attended <span class="td-spn">(name)</span><span class="star">*</span></td>
                        <td colspan="2">
                              <asp:Label ID="lblFatSchAtten" runat="server" Text="Label"></asp:Label></td>
                        <td>Where<span class="star">*</span></td>
                        <td>
                              <asp:Label ID="lblFatSchFrom" runat="server" Text="Label"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>3.</td>
                        <td>College attended <span class="td-spn">(name)</span><span class="star">*</span></td>
                        <td colspan="2">
                              <asp:Label ID="lblFatClgAtten" runat="server" Text="Label"></asp:Label>
                            <td>Where<span class="star">*</span></td>
                            <td>
                                  <asp:Label ID="lblFatClgFrom" runat="server" Text="Label"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>4.</td>
                        <td>Educational Qualification<span class="star">*</span></td>
                        <td>
                              <asp:Label ID="lblFatQualification" runat="server" Text="Label"></asp:Label></td>
                        <td>5.</td>
                        <td>Occupation<span class="star">*</span></td>
                        <td>
                              <asp:Label ID="lblFatOccupation" runat="server" Text="Label"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>6.</td>
                        <td>Designation<span class="star">*</span></td>
                        <td>
                              <asp:Label ID="lblFatDesig" runat="server" Text="Label"></asp:Label></td>
                        <td>7.</td>
                        <td>Department<span class="star">*</span></td>
                        <td>
                              <asp:Label ID="lblFatDepartment" runat="server" Text="Label"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>8.</td>
                        <td>Name of Establishment/Institution/Company<span class="star">*</span></td>
                        <td colspan="4">
                              <asp:Label ID="lblFatCom" runat="server" Text="Label"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>9.</td>
                        <td>Aadhaar Card No.</td>
                        <td colspan="4">
                              <asp:Label ID="lblFatAdharNo" runat="server" Text="Label"></asp:Label></td>
                </tbody>
            </table>

            <span id="name_status" style="color: red; margin-left: 342px; font-size: large;"></span>
            <table class="table">
                <tbody>
                    <tr>
                        <td rowspan="7" class="td-left-name">
                            <h1>
                                <span>M </span>
                                <span>O </span>
                                <span>T </span>
                                <span>H </span>
                                <span>E </span>
                                <span>R </span>
                            </h1>
                        </td>
                        <td>1.</td>
                        <td>Name<br />
                            <span class="td-spn">(As it appears in Identity Proof)</span><span class="star">*</span></td>
                        <td colspan="4">
                              <asp:Label ID="lblMotNane" runat="server" Text="Label"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>2.</td>
                        <td>School attended (name)<span class="star">*</span></td>
                        <td colspan="2">
                             <asp:Label ID="lblMotLastSch" runat="server" Text="Label"></asp:Label>
                        </td>
                        <td>Where<span class="star">*</span></td>
                        <td>
                             <asp:Label ID="lblMotLastSchFrom" runat="server" Text="Label"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>3.</td>
                        <td>College attended (name)<span class="star">*</span></td>
                        <td colspan="2">
                              <asp:Label ID="lblMotClg" runat="server" Text="Label"></asp:Label></td>
                        <td>Where<span class="star">*</span></td>
                        <td>
                              <asp:Label ID="lblMotLastClgForm" runat="server" Text="Label"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>4.</td>
                        <td>Educational Qualification<span class="star">*</span></td>
                        <td>
                              <asp:Label ID="lblMotQua" runat="server" Text="Label"></asp:Label></td>
                        <td>5.</td>
                        <td>Occupation<span class="star">*</span></td>
                        <td>
                              <asp:Label ID="lblMotOccupation" runat="server" Text="Label"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>6.</td>
                        <td>Designation<span class="star">*</span></td>
                        <td>
                              <asp:Label ID="lblMotDeg" runat="server" Text="Label"></asp:Label></td>
                        <td>7.</td>
                        <td>Department<span class="star">*</span></td>
                        <td>
                              <asp:Label ID="lblMotDept" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>8.</td>
                        <td>Name of Establishment/Institution/Company<span class="star">*</span></td>
                        <td colspan="4">
                              <asp:Label ID="lblMotCompName" runat="server" Text="Label"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>9.</td>
                        <td>Aadhaar Card No.</td>
                        <td colspan="4">
                              <asp:Label ID="lblMotAdharNo" runat="server" Text="Label"></asp:Label></td>
                    </tr>
                </tbody>
            </table>

            <table class="table">
                <tbody>
                    <tr>
                        <td rowspan="14" class="td-left-name">
                            <h1>
                                <span>C </span>
                                <span>O </span>
                                <span>N </span>
                                <span>T </span>
                                <span>A </span>
                                <span>C </span>
                                <span>T </span>
                            </h1>
                        </td>
                        <td colspan="6">
                            <h3>Present Address</h3>
                        </td>
                    </tr>
                    <tr>
                        <td>1.</td>
                        <td>Line 1 <span class="td-spn">(House / Plot No. etc.)</span><span class="star">*</span></td>
                        <td colspan="4">
                              <asp:Label ID="lblPreLane1" runat="server" Text="Label"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>2.</td>
                        <td>Line 2 <span class="td-spn">(Street / Colony/ Area / PO)</span></td>
                        <td colspan="4">
                             <asp:Label ID="lblPreLane2" runat="server" Text="Label"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>3.</td>
                        <td>City <span class="star">*</span></td>
                        <td>
                              <asp:Label ID="lblPreCity" runat="server" Text="Label"></asp:Label>
                        </td>
                        <td>4.</td>
                        <td>Pin<span class="star">*</span></td>
                        <td>
                             <asp:Label ID="lblPrePin" runat="server" Text="Label"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>5.</td>
                        <td>State<span class="star">*</span></td>
                        <td>
                              <asp:Label ID="lblPreState" runat="server" Text="Label"></asp:Label></td>
                        <td>6.</td>
                        <td>Country<span class="star">*</span></td>
                        <td>
                              <asp:Label ID="lblPreCountry" runat="server" Text="Label"></asp:Label></td>
                    </tr>
                    <tr>
                        <td colspan="6">
                            <h3>Permanent Address <span class="td-spn">(If different from present address)</span>
                                 <asp:CheckBox ID="chkboxAdd" runat="server" OnCheckedChanged="chkboxAdd_CheckedChanged"
                                                    AutoPostBack="true" TabIndex="55" Text="Same As Present Address?" CssClass="tbltxt"
                                                    Font-Size="12px" Style="color: #e29a52;" Enabled="false"  />
                                <asp:CheckBox ID="chkCheck" runat="server" OnCheckedChanged="chkCheck_CheckedChanged"  AutoPostBack="true" Visible="false"/>
                                Copy
                                
                            </h3>
                        </td>
                    </tr>
                    <tr>
                        <td>1.</td>
                        <td>Line 1 <span class="td-spn">(House / Plot No. etc.)</span></td>
                        <td colspan="4">
                            <asp:Label ID="lblPerLane1" runat="server" Text="Label"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>2.</td>
                        <td>Line 2 <span class="td-spn">(Street / Colony/ Area / PO)</span></td>
                        <td colspan="4">
                               <asp:Label ID="lblPerLane2" runat="server" Text="Label"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>3.</td>
                        <td>City </td>
                        <td>
                              <asp:Label ID="lblPerCity" runat="server" Text="Label"></asp:Label>
                        <td>4.</td>
                        <td>Pin</td>
                        <td>
                              <asp:Label ID="lblPerPin" runat="server" Text="Label"></asp:Label>
                    </tr>
                    <tr>
                        <td>5.</td>
                        <td>State</td>
                        <td>
                              <asp:Label ID="lblPerState" runat="server" Text="Label"></asp:Label></td>
                        <td>6.</td>
                        <td>Country</td>
                        <td>
                            <asp:Label ID="lblPerCountry" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="6">
                            <h3>Phone Number And Email Address :</h3>
                        </td>
                    </tr>
                    <tr>
                        <td>1.</td>
                        <td>Phone <span class="td-spn">(Res)</span></td>
                        <td>
                            <asp:Label ID="lblPhNo1" runat="server" Text="Label"></asp:Label>
                        </td>
                        <td>2.</td>
                        <td>Phone <span class="td-spn">(Off)</span></td>
                        <td>
                            <asp:Label ID="lblPhNo2" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>3.</td>
                        <td>Mobile <span class="star">*</span><span class="td-spn">(1)</span><br />
                            <span class="td-spn">(For SMS Alert)</span></td>
                        <td>
                           <asp:Label ID="lblMob1" runat="server" Text="Label"></asp:Label>
                        <td>4.</td>
                        <td>Mobile <span class="td-spn">(2)</span></td>
                        <td>
                            <asp:Label ID="LblMob2" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>5.</td>
                        <td>Email Id <span class="star">*</span><span class="td-spn">(1)</span></td>
                        <td>
                            <asp:Label ID="lblEmailId1" runat="server" Text="Label"></asp:Label>
                        <td>6.</td>
                        <td>Email Id <span class="td-spn">(2)</span></td>
                        <td>
                            <asp:Label ID="lblEmailId2" runat="server" Text="Label"></asp:Label>
                            </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="trm container">
            <td>
            <asp:Button ID="btnUpdate" runat="server" Text="Edit" OnClick="btnUpdate_Click" CssClass="btn btn-primary" OnClientClick="return signup();" />
            </td>
            <td>
            <asp:Button ID="btnPayment" runat="server" Text="Payment" OnClick="btnPayment_Click" CssClass="btn btn-primary" OnClientClick="return signup();" />
                </td>
        </div>
                    </ContentTemplate>
 <Triggers>
            <asp:PostBackTrigger ControlID="chkCheck" />
           
         <asp:PostBackTrigger ControlID="btnPayment" />
        </Triggers>               </asp:UpdatePanel>
       <asp:Panel ID="pnlDetailsPG" runat="server">
         <asp:TextBox ID="amount" runat="server"   Text="1000" />
         <asp:TextBox ID="firstname" runat="server"   Text="KAMAL" />
         <asp:TextBox ID="email" runat="server"   Text="KAMAL" />
         <asp:TextBox ID="phone" runat="server" Text="KAMAL"/>
         <asp:TextBox ID="productinfo" runat="server"   Text="KAMAL" />
         <asp:TextBox ID="surl" runat="server"  />
         <asp:TextBox ID="furl" runat="server" />
        <asp:TextBox ID="curl" runat="server" />
           
           <asp:TextBox ID="udf1" runat="server"  Text="KAMAL"/>
           <asp:TextBox ID="udf2" runat="server" Text="KAMAL"/>
        
           <asp:TextBox ID="udf3" runat="server" Text="KAMAL"/>
         
           <asp:TextBox ID="udf4" runat="server" Text="KAMAL"/>
        
       
           <asp:TextBox ID="udf5" runat="server" Text="PayUBiz_ASP.NET_Kit"/>
        
           <asp:TextBox ID="pg" runat="server" Text="CC" />
        </asp:Panel>
    </form>

    <script>
        function togAgree() {
            var x = document.getElementById("sendNewSms");
            if (x.style.display === "none") {
                x.style.display = "block";
            } else {
                x.style.display = "none";
            }
        }
    </script>
    <script type="text/javascript">

        function myFunction() {
            var file = document.getElementById("mrk");
            var file_name = file.value;
            var extension = file_name.split('.').pop().toLowerCase();
            var size = file.files[0].size;
            var allowedFormats = ["jpeg", "jpg", "pdf", "png"];
            if (!(allowedFormats.indexOf(extension) > -1)) {
                document.getElementById("sts").innerHTML = "Your file should be JPG,PNG,PDF are allowed";
                document.getElementById("mrk").focus();
                document.getElementById("sendNewSms").disabled = true;
                return false;
            } else if ((size * 0.001) > 100) {
                document.getElementById("sts").innerHTML = "Your file should be less than 100kb";
                document.getElementById("mrk").focus();
                document.getElementById("sendNewSms").disabled = true;
                return false;
            } else {
                document.getElementById("sts").innerHTML = " ";
                document.getElementById("sendNewSms").disabled = false;
            }
        }

    </script>
</body>
    
</html>
