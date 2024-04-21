<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Project.Home" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

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
        <center><br /><br /><br /><br /><br /><br /><br />
        <div class="card" style="width:100%;height:650px;background-color:white;opacity:0.8;margin-top:-10px;overflow-x:hidden">
            <div class="row" align="left" style="background-color: lightgray;"><br /><h2 style="margin-left:3%"><strong>Disk Space Usage Details</strong></h2><br /></div>
            <div class="row" align="center">
                <br />
                <h3><strong>Pie Chart Representation of Total Unused Space and Total Rented Space</strong></h3>
            </div>
            <div align="center" class="row">                
                <div class="col-lg-1"></div>
                <div class="col-lg-4">
                    <asp:Chart ID="Chart1" runat="server" 
                        BorderlineWidth="0" Height="460px" Palette="None" PaletteCustomColors="Maroon"  
                        Width="480px" BorderlineColor="64, 0, 64">  
                        <Titles>  
                            <asp:Title ShadowOffset="10" Name="Items" />  
                        </Titles>  
                        <Legends>  
                            <asp:Legend Alignment="Center" Docking="Right" IsTextAutoFit="False" Name="Default" LegendStyle="Column" Font="20px" />  
                        </Legends>  
                        <Series>  
                            <asp:Series Name="Default" />  
                        </Series>  
                        <ChartAreas>  
                            <asp:ChartArea Name="ChartArea1" BorderWidth="0" />  
                        </ChartAreas>  
                    </asp:Chart>
                </div>
                <div class="col-lg-6">
                    <div id="divgrid" runat="server" style="margin: 0%;width:90%">
                    <br /><br />
                    <asp:GridView ID="GridView1" CssClass="gridview" runat="server" CellPadding="4" ForeColor="#333333" GridLines="Horizontal" width="100%" AutoGenerateColumns="False">       
                        <Columns>
                            <asp:BoundField DataField="SrNo" HeaderText="Sr No."  HeaderStyle-CssClass="hiddencol" ItemStyle-CssClass="hiddencol"/>
                            <asp:BoundField DataField="HardDisk" HeaderText="Hard Drive" />                                                   
                            <asp:BoundField DataField="Total Space" HeaderText="Total Space(in GB)" />                                                   
                            <asp:BoundField DataField="Storage" HeaderText="Available Space (in GB)" />                               
                            <asp:BoundField DataField="Duration" HeaderText="Duration(in Months)"/>                               
                            <asp:BoundField DataField="RentSpace" HeaderText="Rented Space" />       
                          
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

                    <br /><asp:Label ID="lbnodata" runat="server" Text="No data Available" ForeColor="#5D7B9D" Font-Bold="true" Font-Size="Large"></asp:Label>
                    </div>
                </div>
                
            </div>
        </div>
        </center>
    </div>


    
</asp:Content>
