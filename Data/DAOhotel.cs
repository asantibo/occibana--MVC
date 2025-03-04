﻿using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;

using Utilitarios;

namespace Data
{
    public class DAOhotel
    {
        public List<UHotelMunicipio> municipio()
        {

            return new Mapeo().hotelmunicipio.ToList();
        }
        public List<UHotelZona> zona()
        {
            return new Mapeo().hotelzona.ToList();
        }
        //insert registro
        public void insertHotel(UHotel hotelE)
        {
            using (var db = new Mapeo())
            {
                db.hotel.Add(hotelE);
                db.SaveChanges();
            }
        }

        //lista de hoteles destacados
        public List<UHotel> hotelesdestacados()
        {
            using (var db = new Mapeo())
            {
                List<UHotel> hotelesdestacados = (from h in db.hotel
                                                 orderby (h.Promediocalificacion != null ? h.Promediocalificacion : -1) descending

                                                 //where h.Numhabitacion > 4
                                                 select new
                                                 {
                                                     h
                                                 }).Take(6).ToList().Select(m => new UHotel
                                                 {
                                                     Idhotel = m.h.Idhotel,
                                                     Nombre = m.h.Nombre,
                                                     Imagen = m.h.Imagen,
                                                     Promediocalificacion = m.h.Promediocalificacion,
                                                 }).ToList();
                return hotelesdestacados;
            }
        }

        //lista de hoteles por usuario 
        //(hoteles que se muestran en index)
        public List<UHotel> hotelesregistrados(UFiltro consulta)
        {
            int num = 0;

            if (consulta != null && consulta.numpersonas != null)
            {
                num = int.Parse((consulta.numpersonas).ToString());
            }

            if (consulta != null && (consulta.fecha_antesde != null && consulta.fecha_despuesde != null))
            {

                using (var db = new Mapeo())
                {
                    List<UHotel> elementos = (from h in db.hotel
                                             join hm in db.hotelmunicipio on h.Idmunicipio equals hm.Idmunicipio
                                             join hz in db.hotelzona on h.Idzona equals hz.Idzona
                                             //join rh in db.reserva on h.Idhotel equals rh.Idhotel

                                             select new
                                             {
                                                 h,
                                                 hm,
                                                 hz,
                                                 //rh,
                                             }).OrderBy(h => h.h.Nombre).ToList().Select(m => new UHotel
                                             {

                                                 NumHabitDisponibles = ((db.habitacion.Where(x => x.Idhotel == m.h.Idhotel).Count()) - (db.reserva.Where(x => (x.Idhotel == m.h.Idhotel) &&
                                                                        ((consulta.fecha_despuesde >= x.Fecha_llegada && consulta.fecha_despuesde <= x.Fecha_salida) || (consulta.fecha_antesde >= x.Fecha_salida && consulta.fecha_antesde <= x.Fecha_salida))).Count()) < 0 ? 0
                                                                        : (db.habitacion.Where(x => x.Idhotel == m.h.Idhotel).Count()) - (db.reserva.Where(x => (x.Idhotel == m.h.Idhotel) &&
                                                                        ((consulta.fecha_despuesde >= x.Fecha_llegada && consulta.fecha_despuesde <= x.Fecha_salida) || (consulta.fecha_antesde >= x.Fecha_salida && consulta.fecha_antesde <= x.Fecha_salida))).Count())),

                                                 Promediocalificacion = m.h.Promediocalificacion,
                                                 Idhotel = m.h.Idhotel,
                                                 Nombre = m.h.Nombre,
                                                 Precionoche = m.h.Precionoche,
                                                 PrecioNocheDoble = m.h.PrecioNocheDoble,
                                                 PrecioNochePremium = m.h.PrecioNochePremium,
                                                 Imagen = m.h.Imagen,
                                                 Municipio = m.hm.Nombre,
                                                 Zona = m.hz.Nombre,
                                                 //Fecha_antesde = m.rh.Fecha_salida,
                                                 //Fecha_despuesde = m.rh.Fecha_llegada,

                                             }).Where(x => x.NumHabitDisponibles > 0).ToList();
                    return elementos;
                }


            }
            else
            {
                using (var db = new Mapeo())
                {

                    List<UHotel> elementos = (from h in db.hotel
                                             join hm in db.hotelmunicipio on h.Idmunicipio equals hm.Idmunicipio
                                             join hz in db.hotelzona on h.Idzona equals hz.Idzona

                                             //join rh in db.reserva on h.Idhotel equals rh.Idhotel
                                             //join hhab in db.habitacion on h.Idhotel equals hhab.Idhotel

                                             select new
                                             {
                                                 h,
                                                 hm,
                                                 hz,

                                             }).OrderBy(h => h.h.Nombre).ToList().Select(m => new UHotel
                                             {

                                                 NumHabitDisponibles = db.habitacion.Where(x => x.Idhotel == m.h.Idhotel).Count(),
                                                 Promediocalificacion = m.h.Promediocalificacion,
                                                 Idhotel = m.h.Idhotel,
                                                 Nombre = m.h.Nombre,
                                                 Precionoche = m.h.Precionoche,
                                                 PrecioNocheDoble = m.h.PrecioNocheDoble,
                                                 PrecioNochePremium = m.h.PrecioNochePremium,
                                                 Imagen = m.h.Imagen,
                                                 Municipio = m.hm.Nombre,
                                                 Zona = m.hz.Nombre,
                                                 NumMaxPersonas = db.habitacion.Where(x => x.Numpersonas == num && x.Idhotel == m.h.Idhotel).Count() == 0 ? 0 : 1,

                                             }).Where(x => num > 0 ? x.NumMaxPersonas > 0 : x.NumMaxPersonas == 0).ToList();
                    if (consulta == null)
                    {
                        return elementos;
                    }

                    if (consulta.calificacion != null)
                    {
                        if (consulta.calificacion.Equals("--Seleccionar--"))
                        {
                            elementos = elementos.Where(x => (x.Promediocalificacion <= 5) || (x.Promediocalificacion == null)).ToList();//&& (x.Promediocalificacion == null)
                        }
                        else
                        {
                            elementos = elementos.Where(x => x.Promediocalificacion == (int.Parse(consulta.calificacion))).ToList();
                        }

                    }

                    if (consulta.nombrehotel != null)
                    {
                        elementos = elementos.Where(x => x.Nombre.ToUpper().Equals(consulta.nombrehotel)).ToList();
                    }
                    if (consulta.preciomin != null && consulta.preciomax != null)
                    {
                        if (consulta.tipo != null)
                        {
                            if (consulta.tipo.Equals("Basica"))
                            {
                                elementos = elementos.Where(x => (x.Precionoche <= consulta.preciomax && x.Precionoche >= consulta.preciomin)).ToList();
                            }
                            if (consulta.tipo.Equals("Doble"))
                            {
                                elementos = elementos.Where(x => (x.PrecioNocheDoble <= consulta.preciomax && x.PrecioNocheDoble >= consulta.preciomin)).ToList();
                            }
                            if (consulta.tipo.Equals("Premium"))
                            {
                                elementos = elementos.Where(x => (x.PrecioNochePremium <= consulta.preciomax && x.PrecioNochePremium >= consulta.preciomin)).ToList();
                            }

                        }
                        else if (consulta.tipo == null)
                        {
                            elementos = elementos.Where(x => x.Precionoche != null && x.Precionoche != null).ToList();
                        }
                    }
                    else
                    {
                        if (consulta.preciomax != null && consulta.preciomin == null)
                        {
                            elementos = elementos.Where(x => x.Precionoche <= consulta.preciomax).ToList();
                        }
                        if (consulta.preciomin != null && consulta.preciomax == null)
                        {
                            elementos = elementos.Where(x => x.Precionoche >= consulta.preciomin).ToList();
                        }
                    }
                    if (consulta.zona != null && consulta.municipio != null)
                    {
                        elementos = elementos.Where(x => (x.Municipio.Equals(consulta.municipio)) && (x.Zona.Equals(consulta.zona))).ToList();
                    }
                    else
                    {
                        if (consulta.municipio != null && consulta.zona == null)
                        {
                            elementos = elementos.Where(x => x.Municipio.Equals(consulta.municipio)).ToList();
                        }
                        else
                        if (consulta.zona != null && consulta.municipio == null)
                        {
                            elementos = elementos.Where(x => x.Zona.Equals(consulta.zona)).ToList();
                        }
                    }

                    return elementos;
                }
            }
        }
        //select info hotel panel hotel
        public UHotel infohotel(UHotel hotelE)
        {
            return new Mapeo().hotel.Where(x => x.Idhotel == hotelE.Idhotel).FirstOrDefault();
        }
        //select zona
        public UHotelZona zona(UHotel hotelE)
        {
            return new Mapeo().hotelzona.Where(x => x.Idzona.Equals(hotelE.Idzona)).FirstOrDefault();
        }
        //select municipio
        public UHotelMunicipio municipio(UHotel hotelE)
        {
            return new Mapeo().hotelmunicipio.Where(x => x.Idmunicipio.Equals(hotelE.Idmunicipio)).FirstOrDefault();
        }

        //obtener mis hoteles
        //Select 
        public List<UHotel> obtenerhoteles(URegistro session)
        {
            return new Mapeo().hotel.Where(x => x.Idusuario.Equals(session.Id)).OrderBy(x => x.Idhotel).ToList<UHotel>();
        }

        //eliminar hotel
        public void deleteHotel(UHotel id)
        {
            using (var db = new Mapeo())
            {
                UHotel mihotel = db.hotel.Where(x => x.Idhotel == id.Idhotel).First();
                List<UHabitacion> mihabitacion = db.habitacion.Where(x => x.Idhotel == id.Idhotel).ToList();
                db.habitacion.RemoveRange(mihabitacion);
                db.hotel.Remove(mihotel);
                db.SaveChanges();
            }
        }

        //Agregar habitación en el hotel
        public void actualizarhabiatacion(UHabitacion idE)
        {
            using (var db = new Mapeo())
            {
                UHotel datoanterior = db.hotel.Where(x => x.Idhotel == idE.Idhotel).First();
                var idanterior = datoanterior.Numhabitacion;
                datoanterior.Numhabitacion = idanterior + 1;
                var entry = db.Entry(datoanterior);
                entry.State = EntityState.Modified;
                db.SaveChanges();
            }
        }

        //actualizar calificacion
        public void actualizarcalificacion(UHotel hotelE)
        {
            using (var db = new Mapeo())
            {
                UHotel datoanterior = db.hotel.Where(x => x.Idhotel == hotelE.Idhotel).First();
                datoanterior.Promediocalificacion = hotelE.Promediocalificacion;
                var entry = db.Entry(datoanterior);
                entry.State = EntityState.Modified;
                db.SaveChanges();
            }
        }
    }
}
