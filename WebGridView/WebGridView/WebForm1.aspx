<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebGridView.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        &nbsp;<div>
        
        <asp:Label ID="Label1" runat="server" Text="电影id"></asp:Label>
        <asp:TextBox ID="TextBox_ID" runat="server"></asp:TextBox>
&nbsp;<asp:Label ID="Label2" runat="server" Text="电影名称"></asp:Label>
        <asp:TextBox ID="TextBox_name" runat="server"></asp:TextBox>
&nbsp;<asp:Label ID="Label3" runat="server" Text="时长"></asp:Label>
        <asp:TextBox ID="TextBox_mins" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="Button_insert" runat="server" OnClick="Button_insert_Click" Text="新建" />
        &nbsp;&nbsp;
        <asp:Button ID="Button_select" runat="server" OnClick="Button_select_Click" Text="查询" />
        &nbsp;&nbsp;
        <asp:Button ID="Button_selectall" runat="server" OnClick="Button_selectall_Click" Text="查询所有" />
        <br />
        <fieldset>
            <legend>Gridview</legend>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:cinemaConnectionString %>'
                SelectCommand="SELECT [film_id], [film_name], [mins] FROM [file_mess]" 
                DeleteCommand="DELETE FROM [file_mess] WHERE [film_id] = @film_id" 
                InsertCommand="INSERT INTO [file_mess] ([film_id], [film_name], [mins]) VALUES (@film_id, @film_name, @mins)" 
                UpdateCommand="UPDATE file_mess SET film_name = @film_name, mins = @mins WHERE (film_id = @film_id)">
                <DeleteParameters>
                    <asp:Parameter Name="film_id"></asp:Parameter>
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="film_id"></asp:Parameter>
                    <asp:Parameter Name="film_name"></asp:Parameter>
                    <asp:Parameter Name="mins"></asp:Parameter>
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="film_name"></asp:Parameter>
                    <asp:Parameter Name="mins"></asp:Parameter>
                    <asp:Parameter Name="film_id"></asp:Parameter>
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="6" ForeColor="#333333" GridLines="None" Width="1009px" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing"
                        OnRowUpdating="GridView1_RowUpdating" OnRowCancelingEdit="GridView1_RowCancelingEdit" >
                <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
                <Columns>
                    
                    <asp:BoundField DataField="film_id" HeaderText="film_id" SortExpression="film_id"></asp:BoundField>
                    <asp:BoundField DataField="film_name" HeaderText="film_name" SortExpression="film_name"></asp:BoundField>
                    <asp:BoundField DataField="mins" HeaderText="mins" SortExpression="mins"></asp:BoundField>
                    <asp:CommandField ShowSelectButton="True" HeaderText="选择"></asp:CommandField>
                    <asp:CommandField ShowEditButton="True" HeaderText="编辑"></asp:CommandField>
                    <asp:CommandField ShowDeleteButton="True" HeaderText="删除"></asp:CommandField>
                    
                </Columns>
                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White"></FooterStyle>

                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White"></HeaderStyle>

                <PagerStyle HorizontalAlign="Center" BackColor="#FFCC66" ForeColor="#333333"></PagerStyle>

                <RowStyle BackColor="#FFFBD6" ForeColor="#333333"></RowStyle>

                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy"></SelectedRowStyle>

                <SortedAscendingCellStyle BackColor="#FDF5AC"></SortedAscendingCellStyle>

                <SortedAscendingHeaderStyle BackColor="#4D0000"></SortedAscendingHeaderStyle>

                <SortedDescendingCellStyle BackColor="#FCF6C0"></SortedDescendingCellStyle>

                <SortedDescendingHeaderStyle BackColor="#820000"></SortedDescendingHeaderStyle>
            </asp:GridView>
         </fieldset></div>
    </form>
</body>
</html>
