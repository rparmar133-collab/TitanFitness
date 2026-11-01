using System;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Web.UI.WebControls;

namespace Titan_Fitness
{
    public partial class admin_members : System.Web.UI.Page
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
            da = new SqlDataAdapter("SELECT * FROM [Members] ORDER BY Id DESC", con);
            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                rptMembers.DataSource = ds.Tables[0];
                rptMembers.DataBind();
                lblNoRecord.Visible = false;
            }
            else
            {
                rptMembers.DataSource = null;
                rptMembers.DataBind();
                lblNoRecord.Visible = true;
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string memberId = btn.CommandArgument;

            getcon();
            cmd = new SqlCommand("DELETE FROM [Members] WHERE Id = '" + memberId + "'", con);
            int i = cmd.ExecuteNonQuery();

            if (i > 0)
            {
                lblMessage.Text = "Member deleted successfully!";
                lblMessage.ForeColor = System.Drawing.Color.Green;
            }
            else
            {
                lblMessage.Text = "Something went wrong!";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
            gridfill();
        }
    }
}
