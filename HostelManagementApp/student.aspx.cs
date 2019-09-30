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
    public partial class Student : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BindData();
        }
        private void BindData()
        {
            //Bind the grid view
            sDetails.DataSource = RetrieveStudents();
            sDetails.DataBind();
        }
        private DataSet RetrieveStudents()
        {
            if (ViewState["studentid"] != null)
                return (DataSet)ViewState["studentid"];
            string _student = Session["Username"].ToString();
            string connString = ConfigurationManager.ConnectionStrings["Sql"].ConnectionString;
            //SQL statement to fetch rows from student

            string sql = @"Select S.studentid, S.student_name, S.hid, H.hname, H.haddress , S.address, S.room_rent, S.date_of_joining, S.active, S.advance_amount, S.remaining_amount from Student S join hostel H on S.hid=H.hid where student_name=@SName";

            DataSet dsSdetails = new DataSet();
            //Open SQL Connection
            using (SqlConnection conn = new SqlConnection(connString))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@SName", _student);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    //Fill the result set
                    da.Fill(dsSdetails);

                }
            }
            return dsSdetails;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("loginform.aspx");
        }
    }
}