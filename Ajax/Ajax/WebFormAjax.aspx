<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebFormAjax.aspx.cs" Inherits="Ajax.WebFormAjax" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .cen{
            text-align:center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="cen">
    
        <br />
        省市联动<br />
    
    </div>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" class="cen">
            <ContentTemplate>
                <br />
                省份：<asp:DropDownList ID="DropDownListProvince" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceProvinces" DataTextField="province" DataValueField="province" OnSelectedIndexChanged="DropDownListProvince_SelectedIndexChanged">
                    <asp:ListItem>请选择</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourceProvinces" runat="server" ConnectionString="<%$ ConnectionStrings:ChinaConnectionString %>" SelectCommand="SELECT [province] FROM [provinces]"></asp:SqlDataSource>
                &nbsp; 城市：<asp:DropDownList ID="DropDownListCity" runat="server" AutoPostBack="True">
                    <asp:ListItem>请选择</asp:ListItem>
                </asp:DropDownList>
                <br />
                <br />
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>
