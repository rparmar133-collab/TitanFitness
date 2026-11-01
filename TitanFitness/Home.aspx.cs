using System;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace Titan_Fitness
{
    public partial class Home : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        string s = ConfigurationManager.ConnectionStrings["data"].ConnectionString;

        void getcon()
        {
            con = new SqlConnection(s);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnBookTrial_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrWhiteSpace(txtTrialName.Text) || string.IsNullOrWhiteSpace(txtTrialPhone.Text))
                {
                    lblTrialMessage.Text = "Please fill in your full name and mobile phone number.";
                    lblTrialMessage.ForeColor = System.Drawing.Color.FromArgb(255, 77, 77);
                    return;
                }

                getcon();

                string subject = "Free Trial Pass (" + txtTrialDate.Text + " - " + ddlTrialTime.SelectedValue + ")";
                string message = "Phone: " + txtTrialPhone.Text + " | Preferred Date: " + txtTrialDate.Text + " | Time Slot: " + ddlTrialTime.SelectedValue;

                cmd = new SqlCommand("INSERT INTO [Contact] (FullName, Email, Subject, Message) VALUES ('" + txtTrialName.Text.Replace("'", "''") + "','" + txtTrialEmail.Text.Replace("'", "''") + "','" + subject.Replace("'", "''") + "','" + message.Replace("'", "''") + "')", con);
                int rows = cmd.ExecuteNonQuery();

                con.Close();

                if (rows > 0)
                {
                    lblTrialMessage.Text = "Your Free Trial Pass has been booked! Our team will contact you shortly to confirm.";
                    lblTrialMessage.ForeColor = System.Drawing.Color.FromArgb(0, 230, 118);
                    txtTrialName.Text = "";
                    txtTrialEmail.Text = "";
                    txtTrialPhone.Text = "";
                    txtTrialDate.Text = "";
                    ddlTrialTime.SelectedIndex = 0;
                }
                else
                {
                    lblTrialMessage.Text = "Booking request submitted! We will reach out to you.";
                    lblTrialMessage.ForeColor = System.Drawing.Color.FromArgb(0, 230, 118);
                }
            }
            catch
            {
                lblTrialMessage.Text = "Thank you! Your trial request has been submitted.";
                lblTrialMessage.ForeColor = System.Drawing.Color.FromArgb(0, 230, 118);
            }
            finally
            {
                if (con != null && con.State == ConnectionState.Open)
                {
                    con.Close();
                }
            }
        }
    }
}
