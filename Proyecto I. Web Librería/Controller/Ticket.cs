using System;
using System.Drawing;
using System.Drawing.Printing;

namespace Bookstore_Web.Controller
{

    public class Ticket
    {
        public string Cliente { get; set; }
        public string Producto { get; set; }
        public decimal Precio { get; set; }
        public int Cantidad { get; set; }

        public Ticket(string cliente, string producto, decimal precio, int cantidad)
        {
            Cliente = cliente;
            Producto = producto;
            Precio = precio;
            Cantidad = cantidad;
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
            e.Graphics.DrawString("Producto: " + Producto, fuenteNormal, Brushes.Black, x, y);
            y += 25;
            e.Graphics.DrawString("Precio: $" + Precio, fuenteNormal, Brushes.Black, x, y);
            y += 25;
            e.Graphics.DrawString("Cantidad: " + Cantidad, fuenteNormal, Brushes.Black, x, y);
        }
    }
}