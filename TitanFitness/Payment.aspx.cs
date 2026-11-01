using System;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Web.UI.WebControls;

namespace Titan_Fitness
{
    public partial class Payment : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        string s = ConfigurationManager.ConnectionStrings["data"].ConnectionString;

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserEmail"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
            {
                txtEmail.Text = Session["UserEmail"].ToString();

                if (Session["NewPlan"] != null)
                {
                    string incomingPlan = Session["NewPlan"].ToString();
                    ListItem item = ddlPlan.Items.FindByText(incomingPlan);
                    if (item == null)
                    {
                        item = ddlPlan.Items.FindByValue(incomingPlan);
                    }

                    if (item != null)
                    {
                        ddlPlan.ClearSelection();
                        item.Selected = true;
                        txtAmount.Text = ddlPlan.SelectedValue;
                    }
                }
            }
        }

        protected void ddlPlan_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtAmount.Text = ddlPlan.SelectedValue;
        }

        protected void btnSubmitPayment_Click(object sender, EventArgs e)
        {
            if (ddlPlan.SelectedValue == "0")
            {
                lblMessage.Text = "Please select a valid plan!";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            getcon();

            string selectedPlan = ddlPlan.SelectedItem.Text;
            string amount = txtAmount.Text;
            string currentDate = DateTime.Now.ToString("dd-MM-yyyy");

            cmd = new SqlCommand("INSERT INTO [payment] (UserEmail, PlanName, Amount, Date, Status) VALUES ('" + txtEmail.Text + "', '" + selectedPlan + "', '" + amount + "', '" + currentDate + "', 'Pending')", con);

            int i = cmd.ExecuteNonQuery();

            if (i > 0)
            {
                if (Session["NewPlan"] != null)
                {
                    Session.Remove("NewPlan");
                }

                lblMessage.Text = "Payment request submitted! Please pay at the gym to activate your plan.";
                lblMessage.ForeColor = System.Drawing.Color.Green;
                btnSubmitPayment.Enabled = false;
                ddlPlan.Enabled = false;
            }
            else
            {
                lblMessage.Text = "Something went wrong. Try again.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}