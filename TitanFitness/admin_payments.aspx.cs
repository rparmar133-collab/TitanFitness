using System;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Web.UI.WebControls;

namespace Titan_Fitness
{
    public partial class admin_payments : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;
        string s = ConfigurationManager.ConnectionStrings["data"].ConnectionString;

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminEmail"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
            {
                gridfill();
            }
        }

        void gridfill()
        {
            getcon();
            da = new SqlDataAdapter("SELECT * FROM [payment] ORDER BY Id DESC", con);
            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                rptPayments.DataSource = ds.Tables[0];
                rptPayments.DataBind();
                lblNoRecord.Visible = false;
            }
            else
            {
                rptPayments.DataSource = null;
                rptPayments.DataBind();
                lblNoRecord.Visible = true;
            }
        }

        protected void btnApprove_Click(object sender, EventArgs e)
        {
      
            Button btn = (Button)sender;
            string paymentId = btn.CommandArgument;

            getcon();

            da = new SqlDataAdapter("SELECT UserEmail, PlanName FROM [payment] WHERE Id = '" + paymentId + "'", con);
            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                string uEmail = ds.Tables[0].Rows[0]["UserEmail"].ToString();
                string uPlan = ds.Tables[0].Rows[0]["PlanName"].ToString();

                cmd = new SqlCommand("UPDATE [payment] SET Status = 'Approved' WHERE Id = '" + paymentId + "'", con);
                cmd.ExecuteNonQuery();
                cmd = new SqlCommand("UPDATE [Members] SET PlanName = '" + uPlan + "', PaymentStatus = 'Approved' WHERE Email = '" + uEmail + "'", con);
                cmd.ExecuteNonQuery();

                lblMessage.Text = "Payment Approved Successfully! User plan is now active.";
                lblMessage.ForeColor = System.Drawing.Color.Green;
            }
            else
            {
                lblMessage.Text = "Payment record not found.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }

            gridfill();
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string paymentId = btn.CommandArgument;

            getcon();
            cmd = new SqlCommand("DELETE FROM [payment] WHERE Id = '" + paymentId + "'", con);
            cmd.ExecuteNonQuery();

            lblMessage.Text = "Payment record removed.";
            lblMessage.ForeColor = System.Drawing.Color.Red;

            gridfill();
        }
    }
}
