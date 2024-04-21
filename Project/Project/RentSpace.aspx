<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="RentSpace.aspx.cs" Inherits="Project.RentSpace" %>

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
            <div class="row" align="left" style="background-color: lightgray;"><br /><h2 style="margin-left:3%"><strong>Rent Disk Space</strong></h2><br /></div>
                <div style="height:540px;overflow-y:scroll"><br /><br />
                    <div class="row" align="center" style="margin:0% 2% 2% 3%;width:90%">    
                    <br />
                    <div class="col-md-2">
                        <asp:LinkButton ID="lbtnnew" runat="server" CssClass="btn btn-success" Font-Size="Large" OnClick="lbtnnew_Click"><i class="fa fa-solid fa-plus" style="color:white; font-size:medium; font-weight:bold"></i>  Add </asp:LinkButton>
                    </div>
                    <div class="col-md-4"></div> 
                    <div class="col-md-2">
                        <asp:DropDownList ID="ddlsearch" runat="server" CssClass="form-control" >
                            <asp:ListItem>Search By</asp:ListItem>
                            <asp:ListItem>Name</asp:ListItem>
                            <asp:ListItem>Course</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-3" align="right">
                        <asp:TextBox ID="txtsearch" runat="server" CssClass="form-control" Placeholder="Search by Name"></asp:TextBox>
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
                            <asp:BoundField DataField="HardDisk" HeaderText="Hard Drive" />                               
                            <asp:BoundField DataField="Storage" HeaderText="Storage Space (in GB)" />                               
                            <asp:BoundField DataField="Duration" HeaderText="Duration (in Months)" />                               
                            <asp:BoundField DataField="Date" HeaderText="Date" />                               
                            <asp:BoundField DataField="Status" HeaderText="Approval Status" />                               

                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnedit" runat="server" class="btn btn-warning" Font-Size="Medium" OnClick="lbtnedit_Click"><i class="fas fa-edit" style="color:white; font-size:medium; font-weight:bold"></i></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>                         

                           <%-- <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnview" runat="server" class="btn btn-info" Font-Size="Medium" OnClick="lbtnview_Click" ><i class="fa fa-eye" style="color:white; font-size:medium; font-weight:bold"></i></asp:LinkButton>
                                </ItemTemplate>                  
                            </asp:TemplateField>--%>

                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtndelete" runat="server" class="btn btn-danger" Font-Size="Medium"  CausesValidation="false" OnCommand="lbtndelete_Command"  OnClientClick="return confirm('Are you sure to delete this data?');" CommandArgument="delete"><i class="fa fa-trash-o" style="color:white; font-size:medium; font-weight:bold"></i></asp:LinkButton>
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

    <!-- Modal -->
    <div id="manageModal" class="modal fade" role="dialog">
      <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title">Rental Hard Disk Details</h4>
              <asp:Label ID="lbsr" runat="server" Text="" Visible="false"></asp:Label>
          </div>
          <div align="center" class="modal-body">
              <div align="left" style="width:60%">
                   <div class="row">
                        <asp:Label ID="Label3" runat="server" Text="Hard Drive :" Font-Size="Medium" Font-Bold="true"></asp:Label>
                        <asp:TextBox ID="txthd" runat="server" CssClass="form-control" style="border-style:outset;" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1"  ValidationGroup="sreg" runat="server" ErrorMessage="" ControlToValidate="txthd" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator> 
                    </div>
                    <br />
                    <div class="row">
                        <asp:Label ID="Label1" runat="server" Text="Storage Space (in GB) :" Font-Size="Medium" Font-Bold="true"></asp:Label>
                        <asp:TextBox ID="txtstorage" runat="server" CssClass="form-control" TextMode="Number" style="border-style:outset;" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2"  ValidationGroup="sreg" runat="server" ErrorMessage="" ControlToValidate="txtstorage" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator> 
                    </div>
                    <br />
                    <div class="row">
                        <asp:Label ID="Label2" runat="server" Text="Duration (in Month) :" Font-Size="Medium" Font-Bold="true"></asp:Label>
                        <asp:TextBox ID="txtduration" runat="server" CssClass="form-control" TextMode="Number" style="border-style:outset;" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3"  ValidationGroup="sreg" runat="server" ErrorMessage="" ControlToValidate="txtduration" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator> 
                    </div>
                    <br />
              </div>           
          </div>
          <div class="modal-footer">
              <asp:Button ID="btnadd" runat="server" Text="Add" CssClass="btn btn-success btn-lg" OnClick="btnadd_Click" />
              <asp:Button ID="btnupdate" runat="server" Text="Update" CssClass="btn btn-primary btn-lg" Visible="false" OnClick="btnupdate_Click"/>
          </div>
        </div>

      </div>
    </div>
</asp:Content>
