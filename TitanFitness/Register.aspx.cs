using System;
using System.Data.SqlClient;
using System.Configuration;

namespace Titan_Fitness
{
    public partial class Register : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        string s = ConfigurationManager.ConnectionStrings["data"].ConnectionString;

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void clear()
        {
            txtFullName.Text = "";
            txtEmail.Text = "";
            txtPhone.Text = "";
            ddlGender.ClearSelection();
            txtAge.Text = "";
            ddlPlan.ClearSelection();
            txtPassword.Text = "";
            txtConfirmPassword.Text = "";
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserEmail"] != null)
            {
                Response.Redirect("Home.aspx");
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (txtPassword.Text != txtConfirmPassword.Text)
            {
                lblMessage.Text = "Passwords do not match!";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            getcon();

            cmd = new SqlCommand("INSERT INTO [Members] (FullName, Email, Phone, Gender, Age, PlanName, Password, PaymentStatus) VALUES ('" + txtFullName.Text + "','" + txtEmail.Text + "','" + txtPhone.Text + "','" + ddlGender.SelectedValue + "','" + txtAge.Text + "','" + ddlPlan.SelectedValue + "','" + txtPassword.Text + "', 'Pending')", con);
            int rows = cmd.ExecuteNonQuery();

            if (rows > 0)
            {
                Session["UserEmail"] = txtEmail.Text;
                Session["UserName"] = txtFullName.Text;
                Session["NewPlan"] = ddlPlan.SelectedValue;

                clear();
                Response.Redirect("Payment.aspx");
            }
            else
            {
                lblMessage.Text = "Registration failed. Please try again.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}