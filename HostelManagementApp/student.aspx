<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentApp.aspx.cs" Inherits="HostelManagementSystem.Student" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:gridview id="sDetails" autogeneratecolumns="False" emptydatatext="No data available"              
                    runat="server" DataKeyNames="studentid">
               <Columns>
                   <asp:BoundField DataField="studentid"  HeaderText="Student Id" ReadOnly="true"/>
                   <asp:TemplateField headertext="Student Name">
                     <ItemTemplate> <%#Eval("student_name")%></ItemTemplate>   
                        <EditItemTemplate>
                            <asp:TextBox id="txtStudentName" runat="server" text='<%#Eval("student_name")%>'/>
                        </EditItemTemplate>                
                        <FooterTemplate>
                            <asp:TextBox ID="txtNewStudentName" runat="Server"/>                    
                        </FooterTemplate>
                   </asp:TemplateField> 
                   <asp:TemplateField headertext="Hostel id">
                     <ItemTemplate> <%#Eval("hid")%></ItemTemplate>   
                        <EditItemTemplate>
                            <asp:TextBox id="txtHostelId" runat="server" text='<%#Eval("hid")%>'/>
                        </EditItemTemplate>                
                        <FooterTemplate>
                            <asp:TextBox ID="txtNewHostelId" runat="Server"/>                    
                        </FooterTemplate>
                   </asp:TemplateField> 
                   <asp:TemplateField headertext="Hostel Name">
                     <ItemTemplate> <%#Eval("hname")%></ItemTemplate>   
                        <EditItemTemplate>
                            <asp:TextBox id="txtHostelName" runat="server" text='<%#Eval("hname")%>'/>
                        </EditItemTemplate>                
                        <FooterTemplate>
                            <asp:TextBox ID="txtNewHostelName" runat="Server"/>                    
                        </FooterTemplate>
                   </asp:TemplateField> 
                   <asp:TemplateField headertext="Hostel Address">
                     <ItemTemplate> <%#Eval("haddress")%></ItemTemplate>   
                        <EditItemTemplate>
                            <asp:TextBox id="txtHostelAddress" runat="server" text='<%#Eval("haddress")%>'/>
                        </EditItemTemplate>                
                        <FooterTemplate>
                            <asp:TextBox ID="txtNewHostelAddress" runat="Server"/>                    
                        </FooterTemplate>
                   </asp:TemplateField> 
                   <asp:TemplateField headertext="Address">
                     <ItemTemplate> <%#Eval("address")%></ItemTemplate>   
                        <EditItemTemplate>
                            <asp:TextBox id="txtAddress" runat="server" text='<%#Eval("address")%>'/>
                        </EditItemTemplate>                
                        <FooterTemplate>
                            <asp:TextBox ID="txtNewAddress" runat="Server"/>                    
                        </FooterTemplate>
                   </asp:TemplateField> 
                   <asp:TemplateField headertext="Room Rent">
                     <ItemTemplate> <%#Eval("room_rent")%></ItemTemplate>   
                        <EditItemTemplate>
                            <asp:TextBox id="txtRoomRent" runat="server" text='<%#Eval("room_rent")%>'/>
                        </EditItemTemplate>                
                        <FooterTemplate>
                            <asp:TextBox ID="txtNewRoomRent" runat="Server"/>                    
                        </FooterTemplate>
                   </asp:TemplateField> 
                   <asp:TemplateField headertext="Date of Joining">
                     <ItemTemplate> <%#Eval("date_of_joining")%></ItemTemplate>   
                        <EditItemTemplate>
                            <asp:TextBox id="txtDoj" runat="server" text='<%#Eval("date_of_joining")%>'/>
                        </EditItemTemplate>                
                        <FooterTemplate>
                            <asp:TextBox ID="txtNewDoj" runat="Server"/>                    
                        </FooterTemplate>
                   </asp:TemplateField> 
                   <asp:TemplateField headertext="Active">
                     <ItemTemplate> <%#Eval("active")%></ItemTemplate>   
                        <EditItemTemplate>
                            <asp:TextBox id="txtActive" runat="server" text='<%#Eval("active")%>'/>
                        </EditItemTemplate>                
                        <FooterTemplate>
                            <asp:TextBox ID="txtNewActive" runat="Server"/>                    
                        </FooterTemplate>
                   </asp:TemplateField> 
                   <asp:TemplateField headertext="Advance Amount">
                     <ItemTemplate> <%#Eval("advance_amount")%></ItemTemplate>   
                        <EditItemTemplate>
                            <asp:TextBox id="txtAdvance" runat="server" text='<%#Eval("advance_amount")%>'/>
                        </EditItemTemplate>                
                        <FooterTemplate>
                            <asp:TextBox ID="txtNewAdvance" runat="Server"/>                    
                        </FooterTemplate>
                   </asp:TemplateField> 
                   <asp:TemplateField headertext="Balance Amount">
                     <ItemTemplate> <%#Eval("remaining_amount")%></ItemTemplate>   
                        <EditItemTemplate>
                            <asp:TextBox id="txtBalance" runat="server" text='<%#Eval("remaining_amount")%>'/>
                        </EditItemTemplate>                
                        <FooterTemplate>
                            <asp:TextBox ID="txtNewBalance" runat="Server"/>                    
                        </FooterTemplate>
                   </asp:TemplateField>                
               </Columns>
            </asp:gridview> 
        </div>
        <div>
            <asp:Button ID="Button1" runat="server" Text="Logout" OnClick="Button1_Click" />
        </div>
    </form>
</body>
</html>