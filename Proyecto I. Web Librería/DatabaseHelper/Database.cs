using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Bookstore_Web.DatabaseHelper
{
    public class Database
    {
 
        SqlConnection connection = new SqlConnection("Data Source=localhost;Initial Catalog=BookstoreWeb;Integrated Security=True");


    //Método para traer de la DB todos los libros
        public DataTable GetBooks()
        {
            return this.Fill("[dbo].[spGetBooks]", null);
        }


    //Método para traer de la DB un libro en específico
        public DataTable GetInfoBook(int Id)
        {

            List<SqlParameter> param = new List<SqlParameter>()
            {
                new SqlParameter("@Id", Id),
            };

            return this.Fill ("[dbo].[spGetInfoBook]", param);
        }


        public DataTable GetSearchedBook(string search)
        {

            List<SqlParameter> param = new List<SqlParameter>()
            {
                new SqlParameter("@search", search),
            };

            return this.Fill("[dbo].[spGetSearchedBook]", param);
        }


        //Conexión a la BD Fill, devuelve datos
        //Conexión a la BD ExecuteNonQuery, elimina, inserta, mopdifica en la base de datos...
        public DataTable Fill(string storedProcedure, List<SqlParameter> param)
        {
            try
            {
                using (this.connection)
                {
                    connection.Open();
                    SqlCommand cmd = connection.CreateCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = storedProcedure;

                    if (param != null)
                    {
                        foreach (SqlParameter p in param)
                        {
                            cmd.Parameters.Add(p);
                        }
                    }

                    DataTable ds = new DataTable();
                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    adapter.Fill(ds);
                    return ds;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}