<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HostelApp.aspx.cs" Inherits="HostelManagementSystem.Hostel" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:gridview id="hDetails" autogeneratecolumns="False" emptydatatext="No data available"              
                    runat="server" DataKeyNames="studentid" OnRowEditing="hDetails_RowEditing" 
                    OnRowCancelingEdit="hDetails_RowCancelingEdit" OnRowCommand="hDetailsview_RowCommand" onrowupdating="hDetails_RowUpdating"
                    OnRowDeleting="hDetails_RowDeleting">
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
                   <asp:TemplateField>
                     <ItemTemplate>
                        <asp:LinkButton ID="btnedit" runat="server" CommandName="Edit" Text="Edit"/>       
                     </ItemTemplate>
                     <EditItemTemplate>
                        <asp:LinkButton ID="btnupdate" runat="server" CommandName="Update" Text="Update" />
                        <asp:LinkButton ID="btncancel" runat="server" CommandName="Cancel" Text="Cancel"/>
                        <asp:LinkButton ID="btnDelete" runat="server" CommandName="Delete" Text="Delete"/>
                     </EditItemTemplate>
                     <FooterTemplate>
                        <asp:Button ID="btnInsert" runat="Server" Text="Insert" CommandName="Insert" UseSubmitBehavior="False" />
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