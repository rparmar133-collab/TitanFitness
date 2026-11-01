using System;
using System.Data.SqlClient;
using System.Configuration;

namespace Titan_Fitness
{
    public partial class Contact : System.Web.UI.Page
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
            txtName.Text = "";
            txtEmail.Text = "";
            txtSubject.Text = "";
            txtMessage.Text = "";
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            getcon();

            cmd = new SqlCommand("INSERT INTO [Contact] (FullName, Email, Subject, Message) VALUES ('" + txtName.Text + "', '" + txtEmail.Text + "', '" + txtSubject.Text + "', '" + txtMessage.Text + "')", con);
            int i = cmd.ExecuteNonQuery();

            if (i > 0)
            {
                lblMessage.Text = "Message sent successfully!";
                lblMessage.ForeColor = System.Drawing.Color.Green;
                clear();
            }
            else
            {
                lblMessage.Text = "Failed to send message! Please try again.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }

            con.Close();
        }
    }
}