﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using Newtonsoft.Json;

using Utilitarios;
using Data;


namespace Logica
{
    public class LRecuperarcontrasena
    {
        public string enviar_token(URegistro recuperar)
        {
            recuperar = new DAOLogin().verificarusuarioparatoken(recuperar);
            string msj = null;
            if (recuperar.Usuario == null)
            {
                msj = "Usuario no se encuentra reistrado";
            }
            else if (recuperar.Correo == null)
            {
                msj = "Verifique si su correo electronico fue con el que se registro";
            }
            else if ((recuperar.Usuario != null) && (recuperar.Correo != null))
            {
                UToken validartoken = new DAOSeguridad().getTokenusuario(recuperar.Id);

                if (validartoken != null)
                {
                    msj = "Ya existe una recuperacion de contraseña activa, porfavor espere a que pueda realizar una den uevo";
                }
                else
                {
                    UToken token = new UToken();
                    token.Fecha_inicio = DateTime.Now;
                    token.Fecha_caducidad = DateTime.Now.AddHours(1);
                    token.User_id = recuperar.Id;

                    token.Tokengenerado = encriptar(JsonConvert.SerializeObject(token));//convierte en cadena JSON clase Token obj token
                    new DAOSeguridad().insertartoken(token);
                    Mailrecuperarcontrasena mail = new Mailrecuperarcontrasena();
                    string linkacceso = "Su link de acceso es: " + "https://occibanaisw.tk/Vew/Reactivarcuenta.aspx?" + token.Tokengenerado;
                    mail.enviarmail(recuperar.Correo, token.Tokengenerado, linkacceso);
                    msj = "Verifique su correo electónico para continuar con la recuperacion de contraseña";
                }
            }
            return msj;
        }

        private string encriptar(string input)
        {
            SHA256CryptoServiceProvider provider = new SHA256CryptoServiceProvider();
            byte[] inputBytes = Encoding.UTF8.GetBytes(input);
            byte[] hashedBytes = provider.ComputeHash(inputBytes);
            StringBuilder output = new StringBuilder();

            for (int i = 0; i < hashedBytes.Length; i++)
            {
                output.Append(hashedBytes[i].ToString("x2").ToLower());
            }
            return output.ToString();
        }
    }
}
