using Bookstore_Web.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Security.Policy;
using System.Web;
using m = Bookstore_Web.Model;

namespace Bookstore_Web.Controller
{
    public class Books
    {
        public List<m.Book> GetBooks()
        {
            List<m.Book> bookList = new List<m.Book>();

            DatabaseHelper.Database db = new DatabaseHelper.Database();

            DataTable ds = db.GetBooks();

            return ConvertDSToList(ds);

        }

        public List<m.Book> GetInfoBook(int Id)
        {
            List<m.Book> bookList = new List<m.Book>();

            DatabaseHelper.Database db = new DatabaseHelper.Database();

            DataTable ds = db.GetInfoBook(Id);

            return ConvertDSToList(ds);
        }

        public List<m.Book> GetSearchedBook(string search)
        {
            List<m.Book> bookList = new List<m.Book>();

            DatabaseHelper.Database db = new DatabaseHelper.Database();

            DataTable ds = db.GetSearchedBook(search); 

            return ConvertDSToList(ds);
        }

        public bool SaveFavoriteBook(m.Book book)
        {
            try
            {
                DatabaseHelper.Database db = new DatabaseHelper.Database();

                db.SaveFavoriteBook(book);

                return true;
            }
            catch
            {
                return false;
            }
        }

        public bool SaveShoppingCart(m.Book book)
        {
            try
            {
                DatabaseHelper.Database db = new DatabaseHelper.Database();

                db.SaveShoppingCart(book);

                return true;
            }
            catch
            {
                return false;
            }
        }

        public List<m.Book> GetFavoriteBooks(LoginResponsePayload session)
        {
            List<m.Book> bookList = new List<m.Book>();

            DatabaseHelper.Database db = new DatabaseHelper.Database();

            DataTable ds = db.GetFavoriteBooks(session.email);

            return ConvertDSToList(ds);
        }

        public List<m.Book> GetShoppingCart(LoginResponsePayload session)
        {
            List<m.Book> bookList = new List<m.Book>();

            DatabaseHelper.Database db = new DatabaseHelper.Database();

            DataTable ds = db.GetShoppingCart(session.email);

            return ConvertDSToList(ds);
        }

        public bool DeleteFavoriteBook(string Email, int bookId)
        {
            try
            {
                DatabaseHelper.Database db = new DatabaseHelper.Database();

                db.DeleteFavoriteBook(Email, bookId);

                return true;
            }
            catch
            {
                return false;
            }
        }

        public bool DeleteCartBook(string Email, int bookId)
        {
            try
            {
                DatabaseHelper.Database db = new DatabaseHelper.Database();

                db.DeleteCartBook(Email, bookId);

                return true;
            }
            catch
            {
                return false;
            }
        }
        public List<m.Book> ConvertDSToList(DataTable ds)
        {
            List<m.Book> bookList = new List<m.Book>();

            foreach (DataRow row in ds.Rows)
            {
                bookList.Add(new m.Book
                {
                    Id = Convert.ToInt16(row["Id"]),
                    ISBN = row["ISBN"].ToString(),
                    Title = row["Title"].ToString(),
                    Author = row["Author"].ToString(),
                    ReleaseDate = Convert.ToDateTime(row["ReleaseDate"]).ToShortDateString(),
                    Description = row["Description"].ToString(),
                    Photo = row["Photo"].ToString(),
                    Price = Convert.ToDecimal(row["Price"])
                });
            }

            return bookList;
        }

    }
}