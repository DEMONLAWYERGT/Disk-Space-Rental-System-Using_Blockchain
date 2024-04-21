
<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Project.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="background-image:url('Images/1.jpg');background-repeat:no-repeat;background-size:cover;height:785px;margin-top:-10%">
        <center><br /><br /><br /><br /><br /><br /><br /><br /><br />
        <div class="card" style="width:65%;height:500px;background-color:white;opacity: 0.9;">
            <div class="row" style="height:100%">
                <div class="col-lg-6">
                    <br /><h3 style="margin-top: 7%;"><strong>Login to Account</strong></h3><br />
                    <h4><strong>Login with yor Email-Id and Password.</strong></h4><br />
                    <div align="left" class="row" style="width:80%;margin-left:15%">
                                                
                        <asp:TextBox ID="txtemail" runat="server" CssClass="form-control input-lg" PlaceHolder="Email ID" style="border-style:outset"></asp:TextBox>
                        <br />                                          
                        <asp:TextBox ID="txtpass" runat="server" TextMode="Password" CssClass="form-control input-lg" PlaceHolder="Password" style="border-style:outset;"></asp:TextBox>
                        <br />
                        <asp:Button ID="btnlogin" runat="server" Text="Login" CssClass="btn btn-primary btn-lg btn-block" OnClick="btnlogin_Click" />
                        <br />
                        <center><h4>New User? <a href="SignUp.aspx">SignUp Here</a></h4><br /></center>
                    </div>        
                </div>
                <div class="col-lg-6" style="height:100%;background-color:lightslategray">
                    <center>
                        <p style="margin-top:10%;color:white;font-size:xx-large"><strong>Welcome <br />
                            To Login !!!</strong></p><br />
                      <%--  <p style="color:white;font-size:medium;font-weight:bold">Login with your Credentials.</p>--%>
                    </center>
                    <br />
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/Login.jpg" Height="250px" Width="400px"  />
                </div>
            </div>
        </div>
        </center>
    </div>
</asp:Content>
