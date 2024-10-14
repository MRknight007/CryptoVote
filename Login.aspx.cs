using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Net.Mail; 

public partial class Default2 : System.Web.UI.Page
{
    string con = ConfigurationManager.ConnectionStrings["VoteConn"].ConnectionString;
    SqlConnection conn;
    SqlCommand comm;
    SqlDataAdapter adp;
    DataTable dt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
      
       conn = new SqlConnection(con);
    }
  
    protected void btnsignin_Click(object sender, EventArgs e)
    {
        //if (DropDownList1.SelectedValue == "ADMIN")
        if (selectuser.Value == "ADMIN")
        {
            DataTable dt = new DataTable();
            using (SqlCommand cmd = new SqlCommand("select * from Admin_master where User_id=@username_ and Password=@password_", conn))
            {
                //password_,username_
                cmd.Parameters.AddWithValue("@username_", userid.Value);

                cmd.Parameters.AddWithValue("@password_", password.Value);
                using (SqlDataAdapter adp = new SqlDataAdapter(cmd))
                {
                    adp.Fill(dt);
                }
                if (dt.Rows.Count > 0)
                {
                    Session["id"] = dt.Rows[0].ItemArray[0];
                    //Response.Redirect("admin/home.aspx");
                    Response.Redirect("Admin/Default.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Invalid Details!!!')</script>");
                }
            }
        }
        else if (selectuser.Value == "VOTER")
        {

            using (SqlCommand cmd1 = new SqlCommand("select * from date_master where getdate() between start_date and stop_date", conn))
            {
                SqlDataAdapter sda1 = new SqlDataAdapter(cmd1);
                DataTable dt11 = new DataTable();
                sda1.Fill(dt11);
                if(dt11.Rows.Count>0)
                {

                    //To validate voter
                    using (SqlCommand cmdselect = new SqlCommand("select Voter_id from Vote_details where Voter_id=(select V_id from Voter_master where User_id='" + userid.Value + "')", conn))
                    {
                        SqlDataAdapter sda = new SqlDataAdapter(cmdselect);
                        DataTable dt1 = new DataTable();
                        sda.Fill(dt1);

                        if (dt1.Rows.Count > 0)
                        {
                            lblmsg.InnerText = "You Already Vote..";
                            userid.Value = "";
                            password.Value = "";


                        }
                        else
                        {
                            var chars = "QWERTYUIOPLKJHGFDSAZXCVBNMqwertyuioplkjhgfdsazxcvbnm0987654321";
                            var stringargs = new char[8];
                            var random = new Random();
                            for (int i = 0; i < stringargs.Length; i++)
                            {
                                stringargs[i] = chars[random.Next(chars.Length)];
                            }
                            string otp = new String(stringargs);

                            DataTable dt = new DataTable();
                            using (SqlCommand cmd = new SqlCommand("select * from Voter_master where User_id=@Userid and Password=@Password", conn))
                            {
                                //password_,username_
                                cmd.Parameters.AddWithValue("@Userid", userid.Value);
                                cmd.Parameters.AddWithValue("@Password", password.Value);
                                using (SqlDataAdapter adp = new SqlDataAdapter(cmd))
                                {
                                    adp.Fill(dt);
                                }
                                if (dt.Rows.Count > 0)
                                {
                                    Session["v_id"] = dt.Rows[0].ItemArray[0];
                                    Session["email"] = dt.Rows[0]["Email_id"].ToString();
                                    //string otp = "";
                                   
                                    using(SqlCommand cmd2 = new SqlCommand("insert into otp_master (user_id,otp) values(@id,@otp)",conn))
                                    {
                                        cmd2.Parameters.AddWithValue("@id", Session["v_id"]);
                                        cmd2.Parameters.AddWithValue("@otp", otp);
                                        conn.Open();
                                        cmd2.ExecuteNonQuery();
                                        conn.Close();
                                    }
                                    sms1(otp);
                                    Response.Redirect("Voter/otp.aspx");
                                }
                                else
                                {
                                    Response.Write("<script>alert('Invalid Details!!!')</script>");
                                }
                            }
                        }
                    }
                }
                else
                {
                    Response.Write("<script>alert('Time Not Valid !!!')</script>");
                }

            }



        }
    }
    protected void btnhome_Click(object sender, EventArgs e)
    {
        Response.Redirect("../Home.aspx");
    }

    public void sms1(string otp)
    {
        try
        {
            SmtpClient smtpserver = new SmtpClient();
            MailMessage mail = new MailMessage();
            smtpserver.Credentials = new System.Net.NetworkCredential("projectsam22220@gmail.com", "22220sam");
            smtpserver.Port = 587;
            smtpserver.EnableSsl = true;
            smtpserver.Host = "smtp.gmail.com";
            mail = new MailMessage();
            mail.From = new MailAddress("projectsam22220@gmail.com");
            mail.To.Add(Session["email"].ToString());
            mail.Subject = "ALERT";
            mail.Body = "Your Otp is :" +otp;
            smtpserver.Send(mail);

        }
        catch (Exception e)
        {
            Response.Write("<script>alert('OTP not sent !!!')</script>");
        }
    }


}