﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Utilitarios;
using Data;

namespace Logica
{
    public class LPerfil
    {
        public UPerfil cargardatos(URegistro datosSession)
        {
            UPerfil perfil = new UPerfil();
            perfil.Datos = new URegistro();
            perfil.Datos.Nombre = datosSession.Nombre;
            perfil.Datos.Correo = datosSession.Correo;
            perfil.Datos.Telefono = datosSession.Telefono;
            perfil.Datos.Usuario = datosSession.Usuario;
            perfil.Datos.Fotoperfil = datosSession.Fotoperfil;

            if (perfil.Datos.Fotoperfil == null)
            {
                perfil.Datos.Fotoperfil = "~/Vew/img/perfilvacio.jpg";
            }

            if (perfil.Datos.Idestado == 1) //1 Es con menbresia, 0 sin membresia
            {
                var verificar = new DAOSeguridad().verificarvencimientomembresia(perfil.Datos.Id);
                if (verificar != null)
                {
                    perfil.Datos.Id =datosSession.Id;
                    perfil.Datos.Idestado = 0;
                    new DAOSeguridad().actualizarmembresia(perfil.Datos);
                    perfil.URL1 = "Perfil.aspx";
                }
            }
            else
            {
                //B_ComprarMembresia.Visible = true;
                //B_ActualizarMembresia.Visible = false;
                //B_AgregarHotel.Visible = false;
                perfil.Mensaje = "Sin Membresia";
                //L_EstadoMembresia.Text = "Sin Membresia";
                //B_mishoteles.Visible = false;
            }

            return perfil;
        }
        public string cerrarsession(URegistro sessionId)
        {
            new DAOSeguridad().cerrarAcceso(sessionId.Id);
            string url = "Login.aspx";
            return url;
        }
    }
}
