<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="BuySpace.aspx.cs" Inherits="Project.BuySpace" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        function buy(srno) {
            $("#<%=hdf_Srno.ClientID%>").val(srno);
            $("#<%=lbtnbuy.ClientID%>").click();
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="background-color:white;height:760px;margin-top:-10%">
    <br /><br /><br /><br /><br /><br /><br />
    <div align="center" class="card" style="width:100%;height:650px;background-color:white;opacity:0.8;margin-top:-10px;overflow-x:hidden">
        <div class="row" align="left" style="background-color: lightgray;"><br /><h2 style="margin-left:3%"><strong>Disk Space Plans</strong></h2><br /></div>
        <div align="center" style="height:540px;overflow-y:scroll"><br /><br />
       
            <div id="contentDiv" runat="server" style="width: 98%;"></div>

            <asp:HiddenField ID="hdf_Srno" runat="server" />
            <asp:Button ID="lbtnbuy" runat="server" Text="Button" OnClick="lbtnbuy_Click"  style="display:none" />
                
            <asp:Label ID="lbnodata" runat="server" Text="No Data Available" Font-Size="X-Large" Font-Bold="true" ForeColor="White" Visible="false"></asp:Label>
        <br /><br />
        </div>
    </div>
    </div>

    <%--<div class='card col-lg-3 ml-4 mt-2' style='height:auto;border:ridge;margin: 1%;width:22%'>
        <div class='card-body'>
            <br><img class='img-responsive' style='width: 350px; height: 200px;' src="Images/8.jpg"/>
            <div class='pt-2 text-center' style='width:105%;margin-top:5px'>
                <asp:Label ID = 'Label9' Style='font-size: x-large;' runat='server' Text='Space :'>" + dt.Rows[i][1].ToString() + "</asp:Label><br>
                <asp:Label ID = 'Label10' Style='font-size: x-large;' runat='server' Text='Duration :'>" + dt.Rows[i][1].ToString() + "</asp:Label><br>

            </div><hr style='width:98%;border:ridge'/>
            <button id='btnedit' type='button' class='btn btn-warning' onclick='buy(" + dt.Rows[i][0].ToString() + ")'><i class='fas fa-edit' style='color:white; font-size:medium; font-weight:bold'></i></button></td>
                <br/>
        </div>
    </div>--%>
    
</asp:Content>
