using System;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace Titan_Fitness
{
    public partial class Login : System.Web.UI.Page
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
            if (Request.QueryString["logout"] == "true")
            {
                Session.Clear();
                Session.Abandon();
                Response.Redirect("Login.aspx");
            }

            if (Session["AdminEmail"] != null)
            {
                Response.Redirect("admin_dashboard.aspx");
            }

            if (Session["UserEmail"] != null)
            {
                Response.Redirect("Home.aspx");
            }
        }

        void clear()
        {
            txtLoginEmail.Text = "";
            txtLoginPassword.Text = "";
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (!(string.IsNullOrEmpty(txtLoginEmail.Text)) &&
                !(string.IsNullOrEmpty(txtLoginPassword.Text)))
            {
                getcon();

                string role = hfRole.Value;

                if (role == "Admin")
                {
                    cmd = new SqlCommand("SELECT * FROM [Admin] WHERE Email='" + txtLoginEmail.Text + "' AND Password='" + txtLoginPassword.Text + "'", con);
                    da = new SqlDataAdapter(cmd);
                    ds = new DataSet();
                    da.Fill(ds);

                    GridView1.DataSource = ds;
                    GridView1.DataBind();

                    if (GridView1.Rows.Count > 0)
                    {
                        Session["AdminEmail"] = txtLoginEmail.Text;
                        con.Close();
                        Response.Redirect("admin_dashboard.aspx");
                    }
                    else
                    {
                        lblMessage.Text = "Invalid Admin Email or Password!";
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                        clear();
                    }
                }
                else
                {
                    cmd = new SqlCommand("SELECT * FROM [Members] WHERE Email='" + txtLoginEmail.Text + "' AND Password='" + txtLoginPassword.Text + "'", con);
                    da = new SqlDataAdapter(cmd);
                    ds = new DataSet();
                    da.Fill(ds);

                    GridView1.DataSource = ds;
                    GridView1.DataBind();

                    if (GridView1.Rows.Count > 0)
                    {
                        Session["UserEmail"] = txtLoginEmail.Text;

                        if (ds.Tables[0].Rows[0]["FullName"] != DBNull.Value && !string.IsNullOrEmpty(ds.Tables[0].Rows[0]["FullName"].ToString()))
                        {
                            Session["UserName"] = ds.Tables[0].Rows[0]["FullName"].ToString();
                        }
                        else
                        {
                            Session["UserName"] = txtLoginEmail.Text.Split('@')[0];
                        }

                        con.Close();
                        Response.Redirect("Home.aspx");
                    }
                    else
                    {
                        lblMessage.Text = "Invalid User Email or Password!";
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                        clear();
                    }
                }

                con.Close();
            }
            else
            {
                lblMessage.Text = "Please enter Email and Password!";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}