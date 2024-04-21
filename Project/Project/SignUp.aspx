<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="Project.SignUp" %>
    
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="background-image:url('Images/1.jpg');background-repeat:no-repeat;background-size:cover;height:785px;margin-top:-10%">
        <center><br /><br /><br /><br /><br /><br /><br /><br /><br />
        <div class="card" style="width:65%;height:550px;background-color:white;opacity:0.9">
            <div class="row" style="height:100%">
                <div class="col-lg-6">
                    <br /><h3 style="margin-top: 1%;"><strong>Sign Up Here</strong></h3><br /><br />
                    <div align="left" style="width:70%;margin-left:15%">
                        <div class="row">
                            <asp:Label ID="Label3" runat="server" Text="Full Name :" Font-Size="Medium" Font-Bold="true"></asp:Label>
                            <asp:TextBox ID="txtname" runat="server" CssClass="form-control" style="border-style:outset;" ></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2"  ValidationGroup="sreg" runat="server" ErrorMessage="" ControlToValidate="txtname" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator> 
                        </div>
                        <br />
                        <div class="row">
                            <asp:Label ID="Label4" runat="server" Text="Mobile No. :" Font-Size="Medium" Font-Bold="true"></asp:Label>
                            <asp:TextBox ID="txtmobno" runat="server" CssClass="form-control" style="border-style:outset;" ></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4"  ValidationGroup="sreg" runat="server" ErrorMessage="" ControlToValidate="txtmobno" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtmobno" ErrorMessage="Invalid Mobile No" ValidationGroup="sreg" ValidationExpression="^[7-9][0-9]{9}$" ForeColor="Red"></asp:RegularExpressionValidator>
                        </div>    
                        <div class="row">
                            <asp:Label ID="Label6" runat="server" Text="Email Id :" Font-Size="Medium" Font-Bold="true"></asp:Label>
                            <asp:TextBox ID="txtemail" runat="server" CssClass="form-control" style="border-style:outset;" ></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1"  ValidationGroup="sreg" runat="server" ErrorMessage="" ControlToValidate="txtemail" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtemail" ErrorMessage="Invalid Email ID" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"  ForeColor="Red" ValidationGroup="sreg" ></asp:RegularExpressionValidator>
                        </div>
                        <%--<div class="row">                   
                            <asp:Label ID="Label8" runat="server" Text="Total Hard Disk Space (in GB) :" Font-Size="Medium" Font-Bold="true"></asp:Label>
                            <asp:TextBox ID="txttrntspace" runat="server" CssClass="form-control" style="border-style:outset;"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7"  ValidationGroup="sreg" runat="server" ErrorMessage="" ControlToValidate="txttrntspace" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>                                                            
                        </div>              
                        <br />--%>
                        <div class="row">                    
                            <asp:Label ID="Label7" runat="server" Text="Password :" Font-Size="Medium" Font-Bold="true"></asp:Label>
                            <asp:TextBox ID="txtpassword" runat="server" CssClass="form-control" style="border-style:outset;" ></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6"  ValidationGroup="sreg" runat="server" ErrorMessage="" ControlToValidate="txtpassword" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </div>
                        <br /><br />
                        <div class="row">
                            <asp:Button ID="btnsignup" runat="server" Text="Sign Up" ValidationGroup="sreg"  CssClass="btn btn-primary btn-lg btn-block" style="border-radius:10px" OnClick="btnsignup_Click" />
                        </div>                   
                    </div>        
                </div>
                
                <div class="col-lg-6" style="height:550px;background-color:lightslategray">
                    <center>
                        <p style="color:white;font-size:xx-large;font-weight:bolder;margin-top: 33%;"><strong>Create<br />
                            Account!!!</strong></p><br />
                       <p style="color:white;font-size:medium;font-weight:bold">SignUp here to continue.</p>
                    </center>
                    <br />
                   
                </div>
            </div>
        </div>
        </center>
    </div>
</asp:Content>
