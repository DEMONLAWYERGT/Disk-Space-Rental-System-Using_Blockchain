<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="Project.Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="background-color:white;height:760px;margin-top:-10%">
        <br /><br /><br /><br /><br /><br /><br />
        <div align="left" class="card" style="width:100%;height:650px;background-color:white;opacity:0.8;margin-top:-10px;overflow-x:hidden">
            <div class="row" align="left" style="background-color: lightgray;"><br /><h2 style="margin-left:3%"><strong>Profile</strong></h2><br /></div><br /><br />
            <div class="row">
                <div align="center" class="col-lg-2"></div>
                <div align="center" class="col-lg-4">
                    <br /><h3><strong>Set Profile Photo</strong></h3><br />                   
                    <asp:Image ID="imgPhoto" runat="server" Height="145px" Width="200px" ImageUrl="~/Images/profile.png" /><br /><br />               
                    <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" Width="300px"/><br />               
                    <asp:LinkButton ID="lbtnupload" runat="server" CssClass="btn btn-primary btn-lg" OnClick="lbtnupload_Click"><i class="fa-solid fa-upload" style="font-size:medium;color:white"></i> Upload</asp:LinkButton>                
                </div>
                <div align="left" class="col-lg-4">
                   <br /><br />
                    <div class="row">                       
                        <asp:Label ID="Label1" runat="server" Text="Reg No :" Font-Size="Medium" Font-Bold="true"></asp:Label>                       
                        <asp:Label ID="lbregno" runat="server" Text="" Font-Size="Medium" Font-Bold="true"></asp:Label>                                                             
                    </div> 
                    <br />
                    <div class="row">
                        <asp:Label ID="Label3" runat="server" Text="Name :" Font-Size="Medium" Font-Bold="true"></asp:Label>
                        <asp:TextBox ID="txtname" runat="server" CssClass="form-control" ReadOnly="true" style="border-style:outset;" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2"  ValidationGroup="sreg" runat="server" ErrorMessage="" ControlToValidate="txtname" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator> 
                    </div>
                    <br />
                    <div class="row">
                        <asp:Label ID="Label4" runat="server" Text="Mobile No. :" Font-Size="Medium" Font-Bold="true"></asp:Label>
                        <asp:TextBox ID="txtmobno" runat="server" CssClass="form-control" ReadOnly="true" style="border-style:outset;" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4"  ValidationGroup="sreg" runat="server" ErrorMessage="" ControlToValidate="txtmobno" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtmobno" ErrorMessage="Invalid Mobile No" ValidationGroup="sreg" ValidationExpression="^[7-9][0-9]{9}$" ForeColor="Red"></asp:RegularExpressionValidator>
                    </div>    
                    <div class="row">
                        <asp:Label ID="Label6" runat="server" Text="Email Id :" Font-Size="Medium" Font-Bold="true"></asp:Label>
                        <asp:TextBox ID="txtemail" runat="server" CssClass="form-control" ReadOnly="true" style="border-style:outset;" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1"  ValidationGroup="sreg" runat="server" ErrorMessage="" ControlToValidate="txtemail" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtemail" ErrorMessage="Invalid Email ID" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"  ForeColor="Red" ValidationGroup="sreg" ></asp:RegularExpressionValidator>
                    </div>
                    <div class="row">                        
                        <asp:LinkButton ID="lbtnedit" runat="server" class="btn btn-warning  btn-lg btn-block"  OnClick="lbtnedit_Click"><i class="fas fa-edit" style="color:white; font-size:medium; font-weight:bold"></i> Edit</asp:LinkButton>
                        <asp:Button ID="btnupdate" runat="server" Text="Update" Visible="false" CssClass="btn btn-primary btn-lg btn-block" ValidationGroup="sreg" UseSubmitBehavior="false" OnClick="btnupdate_Click"/>                        
                    </div>
                    <br />                    
                </div>
                <div class="col-lg-2"></div>
            </div> 
            
        </div>
        
    </div>
</asp:Content>
