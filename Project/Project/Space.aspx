<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Space.aspx.cs" Inherits="Project.Space" %>

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
        <div class="row" align="left" style="background-color: lightgray;"><br /><h2 style="margin-left:3%"><strong>Buy Disk Space</strong></h2><br /></div>
        <div align="center" style="height:550px;overflow-y:scroll"><br />            
            <ul class="nav nav-tabs">
                <li class="active"><a data-toggle="tab" href="#ApprovalDiv">Rent Requests Approval</a></li>
                <li><a data-toggle="tab" href="#BuyDiv">Buy Requests Assign</a></li>               
                <li><a data-toggle="tab" href="#hdriveDiv">Available Spaces</a></li>               
            </ul>

            <div class="tab-content">
                <div id="ApprovalDiv" class="tab-pane fade in active">
                    <h3><strong>Rent Requests</strong></h3><br />
                    <div class="row" align="center" style="margin:0% 2% 2% 3%;width:90%"><br />           
                        <div class="col-md-6"></div> 
                        <div class="col-md-2">
                            <asp:DropDownList ID="ddlsearch" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlsearch_SelectedIndexChanged">
                                <asp:ListItem>Select</asp:ListItem>
                                <asp:ListItem>Storage Space</asp:ListItem>
                                <asp:ListItem>Duration</asp:ListItem>
                            </asp:DropDownList>
                        </div> 
                        <div class="col-md-3" align="right">
                            <asp:TextBox ID="txtsearch" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                        </div>
                        <div class="col-md-1" align="left">
                            <asp:LinkButton ID="lbtnsearch" runat="server" CssClass="btn btn-primary" OnClick="lbtnsearch_Click"><span class="glyphicon glyphicon-search" style="color:white"></span></asp:LinkButton>
                        </div>                    
                    </div>
                    <div align="center" id="gridDiv" runat="server" style="margin: 1% 2% 2% 6%;width:80%">
                        <asp:GridView ID="GridView1" CssClass="gridview" runat="server" CellPadding="4" ForeColor="#333333" GridLines="Horizontal" width="100%" AutoGenerateColumns="False">       
                            <Columns>
                                <asp:BoundField DataField="SrNo" HeaderText="Sr No." />
                                <asp:BoundField DataField="RegNo" HeaderText="RegNo" HeaderStyle-CssClass="hiddencol" ItemStyle-CssClass="hiddencol"/>                                                           
                                <asp:BoundField DataField="Storage" HeaderText="Storage Space (in GB)" />                               
                                <asp:BoundField DataField="Duration" HeaderText="Duration (in Months)" />                               
                                <asp:BoundField DataField="Date" HeaderText="Date" />                               
                                <asp:BoundField DataField="Status" HeaderText="Approval Status" />                               

                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <div class="row">
                                            <div class="col-lg-5">
                                                <asp:LinkButton ID="lbtnaccept" runat="server" class="btn btn-success" Visible='<%#Eval("Status").ToString() == "Rejected"?false:true %>' Font-Size="Medium"  CausesValidation="false" OnCommand="lbtnaccept_Command"  OnClientClick="return confirm('Are you sure to accept this request?');" CommandArgument="accept">Accept</asp:LinkButton>
                                            </div>
                                            <div class="col-lg-5">
                                                <asp:LinkButton ID="lbtnreject" runat="server" class="btn btn-danger" Font-Size="Medium" Visible='<%#Eval("Status").ToString() == "Rejected"?false:true %>' CausesValidation="false" OnCommand="lbtnreject_Command"  OnClientClick="return confirm('Are you sure to reject this request?');" CommandArgument="reject">Reject</asp:LinkButton>
                                            </div>
                                        </div>                                
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

                <!--Accpted Requests Tab-->
                <div id="BuyDiv" class="tab-pane fade">
                    <asp:ScriptManager runat="server"></asp:ScriptManager>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <h3><strong>Rent Requests</strong></h3><br />
                            <div class="row" align="center" style="margin:0% 2% 2% 3%;width:90%"><br />           
                                <div class="col-md-6"></div>   
                                <div class="col-md-2">
                                    <asp:DropDownList ID="ddlsearch1" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlsearch1_SelectedIndexChanged">
                                        <asp:ListItem>Select</asp:ListItem>
                                        <asp:ListItem>Storage Space</asp:ListItem>
                                        <asp:ListItem>Duration</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="col-md-3" align="right">
                                    <asp:TextBox ID="txtsearch1" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                                </div>
                                <div class="col-md-1" align="left">
                                    <asp:LinkButton ID="lbtnsearch1" runat="server" CssClass="btn btn-primary" OnClick="lbtnsearch1_Click"><span class="glyphicon glyphicon-search" style="color:white"></span></asp:LinkButton>
                                </div>                    
                            </div>   
                            <div id="grid2Div" runat="server" style="margin: 1% 2% 2% 6%;width:80%">
                                <asp:GridView ID="GridView2" CssClass="gridview" runat="server" CellPadding="4" ForeColor="#333333" GridLines="Horizontal" width="100%" AutoGenerateColumns="False">       
                                    <Columns>
                                        <asp:BoundField DataField="SrNo" HeaderText="Sr No." />
                                        <asp:BoundField DataField="RegNo" HeaderText="RegNo" HeaderStyle-CssClass="hiddencol" ItemStyle-CssClass="hiddencol"/>                                                   
                                        <asp:BoundField DataField="Space" HeaderText="Storage Space (in GB)" />                               
                                        <asp:BoundField DataField="Duration" HeaderText="Duration"/>                               
                                        <asp:BoundField DataField="Cost" HeaderText="Cost(in Rs.)" />     
                                        <asp:BoundField DataField="CardNo" HeaderText="Card No." />     
                                        <asp:BoundField DataField="CVV" HeaderText="CVV" />     
                                        <asp:BoundField DataField="Status" HeaderText="Space Status" HeaderStyle-CssClass="hiddencol" ItemStyle-CssClass="hiddencol"/>     
                                        <asp:BoundField DataField="Datetime" HeaderText="Date" HeaderStyle-CssClass="hiddencol" ItemStyle-CssClass="hiddencol" />     
                                        
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbtnassign" runat="server" class="btn btn-info" Font-Size="Medium" OnClick="lbtnassign_Click" >Assign Space</asp:LinkButton>
                                            </ItemTemplate>                  
                                        </asp:TemplateField>
                                    </Columns>
                                    <EditRowStyle BackColor="#999999" />
                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"  Font-Size="Large"  Height="45px" />
                                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                    <RowStyle BackColor="white" ForeColor="#333333" Height="50px" Font-Size="Medium" />
                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                                 </asp:GridView>
                             </div>
                             <br /><asp:Label ID="lbanodata" runat="server" Text="No data Available" ForeColor="#5D7B9D" Font-Bold="true" Font-Size="Large"></asp:Label>
                            <center>
                      
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                
                <!--Available Hard Drives Tab-->
                <div id="hdriveDiv" class="tab-pane fade">
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <div id="divgrid" runat="server" style="margin: 1% 2% 2% 6%;width:90%">
                                <h3><strong>Hard Drives Spaces</strong></h3><br />
                                <asp:GridView ID="GridView3" CssClass="gridview" runat="server" CellPadding="4" ForeColor="#333333" GridLines="Horizontal" width="100%" AutoGenerateColumns="False">       
                                    <Columns>
                                        <asp:BoundField DataField="SrNo" HeaderText="Sr No." />
                                        <asp:BoundField DataField="HardDisk" HeaderText="RegNo" HeaderStyle-CssClass="hiddencol" ItemStyle-CssClass="hiddencol"/>                                                   
                                        <asp:BoundField DataField="Total Space" HeaderText="Total Space (in GB)" />                               
                                        <asp:BoundField DataField="Storage" HeaderText="Available Space (in GB)" />                               
                                        <asp:BoundField DataField="Duration" HeaderText="Duration(in Months)"/>                               
                                        <asp:BoundField DataField="RentSpace" HeaderText="Rented Space" />     
                                        <asp:BoundField DataField="RegNo" HeaderText="User Reg No." />     
                                        <asp:BoundField DataField="Name" HeaderText="User Name" />     
                                        <asp:BoundField DataField="Status" HeaderText="Space Status" HeaderStyle-CssClass="hiddencol" ItemStyle-CssClass="hiddencol"/>     
                                        <asp:BoundField DataField="Date" HeaderText="Date" HeaderStyle-CssClass="hiddencol" ItemStyle-CssClass="hiddencol" />     
                                        
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbtnrntdetails" runat="server" class="btn btn-info" Font-Size="Medium" OnClick="lbtnrntdetails_Click" >View Rent Details</asp:LinkButton>
                                            </ItemTemplate>                  
                                        </asp:TemplateField>
                                    </Columns>
                                    <EditRowStyle BackColor="#999999" />
                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"  Font-Size="Large"  Height="45px" />
                                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                    <RowStyle BackColor="white" ForeColor="#333333" Height="50px" Font-Size="Medium" />
                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                                 </asp:GridView>

                                <br /><asp:Label ID="lbndata" runat="server" Text="No data Available" ForeColor="#5D7B9D" Font-Bold="true" Font-Size="Large"></asp:Label>
                             </div>
                             <div id="hdrentDiv" runat="server" style="margin: 1% 2% 2% 6%;width:80%" visible="false">
                                 <div class="row">
                                     <div class="col-lg-1">
                                         <asp:LinkButton ID="lbtnBack" runat="server" OnClick="lbtnBack_Click"><i class="fa fa-solid fa-circle-left" style="font-size:x-large;"></i></asp:LinkButton>
                                     </div>
                                     <div class="col-lg-2"></div>
                                     <div class="col-lg-4">
                                         <h3><strong>Hard Drives Spaces</strong></h3>
                                     </div>
                                     <div class="col-lg-5"></div>
                                 </div>
                                 <br />
                                 <asp:GridView ID="GridView4" CssClass="gridview" runat="server" CellPadding="4" ForeColor="#333333" GridLines="Horizontal" width="100%" AutoGenerateColumns="False">       
                                    <Columns>
                                        <asp:BoundField DataField="SrNo" HeaderText="Sr No." />
                                        <asp:BoundField DataField="RentUser" HeaderText="User Reg No." />     
                                        <asp:BoundField DataField="Name" HeaderText="User Name" />  
                                        <asp:BoundField DataField="RentSpace" HeaderText="Space(in GB)" />                               
                                        <asp:BoundField DataField="RentDuration" HeaderText="Duration(in Months)"/>                                                                          
                                        <asp:BoundField DataField="StartDate" HeaderText="Start Date" />     
                                        <asp:BoundField DataField="EndDate" HeaderText="End Date" />     
                                    
                                    </Columns>
                                    <EditRowStyle BackColor="#999999" />
                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"  Font-Size="Large"  Height="45px" />
                                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                    <RowStyle BackColor="white" ForeColor="#333333" Height="50px" Font-Size="Medium" />
                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                                 </asp:GridView>
                                 <br /><asp:Label ID="lbnorent" runat="server" Text="No data Available" ForeColor="#5D7B9D" Font-Bold="true" Font-Size="Large"></asp:Label>
                             </div>
                            
                      
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>



            </div>
        </div>      
    </div>
    </div>
</asp:Content>
