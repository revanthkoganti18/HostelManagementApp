using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;

namespace HostelManagementSystem
{
    public partial class LoginForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            Session["Username"] = TextBox1.Text;
            Session["Password"] = TextBox2.Text;
            string password = "";
            string _username = Session["Username"].ToString();
            string connString = ConfigurationManager.ConnectionStrings["Sql"].ConnectionString;
            string sql = @"Select L.password from login_details L where username=@UName and user_type=@UserType";
            string _userType = DropDownList1.SelectedItem.Value.ToString();
            using (SqlConnection conn = new SqlConnection(connString))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("UName", _username);
                    cmd.Parameters.AddWithValue("UserType", _userType);
                    try
                    {
                        password = cmd.ExecuteScalar().ToString();
                    }
                    catch (NullReferenceException) { }
                    finally
                    {
                        if (password == Session["Password"].ToString())
                        {
                            if (DropDownList1.SelectedItem.Value == "Hostel Owner")
                            {
                                Response.Redirect("Hostel.aspx");
                            }
                            else
                            {
                                Response.Redirect("student.aspx");
                            }
                        }
                        else
                        {
                            Label4.Visible = true;
                        }
                    }
                }
            }
        }
    }
}