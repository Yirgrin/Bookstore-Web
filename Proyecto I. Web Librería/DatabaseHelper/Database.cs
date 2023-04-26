using Bookstore_Web.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using m = Bookstore_Web.Model;

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

        public void SaveFavoriteBook(m.Book book)
        {
            List<SqlParameter> param = new List<SqlParameter>()
            {
                new SqlParameter("@bookId", book.Id),
                new SqlParameter("@Email", book.email),
            };

            this.ExecuteQuery("[dbo].[spSaveFavoriteBook]", param);
        }

        public DataTable GetFavoriteBooks(string Email)
        {

            List<SqlParameter> param = new List<SqlParameter>()
            {
                new SqlParameter("@Email", Email),
            };

            return this.Fill("[dbo].[spGetFavoriteBooks]", param);
        }

        public DataTable GetShoppingCart(string Email)
        {

            List<SqlParameter> param = new List<SqlParameter>()
            {
                new SqlParameter("@Email", Email),
            };

            return this.Fill("[dbo].[spGetShoppingCart]", param);
        }


        public void DeleteFavoriteBook(string Email, int bookId)
        {
            List<SqlParameter> param = new List<SqlParameter>()
            {
                new SqlParameter("@Email", Email),
                new SqlParameter("@bookId", bookId),
            };

            this.ExecuteQuery("[dbo].[spDeleteFavoriteBook]", param);
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

        public void ExecuteQuery(string storedProcedure, List<SqlParameter> param)
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

                    cmd.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}