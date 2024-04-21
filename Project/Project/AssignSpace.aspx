<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="AssignSpace.aspx.cs" Inherits="Project.AssignSpace" %>

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
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script type="text/javascript">
    $(function () {
        $("[id*=GridView1] input[type=checkbox]").click(function () {
            if ($(this).is(":checked")) {
                $("[id*=GridView1] input[type=checkbox]").removeAttr("checked");
                $(this).attr("checked", "checked");
            }
        });
    });
</script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="background-color:white;height:760px;margin-top:-10%">
        <br /><br /><br /><br /><br /><br /><br />
        <div align="center" class="card" style="width:100%;height:650px;background-color:white;opacity:0.8;margin-top:-10px;overflow-x:hidden">
            <div class="row" align="left" style="background-color: lightgray;"><br /><h2 style="margin-left:3%"><strong>Assign Space to User </strong></h2><br /></div>
            <h3><strong>Available Disks Space</strong></h3><br />                                                                      
            <br />
            <div align="left" class="row">                    
                <div class="col-lg-1"></div>
                <div class="col-lg-5">
                    <asp:GridView ID="GridView1" CssClass="gridview" runat="server" CellPadding="4" ForeColor="#333333" GridLines="Horizontal" width="100%" AutoGenerateColumns="False">       
                        <Columns>
                            <asp:BoundField DataField="SrNo" HeaderText="Sr No." />
                            <asp:BoundField DataField="RegNo" HeaderText="RegNo" HeaderStyle-CssClass="hiddencol" ItemStyle-CssClass="hiddencol"/>
                            <asp:BoundField DataField="HardDisk" HeaderText="Hard Drive" />                               
                            <asp:BoundField DataField="Storage" HeaderText="Storage Space (in GB)" />                               
                            <asp:BoundField DataField="Duration" HeaderText="Duration (in Months)" />                               
                            <asp:BoundField DataField="Date" HeaderText="Date" HeaderStyle-CssClass="hiddencol" ItemStyle-CssClass="hiddencol"/>                               
                            <asp:BoundField DataField="Status" HeaderText="Approval Status" HeaderStyle-CssClass="hiddencol" ItemStyle-CssClass="hiddencol"/>                               

                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkbSelect" runat="server"  CssClass="form-control" Width="60px"/>                            
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
                <div align="center" class="col-lg-5">
                   
                    <div align="center" class="row">
                        <div class="col-lg-4"></div>
                        <div class="col-lg-4">
                            <asp:Label ID="Label5" runat="server" Text="Required Space :" Font-Bold="true" Font-Size="Large" ></asp:Label>                     
                            <asp:Label ID="lbreqspace" runat="server" Text="" Font-Bold="true" Font-Size="Large" ></asp:Label><br />
                        </div>
                        <div class="col-lg-4">
                            <asp:HiddenField ID="hdfspace" runat="server" Value="0" />
                        </div>                        
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-lg-2"></div>
                        <div class="col-lg-4">
                            <asp:Label ID="Label2" runat="server" Text="Space(in GB) :" Font-Bold="true" Font-Size="Large" ></asp:Label>
                        </div>                       
                        <div class="col-lg-6">
                            <asp:TextBox ID="txtspace" runat="server" CssClass="form-control" TextMode="Number" PLaceHolder="Enter the space in GB"></asp:TextBox>                            
                        </div> 
                    </div>
                    <br />
                    <div class="row">                        
                        <div class="col-lg-4">
                            <asp:Label ID="lbgetspace" runat="server" Text="" Visible="false"></asp:Label>
                        </div>
                        <div align="center" class="col-lg-4">
                            <asp:Button ID="btngetspace" runat="server" Text="Get Space" CssClass="btn btn-warning btn-lg" OnClick="btngetspace_Click" />
                        </div>
                        <div class="col-lg-4"></div>
                    </div>
                    <br />
                    <div align="center" class="row">
                        <div class="col-lg-4"></div>
                        <div class="col-lg-4">
                            <asp:Label ID="Label1" runat="server" Text="Assigned Space :" Font-Bold="true" Font-Size="Large" ></asp:Label>                     
                            <asp:Label ID="lbasgnsp" runat="server" Text="" Font-Bold="true" Font-Size="Large" ></asp:Label><br />
                        </div>
                        <div class="col-lg-4">
                            <asp:HiddenField ID="HiddenField1" runat="server" Value="0" />
                        </div>                        
                    </div>
                    <br /><br />
                    <div align="center" class="row">
                        <div class="col-lg-4"></div>
                        <div class="col-lg-4">
                            <asp:Button ID="btnassign" runat="server" Text="Assign Space" Visible="false" CssClass="btn btn-primary btn-lg btn-block" OnClick="btnassign_Click"/>                        
                        </div>
                        <div class="col-lg-4"></div>
                            
                    </div>
                </div>
                <div class="col-lg-1"></div>
            </div>
        </div>
    </div>
</asp:Content>
