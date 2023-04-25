using Bookstore_Web.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Drawing.Printing;

namespace Bookstore_Web.Controller
{

    public class Factura
    {

        public List<f.factura> GetBooks()
        {
            List<f.factura> bookList = new List<f.factura>();

            DatabaseHelper.Database db = new DatabaseHelper.Database();

            DataTable ds = db.GetBooks();

            return ConvertDSToList(ds);

        }

        public void Imprimir()
        {
            PrintDocument ticket = new PrintDocument();
            ticket.PrintPage += new PrintPageEventHandler(Dibujarticket);
            ticket.Print();
        }

        private void Dibujarticket(object sender, PrintPageEventArgs e)
        {
            // Definimos las fuentes y los estilos de texto
            Font fuenteTitulo = new Font("Arial", 14, FontStyle.Bold);
            Font fuenteNormal = new Font("Arial", 10, FontStyle.Regular);

            // Definimos las posiciones iniciales de los elementos en la ticket
            int x = 50;
            int y = 50;

            // Dibujamos los elementos de la ticket
            e.Graphics.DrawString("ticket", fuenteTitulo, Brushes.Black, x, y);
            y += 50;
            e.Graphics.DrawString("Cliente: " + Cliente, fuenteNormal, Brushes.Black, x, y);
            y += 25;
            e.Graphics.DrawString("Producto: " + Book, fuenteNormal, Brushes.Black, x, y);
            y += 25;
            e.Graphics.DrawString("Precio: $" + Precio, fuenteNormal, Brushes.Black, x, y);
            y += 25;
            e.Graphics.DrawString("Cantidad: " + Cantidad, fuenteNormal, Brushes.Black, x, y);
        }
    }
}