<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="Project.Payment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="background-color:white;height:760px;margin-top:-10%">
        <br /><br /><br /><br /><br /><br /><br />
        <div align="center" class="card" style="width:100%;height:650px;background-color:white;opacity:0.8;margin-top:-10px;overflow-x:hidden">
            <div class="row" align="left" style="background-color: lightgray;"><br /><h2 style="margin-left:3%"><strong>Pay & Buy Space </strong></h2><br /></div>
            <div class="row" style="margin-top:2%">
                <div class="col-lg-2"></div>
                <div class="col-lg-3">
                    <%--<asp:Label ID="lbregno" runat="server" Text="" Visible="false"></asp:Label><br />
                    <asp:Label ID="lbamnt" runat="server" Text="" Visible="false"></asp:Label><br />--%>
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/harddisk.jpg" style="height:250px;width:320px" />
                </div>
                <div class="col-lg-5"><br />                            
                    <div class="row">
                        <div align="left" class="col-lg-4">
                            <asp:Label ID="Label2" runat="server" Text="Space(in GB) :" Font-Bold="true" Font-Size="Large" ></asp:Label>
                        </div>                       
                        <div class="col-lg-6">
                            <asp:TextBox ID="txtspace" runat="server" CssClass="form-control" TextMode="Number" PLaceHolder="Enter the space in GB" AutoPostBack="true" OnTextChanged="txtspace_TextChanged" ></asp:TextBox>                            
                        </div> 
                        <div class="col-lg-2">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7"  ValidationGroup="sreg" runat="server" ErrorMessage="" ControlToValidate="txtspace" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator> 
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div align="left" class="col-lg-4">
                            <asp:Label ID="Label7" runat="server" Text="Duration(in Months) :" Font-Bold="true" Font-Size="Large" ></asp:Label>
                        </div>
                        <div class="col-lg-6">
                            <asp:TextBox ID="txtduration" runat="server" CssClass="form-control" TextMode="Number"  PLaceHolder="Enter the Dration in Months"></asp:TextBox>
                        </div>
                        <div class="col-lg-2">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3"  ValidationGroup="sreg" runat="server" ErrorMessage="" ControlToValidate="txtduration" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator> 
                        </div>
                    </div>
                    <br />
                    <div align="left" class="row">
                        <div class="col-lg-4">
                            <asp:Label ID="Label3" runat="server" Text="Cost(in Rs.) :" Font-Bold="true" Font-Size="Large" ></asp:Label>
                        </div>
                        <div class="col-lg-8">
                            <asp:TextBox ID="txtcost" runat="server" CssClass="form-control" ReadOnly="true" PLaceHolder="The Total Cost of Disk SPace"></asp:TextBox>
                        </div>
                    </div>
                    <br />
                    <div align="left" class="row">
                        <div class="col-lg-4">
                            <asp:Label ID="Label4" runat="server" Text="Card No. :" Font-Bold="true" Font-Size="Large" ></asp:Label>
                        </div>
                        <div class="col-lg-6">
                            <asp:TextBox ID="txtcardno" runat="server" CssClass="form-control" PLaceHolder="Enter the Card No"></asp:TextBox>                            
                        </div>
                        <div class="col-lg-2">
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtcardno" ErrorMessage="Invalid Mobile No" ValidationGroup="sreg" ValidationExpression="^[a-zA-Z0-9]{11,16}$" ForeColor="Red"></asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1"  ValidationGroup="sreg" runat="server" ErrorMessage="" ControlToValidate="txtcardno" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator> 
                        </div>
                    </div>
                   
                    <div align="left" class="row">
                        <div class="col-lg-4">
                            <asp:Label ID="Label6" runat="server" Text="CVV :" Font-Bold="true" Font-Size="Large" ></asp:Label>
                        </div>
                        <div class="col-lg-6">
                            <asp:TextBox ID="txtcvv" runat="server" CssClass="form-control"  PLaceHolder="Enter the CVV"></asp:TextBox>                                                        
                        </div>
                        <div class="col-lg-2">
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtcvv" ErrorMessage="Invalid Mobile No" ValidationGroup="sreg" ValidationExpression="^[0-9]{3}$" ForeColor="Red"></asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2"  ValidationGroup="sreg" runat="server" ErrorMessage="" ControlToValidate="txtcvv" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator> 
                        </div>
                    </div>
                    <br />
                    <div align="left" class="row">
                        <div class="col-lg-2"></div>
                        <div class="col-lg-6">
                            <asp:Button ID="btnpay" runat="server" Text="Pay" ValidationGroup="sreg" CssClass="btn btn-primary btn-lg btn-block" OnClick="btnpay_Click" />
                        </div>
                        <div class="col-lg-4"></div>
                    </div>
                </div>
                <div class="col-lg-2"></div>
            </div>
        </div>
    </div>
</asp:Content>
