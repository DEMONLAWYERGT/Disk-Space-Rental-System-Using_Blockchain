<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="AllTransactions.aspx.cs" Inherits="Project.AllTransactions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.12.1/css/all.css" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />   
    <style type="text/css">        
        .gridview th
        {
            text-align:center;
            vertical-align:middle;
        }
        .gridview td
        {
            text-align:center;
            vertical-align:middle;
        }        

        .hiddencol
        {
             display:none;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="background-color:white;height:760px;margin-top:-10%">
        <br /><br /><br /><br /><br /><br /><br />
        <div align="center" class="card" style="width:100%;height:650px;background-color:white;opacity:0.8;margin-top:-10px;overflow-x:hidden">
            <div class="row" align="left" style="background-color: lightgray;"><br /><h2 style="margin-left:3%"><strong>Transactions</strong></h2><br /></div>
            <div style="height:540px;overflow-y:scroll"><br /><br />
                <div class="row" align="center" style="margin:0% 2% 2% 3%;width:90%">    
                    <br />                 
                    <div class="col-md-6"></div> 
                    <div class="col-md-2">
                        <asp:DropDownList ID="ddlsearch" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlsearch_SelectedIndexChanged" >
                            <asp:ListItem>Search By</asp:ListItem>
                            <asp:ListItem>User Reg No.</asp:ListItem>
                            <asp:ListItem>Date</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-3" align="right">
                        <asp:TextBox ID="txtsearch" runat="server" CssClass="form-control" Placeholder="Search by Space"></asp:TextBox>
                    </div>
                    <div class="col-md-1" align="left">
                        <asp:LinkButton ID="lbtnsearch" runat="server" CssClass="btn btn-primary" OnClick="lbtnsearch_Click"><span class="glyphicon glyphicon-search" style="color:white"></span></asp:LinkButton>
                    </div>                    
                </div>
                <div align="center" id="gridDiv" runat="server" style="margin: 1% 2% 2% 6%;;width:85%">
                    <asp:GridView ID="GridView1" CssClass="gridview" runat="server" CellPadding="4" ForeColor="#333333" GridLines="Horizontal" width="100%" AutoGenerateColumns="False">       
                        <Columns>
                            <asp:BoundField DataField="SrNo" HeaderText="Sr No." />
                            <asp:BoundField DataField="RegNo" HeaderText="RegNo" HeaderStyle-CssClass="hiddencol" ItemStyle-CssClass="hiddencol"/>                                                   
                            <asp:BoundField DataField="Space" HeaderText="Storage Space (in GB)" />                               
                            <asp:BoundField DataField="Duration" HeaderText="Duration"/>                               
                            <asp:BoundField DataField="Cost" HeaderText="Cost(in Rs.)" />     
                            <asp:BoundField DataField="CardNo" HeaderText="Card No." />     
                            <asp:BoundField DataField="CVV" HeaderText="CVV" />     
                            <asp:BoundField DataField="Datetime" HeaderText="Date" />                               
                            <asp:BoundField DataField="isManipulated" HeaderText="isManipulated" />                               
                                                      
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnviewUser" runat="server" class="btn btn-info" Font-Size="Medium" OnClick="lbtnviewUser_Click" >User Details</asp:LinkButton>
                                </ItemTemplate>                  
                            </asp:TemplateField>

                        </Columns>
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" Height="45px" Font-Size="Larger"/>
                        <PagerStyle BackColor="#284775" ForeColor="White" />
                        <RowStyle BackColor="white" ForeColor="#333333" Height="50px" Font-Size="Medium"/>
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                    </asp:GridView>
                </div>
                <br /><asp:Label ID="lbnodata" runat="server" Text="No data Available" ForeColor="#5D7B9D" Font-Bold="true" Font-Size="X-Large"></asp:Label>
            </div>

        </div>
    </div>


    <!--View Modal -->
    <div id="viewModal" class="modal fade" role="dialog">
      <div class="modal-dialog modal-lg">

        <!-- Modal content-->
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title">User Details</h4>
          </div>
          <div class="modal-body">
            <div class="media">
              <div class="media-left media-top">
                  <asp:Image ID="imgPhoto" runat="server" ImageUrl="~/Images/profile.png" class="media-object" style="width:150px;height:150px"/>
              </div>
              <div class="media-body">
                <div class="row">
                    <div class="col-lg-1"></div>
                    <div class="col-lg-3">
                        <asp:Label ID="Label4" runat="server" Text="Reg No. :" Font-Size="Medium" Font-Bold="true"></asp:Label>
                    </div>
                    <div class="col-lg-6">
                        <asp:Label ID="lbregno" runat="server" Text="" Font-Size="Medium" Font-Bold="true"></asp:Label>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-lg-1"></div>
                    <div class="col-lg-3">
                        <asp:Label ID="Label10" runat="server" Text="Name :" Font-Size="Medium" Font-Bold="true"></asp:Label>
                    </div>
                    <div class="col-lg-6">
                        <asp:Label ID="lbname" runat="server" Text="" Font-Size="Medium" Font-Bold="true"></asp:Label>
                    </div>
                </div>
                
                <br />
                <div class="row">
                    <div class="col-lg-1"></div>
                    <div class="col-lg-3">
                        <asp:Label ID="Label12" runat="server" Text="Mobile No. :" Font-Size="Medium" Font-Bold="true"></asp:Label>
                    </div>
                    <div class="col-lg-6">
                        <asp:Label ID="lbmobno" runat="server" Text="" Font-Size="Medium" Font-Bold="true"></asp:Label>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-lg-1"></div>
                    <div class="col-lg-3">
                        <asp:Label ID="Label13" runat="server" Text="Email Id :" Font-Size="Medium" Font-Bold="true"></asp:Label>
                    </div>
                    <div class="col-lg-6">
                        <asp:Label ID="lbemail" runat="server" Text="" Font-Size="Medium" Font-Bold="true"></asp:Label>
                    </div>
                </div>
                <br />
               
              </div>
            </div>
          </div>
          <div class="modal-footer"></div>
        </div>

      </div>
    </div>

</asp:Content>
