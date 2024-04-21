<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="ChngPassword.aspx.cs" Inherits="Project.ChngPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="background-color:white;height:760px;margin-top:-10%">
        <br /><br /><br /><br /><br /><br /><br />
        <div align="left" class="card" style="width:100%;height:650px;background-color:white;opacity:0.8;margin-top:-10px;overflow-x:hidden">
            <div class="row" align="left" style="background-color: lightgray;"><br /><h2 style="margin-left:3%"><strong>Change Password</strong></h2><br /></div><br /><br />
            <br />
            <div class="row">
                <div align="center" class="col-lg-4"></div>
                <div align="left" class="col-lg-4" style="background-color:lightgray">
                    <div style="margin:8%">
                        <div class="row">                                
                            <asp:Label ID="Label3" runat="server" Text="Reg. No. :" Font-Size="Medium" Font-Bold="true"></asp:Label>&nbsp;&nbsp;                                
                            <asp:Label ID="lbregno" runat="server" Text="" Font-Size="Medium" Font-Bold="true"></asp:Label>                                
                        </div>
                        <br /><br />
                        <div class="row">
                            <asp:Label ID="Label1" runat="server" Text="New Password :" Font-Size="Medium" Font-Bold="true"></asp:Label>                                                                
                            <asp:TextBox ID="txtnewpass" runat="server" CssClass="form-control input-lg"  TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1"  ValidationGroup="check1" runat="server" ErrorMessage="" ControlToValidate="txtnewpass" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>                                
                        </div>
                        <br />
                        <div class="row">                               
                            <asp:Label ID="Label2" runat="server" Text="Confirm Password :" Font-Size="Medium" Font-Bold="true"></asp:Label>                               
                            <asp:TextBox ID="txtconfpass" runat="server" CssClass="form-control input-lg" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2"  ValidationGroup="check1" runat="server" ErrorMessage="" ControlToValidate="txtconfpass" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password Not match" ControlToCompare="txtnewpass" ControlToValidate="txtconfpass"></asp:CompareValidator>                                
                        </div>
                        <br />
                        <div class="row" align="center">
                            <asp:Button ID="btnchngpass" runat="server" Text="Change Password" Font-Size="Large" ValidationGroup="check1" CssClass="btn btn-primary" OnClick="btnchngpass_Click" />
                        </div>
                    </div>
                    <br />
                </div>
                <div align="center" class="col-lg-4"></div>
            </div>
        </div>
    </div>
</asp:Content>
