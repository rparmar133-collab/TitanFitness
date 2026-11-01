using System;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace Titan_Fitness
{
    public partial class Profile : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
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

            Response.Redirect("UserProfile.aspx");
        }

        void LoadUserData()
        {
            getcon();
            da = new SqlDataAdapter("SELECT * FROM [Members] WHERE Email='" + Session["UserEmail"].ToString() + "'", con);
            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                lblName.Text = ds.Tables[0].Rows[0]["FullName"].ToString();
                lblEmail.Text = ds.Tables[0].Rows[0]["Email"].ToString();

                string payStatus = ds.Tables[0].Rows[0]["PaymentStatus"] != DBNull.Value ? ds.Tables[0].Rows[0]["PaymentStatus"].ToString() : "Pending";

                if (payStatus == "Approved")
                {
                    lblCurrentPlan.Text = ds.Tables[0].Rows[0]["PlanName"].ToString();
                    lblCurrentPlan.CssClass = "gradient-text fw-bold";
                }
                else
                {
                    lblCurrentPlan.Text = "Plan is not activated (Payment Pending at Gym)";
                    lblCurrentPlan.CssClass = "text-danger fw-bold";
                }
            }
        }

        void Clear()
        {
            ddlNewPlan.SelectedIndex = 0;
        }

        protected void btnUpgrade_Click(object sender, EventArgs e)
        {
            if (ddlNewPlan.SelectedIndex == 0 || string.IsNullOrEmpty(ddlNewPlan.SelectedValue))
            {
                lblMessage.Text = "Please select a plan to upgrade!";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            getcon();
            cmd = new SqlCommand("UPDATE [Members] SET PaymentStatus='Pending' WHERE Email='" + Session["UserEmail"].ToString() + "'", con);
            cmd.ExecuteNonQuery();

            Session["NewPlan"] = ddlNewPlan.SelectedValue;
            Clear();

            Response.Redirect("Payment.aspx");
        }
    }
}