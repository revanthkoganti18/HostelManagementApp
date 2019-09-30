using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HostelManagementSystem
{
    public partial class Hostel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BindData();
        }
        private void BindData()
        {
            //Bind the grid view
            hDetails.DataSource = RetrieveHostelStudents();
            hDetails.DataBind();
        }
        private DataSet RetrieveHostelStudents()
        {
            if (ViewState["studentid"] != null)
                return (DataSet)ViewState["studentid"];

            string connString = ConfigurationManager.ConnectionStrings["Sql"].ConnectionString;
            //SQL statement to fetch rows from student
            string sql = @"Select S.studentid, S.student_name, S.address, S.room_rent, S.date_of_joining, S.active, S.advance_amount, S.remaining_amount from Student S join Hostel H on S.hid=H.hid where owner_name=@HOwner";

            DataSet dsHdetails = new DataSet();
            //Open SQL Connection
            using (SqlConnection conn = new SqlConnection(connString))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    string _howner = Session["Username"].ToString();
                    cmd.Parameters.AddWithValue("@HOwner", _howner);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    //Fill the result set
                    da.Fill(dsHdetails);

                }
            }
            return dsHdetails;
        }

        protected void AddNewRecord(object sender, EventArgs e)
        {
            hDetails.ShowFooter = true;
            BindData();
        }
        protected void hDetailsview_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("Insert"))
            {
                //fetch the values of the new student                
                TextBox txtNewStudentName = hDetails.FooterRow.FindControl("txtNewStudentName") as TextBox;
                TextBox txtNewAddress = hDetails.FooterRow.FindControl("txtNewAddress") as TextBox;
                TextBox txtNewRoomRent = hDetails.FooterRow.FindControl("txtNewRoomRent") as TextBox;
                TextBox txtNewDoj = hDetails.FooterRow.FindControl("txtNewDoj") as TextBox;
                TextBox txtNewActive = hDetails.FooterRow.FindControl("txtNewActive") as TextBox;
                TextBox txtNewAdvance = hDetails.FooterRow.FindControl("txtNewAdvance") as TextBox;
                TextBox txtNewBalance = hDetails.FooterRow.FindControl("txtNewBalance") as TextBox;
                //insert the new student into database
                InsertProduct(txtNewStudentName.Text, txtNewAddress.Text, txtNewRoomRent.Text, txtNewDoj.Text, txtNewActive.Text, txtNewAdvance.Text, txtNewBalance.Text);
                hDetails.ShowFooter = false;
                ViewState["studentid"] = null;
                BindData();
            }
        }
        private void InsertProduct(string student_name, string address, string room_rent, string doj, string active, string advance, string balance)
        {
            //fetch the connection string from web.config
            string connString = ConfigurationManager.ConnectionStrings["Sql"].ConnectionString;
            //SQL statement to insert a student
            string sql = String.Format("Insert into student(student_name,address,room_rent,date_of_joining,active,advance_amount,remaining_amount) values(@Name,@Address,@RoomRent,@Doj,@Active,@Advance,@Balance)");
            using (SqlConnection conn = new SqlConnection(connString))
            {
                conn.Open();
                //Initialize command object
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@Name", student_name);
                    cmd.Parameters.AddWithValue("@Address", address);
                    cmd.Parameters.AddWithValue("@RoomRent", decimal.Parse(room_rent));
                    cmd.Parameters.Add("@Doj", SqlDbType.DateTime).Value = DateTime.Parse(doj);
                    cmd.Parameters.AddWithValue("@Active", active.Equals("True") ? 1 : 0);
                    cmd.Parameters.AddWithValue("@Advance", decimal.Parse(advance));
                    cmd.Parameters.AddWithValue("@Balance", decimal.Parse(balance));
                    cmd.ExecuteNonQuery();
                }
            }
            BindData();
        }
        protected void hDetails_RowEditing(object sender, GridViewEditEventArgs e)
        {
            hDetails.EditIndex = e.NewEditIndex;
            BindData();
        }
        protected void hDetails_RowUpdating(Object sender, GridViewUpdateEventArgs e)
        {

            // Get the student id of the selected student   
            string student_id = hDetails.DataKeys[e.RowIndex].Value.ToString();

            GridViewRow row = hDetails.Rows[e.RowIndex];

            TextBox txtStudentName = (TextBox)row.FindControl("txtStudentName");
            TextBox txtAddress = (TextBox)row.FindControl("txtAddress");
            TextBox txtRoomRent = (TextBox)row.FindControl("txtRoomRent");
            TextBox txtDoj = (TextBox)row.FindControl("txtDoj");
            TextBox txtActive = (TextBox)row.FindControl("txtActive");
            TextBox txtAdvance = (TextBox)row.FindControl("txtAdvance");
            TextBox txtBalance = (TextBox)row.FindControl("txtBalance");
            //update the student
            UpdateProduct(student_id, txtStudentName.Text, txtAddress.Text, txtRoomRent.Text, txtDoj.Text, txtActive.Text, txtAdvance.Text, txtBalance.Text);
            hDetails.EditIndex = -1;
            BindData();
        }

        private void UpdateProduct(string student_id, string student_name, string address, string room_rent, string doj, string active, string advance, string balance)
        {
            //fetch the connection string from web.config
            string connString = ConfigurationManager.ConnectionStrings["Sql"].ConnectionString;
            //SQL statement to update a student
            string sql = String.Format(@"Update student set student_name=@Name,address=@Address,date_of_joining=@Doj,room_rent=@RoomRent,active=@Active,advance_amount=@Advance,remaining_amount=@Balance where studentid=@Id");
            using (SqlConnection conn = new SqlConnection(connString))
            {
                conn.Open();
                //Initialize command object
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@Name", student_name);
                    cmd.Parameters.AddWithValue("@Address", address);
                    cmd.Parameters.AddWithValue("@Doj", doj);
                    cmd.Parameters.AddWithValue("@RoomRent", decimal.Parse(room_rent));
                    cmd.Parameters.AddWithValue("@Active", active.Equals("True") ? 1 : 0);
                    cmd.Parameters.AddWithValue("@Advance", decimal.Parse(advance));
                    cmd.Parameters.AddWithValue("@Balance", decimal.Parse(balance));
                    cmd.Parameters.AddWithValue("@Id", int.Parse(student_id));
                    cmd.ExecuteNonQuery();
                }
            }
        }
        protected void hDetails_RowDeleting(Object sender, GridViewDeleteEventArgs e)

        {
            // Get the student id of the selected student   
            string student_id = hDetails.DataKeys[e.RowIndex].Value.ToString();
            //delete the student details
            DeleteProduct(student_id);
            hDetails.EditIndex = -1;
            BindData();
        }
        private void DeleteProduct(string student_id)
        {
            //fetch the connection string from web.config
            string connString = ConfigurationManager.ConnectionStrings["Sql"].ConnectionString;
            //SQL statement to delete from student
            string sql = String.Format(@"Delete from student where studentid = {0}", student_id);
            using (SqlConnection conn = new SqlConnection(connString))
            {
                conn.Open();
                //Initialize command object
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.ExecuteNonQuery();
                }
            }
        }
        protected void hDetails_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            hDetails.EditIndex = -1;
            BindData();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("loginform.aspx");
        }
    }
}