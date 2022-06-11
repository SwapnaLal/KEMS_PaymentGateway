<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UnSuccessPage.aspx.cs" Inherits="Pages_UnSuccessPage_aspx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
      <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
<style type="text/css">

    body
    {
        background:#f2f2f2;
    }

    .payment
	{
		border:1px solid #f2f2f2;
		height:300px;
        border-radius:20px;
        background:#fff;
	}
   .payment_header
   {
	   background:#8f0409;
	   padding:20px;
       border-radius:20px 20px 0px 0px;
	   
   }
   
   .check
   {
	   margin:0px auto;
	   width:50px;
	   height:50px;
	   border-radius:100%;
	   background:#fff;
	   text-align:center;
       transition: transform .2s;

   }
    .check:hover {
        -ms-transform: scale(1.5); /* IE 9 */
        -webkit-transform: scale(1.5); /* Safari 3-8 */
        transform: scale(1.5);
    }
   
   .check i
   {
	   vertical-align:middle;
	   line-height:50px;
	   font-size:30px;

   }

    .content 
    {
        text-align:center;
    }

    .content  h1
    {
        font-size:25px;
        padding-top:25px;
    }

    .content a
    {
        width:200px;
        height:35px;
        color:#fff;
        border-radius:30px;
        padding:5px 10px;
        background:#8f0409;
        transition:all ease-in-out 0.3s;
    }

    .content a:hover
    {
        text-decoration:none;
        background:#000;
    }
 


</style>
    <script>
        window.addEventListener("load", function () {
            setTimeout(
                function open(event) {
                    document.querySelector(".check").style.
                        display = "block";
                },
                1000
            )
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
              <div class="container">
   <div class="row">
      <div class="col-md-6 mx-auto mt-5">
         <div class="payment">
            <div class="payment_header">
               <div class="check"><i class="fa fa-close" aria-hidden="true"></i></div>
            </div>
            <div class="content">
               <h1>Payment UnSuccess !</h1>
               <p>Payment Verification Failed.... </p><br />
                <span style="color:red;">Payment Id-</span><asp:Label ID="lblPayment" runat="server"></asp:Label><br />
               <a href="StudAdmission.aspx">Go to Home</a>
            </div>
            
         </div>
      </div>
   </div>
</div>
        </div>
    </form>
</body>
</html>
