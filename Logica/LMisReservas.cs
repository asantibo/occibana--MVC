﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Utilitarios;
using Data;

namespace Logica
{
    public class LMisReservas
    {
        public UMisReservas accionCalificarComentar(int idreserva, string accion)
        {
            UMisReservas mensaje = new UMisReservas();
            if (accion == "calificarreserva")
            {
                
                UReserva inforeserva = new UReserva();
                inforeserva.Id = idreserva;
                inforeserva = new DAOReserva().inforeserva(inforeserva);
                UHotel hotelinfo = new UHotel();
                hotelinfo.Idhotel = int.Parse((inforeserva.Idhotel).ToString());
                mensaje.Infohotel = hotelinfo;
                //Session["visitarhotel"] = hotelinfo;
                mensaje.URL1 = "ComentariosHotel.aspx";
            }
            else if (accion == "cancelarreserva")

            {
                UReserva inforeserva = new UReserva();
                inforeserva.Id = idreserva;
                inforeserva = new DAOReserva().inforeserva(inforeserva);
                if (inforeserva.Fecha_salida <= DateTime.Now)
                {
                    mensaje.Mensaje = "No es posible eliminar una reserva ya realizada";
                    //this.RegisterStartupScript("mensaje", "<script type='text/javascript'>alert('No es posible eliminar una reserva ya realizada');</script>");
                }
                else if (inforeserva.Fecha_llegada > DateTime.Now)
                {
                    new DAOReserva().deleteReserva(inforeserva);
                    mensaje.Mensaje = "Reserva eliminada con exito";
                    //this.RegisterStartupScript("mensaje", "<script type='text/javascript'>alert('Reserva eliminada con exito');</script>");
                }
                else if ((inforeserva.Fecha_llegada <= DateTime.Now) && (inforeserva.Fecha_salida >= DateTime.Now))
                {
                    mensaje.Mensaje = "No es posible realizar la eliminación";
                    //this.RegisterStartupScript("mensaje", "<script type='text/javascript'>alert('No es posible realizar la eliminación');</script>");
                }
            }


            return mensaje;
        }
    }
}
