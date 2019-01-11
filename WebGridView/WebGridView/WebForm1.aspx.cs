using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Web.Security;

namespace WebGridView
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        SqlConnection sqlcon;
        SqlCommand sqlcom;
        string strCon = "Data Source=(local);Database=cinema;Uid=sa;Pwd=123456";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bind();
            }
        }
        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            bind();
        }

        //删除
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string sqlstr = "delete from file_mess where film_id='" + GridView1.DataKeys[e.RowIndex].Value.ToString() + "'";
            sqlcon = new SqlConnection(strCon);
            sqlcom = new SqlCommand(sqlstr, sqlcon);
            sqlcon.Open();
            sqlcom.ExecuteNonQuery();
            sqlcon.Close();
            bind();
        }

        //更新
        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            sqlcon = new SqlConnection(strCon);
            string sqlstr = "update file_mess set film_name='"
            + ((TextBox)(GridView1.Rows[e.RowIndex].Cells[1].Controls[0])).Text.ToString().Trim() + "',mins='"
            + ((TextBox)(GridView1.Rows[e.RowIndex].Cells[2].Controls[0])).Text.ToString().Trim() + "' where film_id='"
            + GridView1.DataKeys[e.RowIndex].Value.ToString() + "'";
            sqlcom = new SqlCommand(sqlstr, sqlcon);
            sqlcon.Open();
            sqlcom.ExecuteNonQuery();
            sqlcon.Close();
            GridView1.EditIndex = -1;
            bind();
        }

        //取消
        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            bind();
        }

        //绑定
        public void bind()
        {
            string sqlstr = "select * from file_mess";
            sqlcon = new SqlConnection(strCon);
            SqlDataAdapter myda = new SqlDataAdapter(sqlstr, sqlcon);
            DataSet myds = new DataSet();
            sqlcon.Open();
            myda.Fill(myds, "file_mess");
            GridView1.DataSource = myds;
            GridView1.DataKeyNames = new string[] { "film_id" };//主键
            GridView1.DataBind();
            sqlcon.Close();
        }

        protected void Button_insert_Click(object sender, EventArgs e)
        {
            string strid = TextBox_ID.Text.ToString();
            string strname = TextBox_name.Text.ToString();
            string strmins = TextBox_mins.Text.ToString();
            sqlcon = new SqlConnection(strCon);
            string sqlstr = "insert into file_mess values('" + strid + "','" + strname + "','" + strmins + "')";
            sqlcom = new SqlCommand(sqlstr, sqlcon);
            sqlcon.Open();
            sqlcom.ExecuteNonQuery();
            sqlcon.Close();
            GridView1.EditIndex = -1;
            bind();
        }

        protected void Button_select_Click(object sender, EventArgs e)
        {
            string strid = TextBox_ID.Text.ToString();
            sqlcon = new SqlConnection(strCon);
            string sqlstr = "select film_id, film_name, mins from file_mess where film_id = '" + strid + "'";
            //sqlcom = new SqlCommand(sqlstr, sqlcon);
            SqlDataAdapter myda = new SqlDataAdapter(sqlstr, sqlcon);
            DataSet myds = new DataSet();
            sqlcon.Open();
            //sqlcom.ExecuteNonQuery();
            myda.Fill(myds,"file_mess");
            GridView1.DataSource = myds;
            GridView1.DataKeyNames = new string[] { "film_id" };//主键
            GridView1.DataBind();
            GridView1.EditIndex = -1;
            sqlcon.Close();
        }

        protected void Button_selectall_Click(object sender, EventArgs e)
        {
            bind();
        }
    }
}