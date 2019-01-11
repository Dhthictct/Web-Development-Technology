using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ajax
{
    public partial class WebFormAjax : System.Web.UI.Page
    {
        SqlConnection sqlcon;
        SqlCommand sqlcom;
        string strCon = "Data Source=(local);Database=China;Uid=sa;Pwd=123456";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DropDownListProvince_SelectedIndexChanged(object sender, EventArgs e)
        {
            string province = DropDownListProvince.SelectedValue.ToString();
            string sqlstr = "select city from cities where provinceid in (select provinceid from provinces  where province='" + province + "')";
            sqlcon = new SqlConnection(strCon);
            SqlDataAdapter myda = new SqlDataAdapter(sqlstr, sqlcon);
            DataSet myds = new DataSet();
            sqlcon.Open();
            myda.Fill(myds, "cities");
            int len = myds.Tables[0].Rows.Count;
            DropDownListCity.Items.Clear();
            //ListItem li = new ListItem("请选择", "0");
            //DropDownListCity.Items.Add(li);
            for (int i = 0; i < len; ++i)
            {
                string txt = (string)myds.Tables[0].Rows[i][0];
                string val = i.ToString();
                ListItem li = new ListItem(txt, val);
                DropDownListCity.Items.Add(li);
            }
            sqlcon.Close();
        }
    }
}