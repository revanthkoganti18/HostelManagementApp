<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="loginform.aspx.cs" Inherits="HostelManagementSystem.LoginForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
   <form id="form1" runat="server">
        <table style="width: 20%;">
                <tr>
                    <td><asp:Label ID="Label1" runat="server" Text="Username"></asp:Label></td>
                    <td><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td><asp:Label ID="Label2" runat="server" Text="Password" ></asp:Label></td>
                    <td><asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox></td>
                </tr>
                <tr>
                    <td><asp:Label ID="Label3" runat="server" Text="User Type"></asp:Label></td>
                    <td><asp:DropDownList ID="DropDownList1" runat="server">
                            <asp:ListItem text="Student" Value="Student"></asp:ListItem> 
                            <asp:ListItem text="Hostel Owner" Value="Hostel Owner"></asp:ListItem>
                    </asp:DropDownList></td>
                </tr>
                <tr>
                    <td><asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click"/></td>
                    <td><asp:Button ID="Button2" runat="server" Text="Cancel"/></td>
                </tr>
            <tr>
                <td colspan="2"><asp:Label ID="Label4" runat="server" Text="Invalid username or password" Visible="false" ForeColor="Red" Font-Bold="true"></asp:Label></td>
            </tr>
            </table>
    </form>
</body>
</html>