﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace StockManagementSystem.Models
{
   public class FormCommon
    {
       public bool QueryOperation(string insert,SqlConnection connection)
        {
            SqlCommand command = new SqlCommand(insert, connection);
            connection.Open();
            bool isAdded = command.ExecuteNonQuery() > 0;
            connection.Close();

           return isAdded;
        }

        //fill gridView with data from db
        public void FillGrid(string fetch, SqlConnection connection, DataGridView myGridView )
        {
          
           SqlCommand command = new SqlCommand(fetch, connection);
            connection.Open();
            DataTable dt = new DataTable();
            SqlDataAdapter dataAdapter = new SqlDataAdapter(command);
            dataAdapter.Fill(dt);
            myGridView.DataSource = dt;
            connection.Close();
        }

        //fill combobox with data from db
        public void FillComboBox(string fetch, SqlConnection connection, ComboBox myComboBox)
        {
           
            SqlCommand command = new SqlCommand(fetch, connection);
            connection.Open();
            DataTable dt = new DataTable();
            SqlDataAdapter dataAdapter = new SqlDataAdapter(command);
            dataAdapter.Fill(dt);
            myComboBox.DataSource = dt;
            connection.Close();
        }

        //input validation for number only input
        public void ValidationNumberOnly(KeyPressEventArgs e, Object sender)
        {
            if (!char.IsControl(e.KeyChar) && !char.IsDigit(e.KeyChar) &&
                (e.KeyChar != '.'))
            {
                e.Handled = true;
            }

            // only allow one decimal point
            if ((e.KeyChar == '.') && ((sender as TextBox).Text.IndexOf('.') > -1))
            {
                e.Handled = true;
            }
        }


        //Data read return bool
        public bool Reader(SqlConnection connection, string search)
        {
            connection.Open();
            SqlCommand command = new SqlCommand(search, connection);
            SqlDataReader reader = command.ExecuteReader();
            bool result = reader.Read();
            connection.Close();

            return result;
        }

        //serial numbering in gridView rowHeader
        public void SerializeGrid(object sender )
        {
            DataGridView thisView = sender as DataGridView;
            if (null != thisView)
            {
                foreach (DataGridViewRow r in thisView.Rows)
                {
                    thisView.Rows[r.Index].HeaderCell.Value = (r.Index + 1).ToString();
                }
            }
        }

    }
}
