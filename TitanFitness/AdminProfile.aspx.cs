using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Titan_Fitness
{
    public partial class AdminProfile : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
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

            // Load Admin Profile
            da = new SqlDataAdapter("SELECT Id, FullName, Email, Phone, DOB, Gender, Address, Status FROM [Admin] WHERE Email='" + Session["AdminEmail"] + "'", con);
            ds = new DataSet();
            da.Fill(ds);

            GridView1.DataSource = ds;
            GridView1.DataBind();

            if (ds.Tables[0].Rows.Count > 0)
            {
                lblBadgeAdminId.Text = "Admin ID: #ADM-00" + ds.Tables[0].Rows[0]["Id"];
                lblHelloName.Text = "Hello, " + ds.Tables[0].Rows[0]["FullName"] + "!";
                lblBadgeStatus.Text = "" + ds.Tables[0].Rows[0]["Status"];
                lblTopUserName.Text = "" + ds.Tables[0].Rows[0]["FullName"];

                txtFullName.Text = "" + ds.Tables[0].Rows[0]["FullName"];
                txtEmail.Text = "" + ds.Tables[0].Rows[0]["Email"];
                txtPhone.Text = "" + ds.Tables[0].Rows[0]["Phone"];
                txtDOB.Text = "" + ds.Tables[0].Rows[0]["DOB"];
                txtAddress.Text = "" + ds.Tables[0].Rows[0]["Address"];

                if (ddlGender.Items.FindByValue("" + ds.Tables[0].Rows[0]["Gender"]) != null)
                {
                    ddlGender.SelectedValue = "" + ds.Tables[0].Rows[0]["Gender"];
                }
                else
                {
                    ddlGender.SelectedIndex = 0;
                }
            }

            // Dashboard Stats (All from admin dashboard)
            da = new SqlDataAdapter("SELECT * FROM [Members] ORDER BY Id DESC", con);
            DataSet dsMembers = new DataSet();
            da.Fill(dsMembers);
            lblTotalMembers.Text = "" + dsMembers.Tables[0].Rows.Count;
            gvAdminMembers.DataSource = dsMembers;
            gvAdminMembers.DataBind();

            da = new SqlDataAdapter("SELECT * FROM [payment] WHERE Status='Pending'", con);
            DataSet dsPending = new DataSet();
            da.Fill(dsPending);
            lblPendingPayments.Text = "" + dsPending.Tables[0].Rows.Count;

            da = new SqlDataAdapter("SELECT * FROM [payment] ORDER BY Id DESC", con);
            DataSet dsPayments = new DataSet();
            da.Fill(dsPayments);
            gvAdminPayments.DataSource = dsPayments;
            gvAdminPayments.DataBind();

            da = new SqlDataAdapter("SELECT * FROM [Members] WHERE PaymentStatus='Approved'", con);
            DataSet dsActive = new DataSet();
            da.Fill(dsActive);
            lblActiveMembers.Text = "" + dsActive.Tables[0].Rows.Count;

            da = new SqlDataAdapter("SELECT * FROM [Contact] ORDER BY Id DESC", con);
            DataSet dsQueries = new DataSet();
            da.Fill(dsQueries);
            lblTotalQueries.Text = "" + dsQueries.Tables[0].Rows.Count;
            gvAdminQueries.DataSource = dsQueries;
            gvAdminQueries.DataBind();

            da = new SqlDataAdapter("SELECT Name, Specialty, Experience, Phone, Email FROM [Trainers]", con);
            DataSet dsTrainers = new DataSet();
            da.Fill(dsTrainers);
            lblTotalTrainers.Text = "" + dsTrainers.Tables[0].Rows.Count;
            gvAdminTrainers.DataSource = dsTrainers;
            gvAdminTrainers.DataBind();

            con.Close();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            hfActiveTab.Value = "tab-profile";
            getcon();
            da = new SqlDataAdapter("SELECT * FROM [Admin] WHERE Email='" + Session["AdminEmail"] + "'", con);
            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                txtFullName.Text = "" + ds.Tables[0].Rows[0]["FullName"];
                txtEmail.Text = "" + ds.Tables[0].Rows[0]["Email"];
                txtPhone.Text = "" + ds.Tables[0].Rows[0]["Phone"];
                txtDOB.Text = "" + ds.Tables[0].Rows[0]["DOB"];
                txtAddress.Text = "" + ds.Tables[0].Rows[0]["Address"];

                if (ddlGender.Items.FindByValue("" + ds.Tables[0].Rows[0]["Gender"]) != null)
                {
                    ddlGender.SelectedValue = "" + ds.Tables[0].Rows[0]["Gender"];
                }
                else
                {
                    ddlGender.SelectedIndex = 0;
                }
            }
            con.Close();
        }

        protected void btnSaveProfile_Click(object sender, EventArgs e)
        {
            hfActiveTab.Value = "tab-profile";
            getcon();

            cmd = new SqlCommand("UPDATE [Admin] SET FullName='" + txtFullName.Text + "', Phone='" + txtPhone.Text + "', DOB='" + txtDOB.Text + "', Gender='" + ddlGender.SelectedValue + "', Address='" + txtAddress.Text + "' WHERE Email='" + Session["AdminEmail"] + "'", con);
            int i = cmd.ExecuteNonQuery();

            con.Close();

            if (i > 0)
            {
                lblMessage.Text = "Admin profile updated successfully!";
                lblMessage.ForeColor = System.Drawing.Color.Green;
            }
            else
            {
                lblMessage.Text = "Update failed! Please try again.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }

            gridfill();
        }

        protected void gvAdminPayments_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ApprovePayment")
            {
                hfActiveTab.Value = "tab-payments";
                string payId = "" + e.CommandArgument;
                getcon();

                da = new SqlDataAdapter("SELECT UserEmail, PlanName FROM [payment] WHERE Id='" + payId + "'", con);
                DataSet dsP = new DataSet();
                da.Fill(dsP);

                if (dsP.Tables[0].Rows.Count > 0)
                {
                    string uEmail = "" + dsP.Tables[0].Rows[0]["UserEmail"];
                    string uPlan = "" + dsP.Tables[0].Rows[0]["PlanName"];

                    cmd = new SqlCommand("UPDATE [payment] SET Status='Approved' WHERE Id='" + payId + "'", con);
                    cmd.ExecuteNonQuery();

                    cmd = new SqlCommand("UPDATE [Members] SET PlanName='" + uPlan + "', PaymentStatus='Approved' WHERE Email='" + uEmail + "'", con);
                    cmd.ExecuteNonQuery();

                    lblMessage.Text = "Payment approved and member plan activated successfully!";
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                }
                else
                {
                    lblMessage.Text = "Payment record not found.";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }

                con.Close();
                gridfill();
            }
        }
    }
}
