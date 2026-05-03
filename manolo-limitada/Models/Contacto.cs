using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace manolo_limitada.Models
{
    public class Contacto
    {
        public string Cedula { get; set; }

        public string Nombre { get; set; }

        public string Apellidos { get; set; }

        public DateTime FechaNacimiento { get; set; }

        public string Telefono { get; set; }

        public string Direccion { get; set; }

        public int Edad
        {
            get
            {
                int edad = DateTime.Now.Year - FechaNacimiento.Year;

                if (DateTime.Now.DayOfYear < FechaNacimiento.DayOfYear)
                    edad--;

                return edad;
            }
        }
    }
}