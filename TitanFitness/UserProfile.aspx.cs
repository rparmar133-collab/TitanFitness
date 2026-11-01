using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Titan_Fitness
{
    public partial class UserProfile : System.Web.UI.Page
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

        void EnsurePhotoColumn()
        {
            try
            {
                getcon();
                SqlCommand chkCmd = new SqlCommand("IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Members' AND COLUMN_NAME = 'Photo') BEGIN ALTER TABLE [Members] ADD [Photo] NVARCHAR(500) NULL END", con);
                chkCmd.ExecuteNonQuery();
                con.Close();
            }
            catch { }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserEmail"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            Page.Form.Enctype = "multipart/form-data";

            if (!IsPostBack)
            {
                EnsurePhotoColumn();
                gridfill();
            }
        }

        void gridfill()
        {
            getcon();

            da = new SqlDataAdapter("SELECT Id, FullName, Email, Phone, PlanName, PaymentStatus, FitnessGoal, Weight, Height, Address, Photo FROM [Members] WHERE Email='" + Session["UserEmail"] + "'", con);
            ds = new DataSet();
            da.Fill(ds);

            GridView1.DataSource = ds;
            GridView1.DataBind();

            if (ds.Tables[0].Rows.Count > 0)
            {
                lblBadgeUserId.Text = "Roll / ID: #TITAN-00" + ds.Tables[0].Rows[0]["Id"];
                lblHelloName.Text = "Hello, " + ds.Tables[0].Rows[0]["FullName"] + "!";
                lblBadgePlan.Text = "" + ds.Tables[0].Rows[0]["PlanName"];
                lblBadgeGoal.Text = "" + ds.Tables[0].Rows[0]["FitnessGoal"];
                lblTopUserName.Text = "" + ds.Tables[0].Rows[0]["FullName"];

                txtFullName.Text = "" + ds.Tables[0].Rows[0]["FullName"];
                txtEmail.Text = "" + ds.Tables[0].Rows[0]["Email"];
                txtPhone.Text = "" + ds.Tables[0].Rows[0]["Phone"];
                txtWeight.Text = "" + ds.Tables[0].Rows[0]["Weight"];
                txtHeight.Text = "" + ds.Tables[0].Rows[0]["Height"];
                txtAddress.Text = "" + ds.Tables[0].Rows[0]["Address"];

                string userPhoto = ds.Tables[0].Rows[0]["Photo"] != DBNull.Value ? ds.Tables[0].Rows[0]["Photo"].ToString() : "";
                if (!string.IsNullOrEmpty(userPhoto))
                {
                    imgTopAvatar.ImageUrl = userPhoto;
                    imgTopAvatar.Style["display"] = "block";
                    lblAvatarInitial.Visible = false;
                    imgProfilePreview.ImageUrl = userPhoto;
                    hfCurrentPhoto.Value = userPhoto;
                }
                else
                {
                    imgTopAvatar.Style["display"] = "none";
                    lblAvatarInitial.Visible = true;
                    imgProfilePreview.ImageUrl = "https://cdn-icons-png.flaticon.com/512/3135/3135715.png";
                    hfCurrentPhoto.Value = "";
                }

                if (ddlFitnessGoal.Items.FindByValue("" + ds.Tables[0].Rows[0]["FitnessGoal"]) != null)
                {
                    ddlFitnessGoal.SelectedValue = "" + ds.Tables[0].Rows[0]["FitnessGoal"];
                }
                else
                {
                    ddlFitnessGoal.SelectedIndex = 0;
                }

                // ── Dynamic Membership Status Banner & Checklist Icon ──
                string payStatus = "" + ds.Tables[0].Rows[0]["PaymentStatus"];
                if (payStatus == "Approved")
                {
                    lblStatusBanner.Text = "<div style='background:#dcfce7;border:1.5px solid #bbf7d0;border-radius:10px;padding:14px 20px;margin-bottom:20px;display:flex;align-items:center;gap:12px;'>" +
                        "<i class='fa-solid fa-circle-check' style='color:#16a34a;font-size:20px;'></i>" +
                        "<div><strong style='color:#15803d;font-size:14px;'>Membership Active!</strong>" +
                        "<span style='color:#166534;font-size:12.5px;margin-left:8px;'>Your plan is approved and active. Welcome to TITAN FITNESS!</span></div></div>";
                    lblPlanStatusIcon.Text = "<i class='fa-solid fa-circle-check check-icon-done'></i>";
                }
                else
                {
                    lblStatusBanner.Text = "<div style='background:#fef3c7;border:1.5px solid #fde68a;border-radius:10px;padding:14px 20px;margin-bottom:20px;display:flex;align-items:center;gap:12px;'>" +
                        "<i class='fa-solid fa-clock' style='color:#d97706;font-size:20px;'></i>" +
                        "<div><strong style='color:#92400e;font-size:14px;'>Payment Pending Approval</strong>" +
                        "<span style='color:#78350f;font-size:12.5px;margin-left:8px;'>Please visit the gym to pay. Admin will activate your plan after verification.</span></div></div>";
                    lblPlanStatusIcon.Text = "<i class='fa-regular fa-circle check-icon-pending'></i>";
                }
            }

            da = new SqlDataAdapter("SELECT Id, PlanName, Amount, Date, Status FROM [payment] WHERE UserEmail='" + Session["UserEmail"] + "' ORDER BY Id DESC", con);
            DataSet dsPay = new DataSet();
            da.Fill(dsPay);
            gvUserPayments.DataSource = dsPay;
            gvUserPayments.DataBind();
            lblStatPayments.Text = "" + dsPay.Tables[0].Rows.Count;

            con.Close();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            hfActiveTab.Value = "tab-profile";
            getcon();
            da = new SqlDataAdapter("SELECT * FROM [Members] WHERE Email='" + Session["UserEmail"] + "'", con);
            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                txtFullName.Text = "" + ds.Tables[0].Rows[0]["FullName"];
                txtEmail.Text = "" + ds.Tables[0].Rows[0]["Email"];
                txtPhone.Text = "" + ds.Tables[0].Rows[0]["Phone"];
                txtWeight.Text = "" + ds.Tables[0].Rows[0]["Weight"];
                txtHeight.Text = "" + ds.Tables[0].Rows[0]["Height"];
                txtAddress.Text = "" + ds.Tables[0].Rows[0]["Address"];

                string userPhoto = ds.Tables[0].Rows[0]["Photo"] != DBNull.Value ? ds.Tables[0].Rows[0]["Photo"].ToString() : "";
                if (!string.IsNullOrEmpty(userPhoto))
                {
                    imgProfilePreview.ImageUrl = userPhoto;
                    hfCurrentPhoto.Value = userPhoto;
                }
                else
                {
                    imgProfilePreview.ImageUrl = "https://cdn-icons-png.flaticon.com/512/3135/3135715.png";
                    hfCurrentPhoto.Value = "";
                }

                if (ddlFitnessGoal.Items.FindByValue("" + ds.Tables[0].Rows[0]["FitnessGoal"]) != null)
                {
                    ddlFitnessGoal.SelectedValue = "" + ds.Tables[0].Rows[0]["FitnessGoal"];
                }
                else
                {
                    ddlFitnessGoal.SelectedIndex = 0;
                }

                // ── Dynamic Membership Status Banner & Checklist Icon ──
                string payStatus = "" + ds.Tables[0].Rows[0]["PaymentStatus"];
                if (payStatus == "Approved")
                {
                    lblStatusBanner.Text = "<div style='background:#dcfce7;border:1.5px solid #bbf7d0;border-radius:10px;padding:14px 20px;margin-bottom:20px;display:flex;align-items:center;gap:12px;'>" +
                        "<i class='fa-solid fa-circle-check' style='color:#16a34a;font-size:20px;'></i>" +
                        "<div><strong style='color:#15803d;font-size:14px;'>Membership Active!</strong>" +
                        "<span style='color:#166534;font-size:12.5px;margin-left:8px;'>Your plan is approved and active. Welcome to TITAN FITNESS!</span></div></div>";
                    lblPlanStatusIcon.Text = "<i class='fa-solid fa-circle-check check-icon-done'></i>";
                }
                else
                {
                    lblStatusBanner.Text = "<div style='background:#fef3c7;border:1.5px solid #fde68a;border-radius:10px;padding:14px 20px;margin-bottom:20px;display:flex;align-items:center;gap:12px;'>" +
                        "<i class='fa-solid fa-clock' style='color:#d97706;font-size:20px;'></i>" +
                        "<div><strong style='color:#92400e;font-size:14px;'>Payment Pending Approval</strong>" +
                        "<span style='color:#78350f;font-size:12.5px;margin-left:8px;'>Please visit the gym to pay. Admin will activate your plan after verification.</span></div></div>";
                    lblPlanStatusIcon.Text = "<i class='fa-regular fa-circle check-icon-pending'></i>";
                }
            }
            con.Close();
        }

        protected void btnSaveProfile_Click(object sender, EventArgs e)
        {
            hfActiveTab.Value = "tab-profile";
            EnsurePhotoColumn();

            string photoPath = hfCurrentPhoto.Value;

            if (fuProfilePhoto.HasFile)
            {
                string ext = System.IO.Path.GetExtension(fuProfilePhoto.FileName).ToLower();
                if (ext == ".jpg" || ext == ".jpeg" || ext == ".png" || ext == ".webp")
                {
                    string fileName = "user_" + DateTime.Now.Ticks + ext;
                    string folderPath = Server.MapPath("~/uploads/");
                    if (!System.IO.Directory.Exists(folderPath))
                    {
                        System.IO.Directory.CreateDirectory(folderPath);
                    }
                    fuProfilePhoto.SaveAs(folderPath + fileName);
                    photoPath = "uploads/" + fileName;
                }
                else
                {
                    lblMessage.Text = "Please upload a valid image file (.jpg, .jpeg, .png, .webp)!";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    return;
                }
            }

            getcon();

            cmd = new SqlCommand("UPDATE [Members] SET FullName='" + txtFullName.Text + "', Phone='" + txtPhone.Text + "', Height='" + txtHeight.Text + "', Weight='" + txtWeight.Text + "', FitnessGoal='" + ddlFitnessGoal.SelectedValue + "', Address='" + txtAddress.Text + "', Photo='" + photoPath + "' WHERE Email='" + Session["UserEmail"] + "'", con);
            int i = cmd.ExecuteNonQuery();

            con.Close();

            if (i > 0)
            {
                lblMessage.Text = "Profile updated successfully!";
                lblMessage.ForeColor = System.Drawing.Color.Green;
            }
            else
            {
                lblMessage.Text = "Update failed! Please try again.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }

            gridfill();
        }
    }
}
