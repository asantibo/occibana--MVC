PGDMP                     
    x            Occibana    12.4    12.4 X    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    41918    Occibana    DATABASE     �   CREATE DATABASE "Occibana" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Latin America.utf8' LC_CTYPE = 'Spanish_Latin America.utf8';
    DROP DATABASE "Occibana";
                postgres    false            	            2615    41919    hotel    SCHEMA        CREATE SCHEMA hotel;
    DROP SCHEMA hotel;
                postgres    false            
            2615    41920    login    SCHEMA        CREATE SCHEMA login;
    DROP SCHEMA login;
                postgres    false                        2615    41921 	   seguridad    SCHEMA        CREATE SCHEMA seguridad;
    DROP SCHEMA seguridad;
                postgres    false            �            1259    41922    calificacion    TABLE     �   CREATE TABLE hotel.calificacion (
    id integer NOT NULL,
    valor_calificacion integer NOT NULL,
    id_usuario integer NOT NULL,
    id_hotel integer NOT NULL
);
    DROP TABLE hotel.calificacion;
       hotel         heap    postgres    false    9            �           0    0    TABLE calificacion    COMMENT     L   COMMENT ON TABLE hotel.calificacion IS 'Tabla de calificaciones por hotel';
          hotel          postgres    false    205            �            1259    41925    calificacion_id_seq    SEQUENCE     �   CREATE SEQUENCE hotel.calificacion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE hotel.calificacion_id_seq;
       hotel          postgres    false    205    9            �           0    0    calificacion_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE hotel.calificacion_id_seq OWNED BY hotel.calificacion.id;
          hotel          postgres    false    206            �            1259    41927    comentarios    TABLE     �   CREATE TABLE hotel.comentarios (
    id_coment integer NOT NULL,
    comentario text NOT NULL,
    id_hotel integer NOT NULL,
    id_usuario integer NOT NULL,
    fecha_comentario timestamp without time zone NOT NULL
);
    DROP TABLE hotel.comentarios;
       hotel         heap    postgres    false    9            �           0    0    TABLE comentarios    COMMENT     �   COMMENT ON TABLE hotel.comentarios IS 'Tabla donde se guardaran los comentarios con el id del usuario que lo realizo, el idhotel en donde se realizo el comentario y el comentario en si';
          hotel          postgres    false    207            �            1259    41933    comentarios_id_coment_seq    SEQUENCE     �   CREATE SEQUENCE hotel.comentarios_id_coment_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE hotel.comentarios_id_coment_seq;
       hotel          postgres    false    207    9            �           0    0    comentarios_id_coment_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE hotel.comentarios_id_coment_seq OWNED BY hotel.comentarios.id_coment;
          hotel          postgres    false    208            �            1259    41935    hotel    TABLE     V  CREATE TABLE hotel.hotel (
    numhabitacion integer NOT NULL,
    precionoche integer NOT NULL,
    descripcion text NOT NULL,
    imagen text NOT NULL,
    nombre text NOT NULL,
    idzona integer NOT NULL,
    idhotel integer NOT NULL,
    condicion text,
    checkin text NOT NULL,
    checkout text NOT NULL,
    usuarioencargado text NOT NULL,
    idmunicipio integer NOT NULL,
    imagen_secundaria text,
    condicionesbioseguridad text NOT NULL,
    imagen_secundaria2 text,
    promcalificacion integer,
    direccion text,
    precionochedoble integer,
    precionochepremium integer
);
    DROP TABLE hotel.hotel;
       hotel         heap    postgres    false    9            �            1259    41941    hotel_habitacion    TABLE     �   CREATE TABLE hotel.hotel_habitacion (
    id integer NOT NULL,
    numpersona integer NOT NULL,
    numbano integer NOT NULL,
    idhotel integer NOT NULL,
    tipo text NOT NULL,
    numcamas integer,
    precio integer
);
 #   DROP TABLE hotel.hotel_habitacion;
       hotel         heap    postgres    false    9            �            1259    41947    hotel_habitacion_id_seq    SEQUENCE     �   CREATE SEQUENCE hotel.hotel_habitacion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE hotel.hotel_habitacion_id_seq;
       hotel          postgres    false    9    210            �           0    0    hotel_habitacion_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE hotel.hotel_habitacion_id_seq OWNED BY hotel.hotel_habitacion.id;
          hotel          postgres    false    211            �            1259    41949    hotel_idhotel_seq    SEQUENCE     �   CREATE SEQUENCE hotel.hotel_idhotel_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE hotel.hotel_idhotel_seq;
       hotel          postgres    false    9    209            �           0    0    hotel_idhotel_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE hotel.hotel_idhotel_seq OWNED BY hotel.hotel.idhotel;
          hotel          postgres    false    212            �            1259    41951    hotelmunicipio    TABLE     b   CREATE TABLE hotel.hotelmunicipio (
    idmunicipio integer NOT NULL,
    nombre text NOT NULL
);
 !   DROP TABLE hotel.hotelmunicipio;
       hotel         heap    postgres    false    9            �            1259    41957    hotelmunicipio_idmunicipio_seq    SEQUENCE     �   CREATE SEQUENCE hotel.hotelmunicipio_idmunicipio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE hotel.hotelmunicipio_idmunicipio_seq;
       hotel          postgres    false    9    213            �           0    0    hotelmunicipio_idmunicipio_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE hotel.hotelmunicipio_idmunicipio_seq OWNED BY hotel.hotelmunicipio.idmunicipio;
          hotel          postgres    false    214            �            1259    41959 	   hotelzona    TABLE     X   CREATE TABLE hotel.hotelzona (
    idzona integer NOT NULL,
    nombre text NOT NULL
);
    DROP TABLE hotel.hotelzona;
       hotel         heap    postgres    false    9            �            1259    41965    hotelzona_idzona_seq    SEQUENCE     �   CREATE SEQUENCE hotel.hotelzona_idzona_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE hotel.hotelzona_idzona_seq;
       hotel          postgres    false    9    215            �           0    0    hotelzona_idzona_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE hotel.hotelzona_idzona_seq OWNED BY hotel.hotelzona.idzona;
          hotel          postgres    false    216            �            1259    41967    reserva    TABLE     �  CREATE TABLE hotel.reserva (
    id integer NOT NULL,
    idusuario integer,
    numpersona integer NOT NULL,
    fecha_llegada timestamp without time zone NOT NULL,
    fecha_salida timestamp without time zone NOT NULL,
    nombre text,
    apellido text NOT NULL,
    correo text NOT NULL,
    idhotel integer NOT NULL,
    mediopago text,
    calificacion integer,
    limite_comentario timestamp without time zone NOT NULL,
    id_habitacion integer NOT NULL,
    "precioNoche" integer NOT NULL
);
    DROP TABLE hotel.reserva;
       hotel         heap    postgres    false    9            �            1259    41973    reserva_id_seq    SEQUENCE     �   CREATE SEQUENCE hotel.reserva_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE hotel.reserva_id_seq;
       hotel          postgres    false    9    217            �           0    0    reserva_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE hotel.reserva_id_seq OWNED BY hotel.reserva.id;
          hotel          postgres    false    218            �            1259    41975    token_recuperacion    TABLE     �   CREATE TABLE login.token_recuperacion (
    id integer NOT NULL,
    user_id integer NOT NULL,
    tokengenerado text NOT NULL,
    fecha_caducidad timestamp with time zone NOT NULL,
    fecha_inicio timestamp with time zone NOT NULL
);
 %   DROP TABLE login.token_recuperacion;
       login         heap    postgres    false    10            �            1259    41981    token_recuperacion_id_seq    SEQUENCE     �   CREATE SEQUENCE login.token_recuperacion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE login.token_recuperacion_id_seq;
       login          postgres    false    219    10            �           0    0    token_recuperacion_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE login.token_recuperacion_id_seq OWNED BY login.token_recuperacion.id;
          login          postgres    false    220            �            1259    41983    usuario    TABLE     
  CREATE TABLE login.usuario (
    nombre text NOT NULL,
    apellido text NOT NULL,
    correo text NOT NULL,
    telefono bigint,
    usuario text NOT NULL,
    contrasena text NOT NULL,
    idestado integer NOT NULL,
    fotoperfil text,
    id integer NOT NULL
);
    DROP TABLE login.usuario;
       login         heap    postgres    false    10            �            1259    41989    usuario_id_seq    SEQUENCE     �   CREATE SEQUENCE login.usuario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE login.usuario_id_seq;
       login          postgres    false    10    221            �           0    0    usuario_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE login.usuario_id_seq OWNED BY login.usuario.id;
          login          postgres    false    222            �            1259    41991    acceso    TABLE     �   CREATE TABLE seguridad.acceso (
    id integer NOT NULL,
    userid integer NOT NULL,
    ip text NOT NULL,
    mac text NOT NULL,
    session text NOT NULL,
    fecha_inicio timestamp without time zone,
    fecha_fin timestamp without time zone
);
    DROP TABLE seguridad.acceso;
    	   seguridad         heap    postgres    false    4            �            1259    41997    acceso_id_seq    SEQUENCE     �   CREATE SEQUENCE seguridad.acceso_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE seguridad.acceso_id_seq;
    	   seguridad          postgres    false    223    4            �           0    0    acceso_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE seguridad.acceso_id_seq OWNED BY seguridad.acceso.id;
       	   seguridad          postgres    false    224            �            1259    41999    compra    TABLE     �  CREATE TABLE seguridad.compra (
    id integer NOT NULL,
    idusuario integer NOT NULL,
    numerotarjeta text NOT NULL,
    nombrepropietario text NOT NULL,
    direccionpropietario text NOT NULL,
    codigoseguridad text NOT NULL,
    cedulapropietario text NOT NULL,
    fecha_compra timestamp without time zone NOT NULL,
    fecha_vencimiento timestamp without time zone NOT NULL
);
    DROP TABLE seguridad.compra;
    	   seguridad         heap    postgres    false    4            �            1259    42005    compra_id_seq    SEQUENCE     �   CREATE SEQUENCE seguridad.compra_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE seguridad.compra_id_seq;
    	   seguridad          postgres    false    225    4            �           0    0    compra_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE seguridad.compra_id_seq OWNED BY seguridad.compra.id;
       	   seguridad          postgres    false    226            �
           2604    42007    calificacion id    DEFAULT     p   ALTER TABLE ONLY hotel.calificacion ALTER COLUMN id SET DEFAULT nextval('hotel.calificacion_id_seq'::regclass);
 =   ALTER TABLE hotel.calificacion ALTER COLUMN id DROP DEFAULT;
       hotel          postgres    false    206    205            �
           2604    42008    comentarios id_coment    DEFAULT     |   ALTER TABLE ONLY hotel.comentarios ALTER COLUMN id_coment SET DEFAULT nextval('hotel.comentarios_id_coment_seq'::regclass);
 C   ALTER TABLE hotel.comentarios ALTER COLUMN id_coment DROP DEFAULT;
       hotel          postgres    false    208    207            �
           2604    42009    hotel idhotel    DEFAULT     l   ALTER TABLE ONLY hotel.hotel ALTER COLUMN idhotel SET DEFAULT nextval('hotel.hotel_idhotel_seq'::regclass);
 ;   ALTER TABLE hotel.hotel ALTER COLUMN idhotel DROP DEFAULT;
       hotel          postgres    false    212    209            �
           2604    42010    hotel_habitacion id    DEFAULT     x   ALTER TABLE ONLY hotel.hotel_habitacion ALTER COLUMN id SET DEFAULT nextval('hotel.hotel_habitacion_id_seq'::regclass);
 A   ALTER TABLE hotel.hotel_habitacion ALTER COLUMN id DROP DEFAULT;
       hotel          postgres    false    211    210            �
           2604    42011    hotelmunicipio idmunicipio    DEFAULT     �   ALTER TABLE ONLY hotel.hotelmunicipio ALTER COLUMN idmunicipio SET DEFAULT nextval('hotel.hotelmunicipio_idmunicipio_seq'::regclass);
 H   ALTER TABLE hotel.hotelmunicipio ALTER COLUMN idmunicipio DROP DEFAULT;
       hotel          postgres    false    214    213            �
           2604    42012    hotelzona idzona    DEFAULT     r   ALTER TABLE ONLY hotel.hotelzona ALTER COLUMN idzona SET DEFAULT nextval('hotel.hotelzona_idzona_seq'::regclass);
 >   ALTER TABLE hotel.hotelzona ALTER COLUMN idzona DROP DEFAULT;
       hotel          postgres    false    216    215            �
           2604    42013 
   reserva id    DEFAULT     f   ALTER TABLE ONLY hotel.reserva ALTER COLUMN id SET DEFAULT nextval('hotel.reserva_id_seq'::regclass);
 8   ALTER TABLE hotel.reserva ALTER COLUMN id DROP DEFAULT;
       hotel          postgres    false    218    217            �
           2604    42014    token_recuperacion id    DEFAULT     |   ALTER TABLE ONLY login.token_recuperacion ALTER COLUMN id SET DEFAULT nextval('login.token_recuperacion_id_seq'::regclass);
 C   ALTER TABLE login.token_recuperacion ALTER COLUMN id DROP DEFAULT;
       login          postgres    false    220    219            �
           2604    42015 
   usuario id    DEFAULT     f   ALTER TABLE ONLY login.usuario ALTER COLUMN id SET DEFAULT nextval('login.usuario_id_seq'::regclass);
 8   ALTER TABLE login.usuario ALTER COLUMN id DROP DEFAULT;
       login          postgres    false    222    221            �
           2604    42016 	   acceso id    DEFAULT     l   ALTER TABLE ONLY seguridad.acceso ALTER COLUMN id SET DEFAULT nextval('seguridad.acceso_id_seq'::regclass);
 ;   ALTER TABLE seguridad.acceso ALTER COLUMN id DROP DEFAULT;
    	   seguridad          postgres    false    224    223            �
           2604    42017 	   compra id    DEFAULT     l   ALTER TABLE ONLY seguridad.compra ALTER COLUMN id SET DEFAULT nextval('seguridad.compra_id_seq'::regclass);
 ;   ALTER TABLE seguridad.compra ALTER COLUMN id DROP DEFAULT;
    	   seguridad          postgres    false    226    225            i          0    41922    calificacion 
   TABLE DATA           S   COPY hotel.calificacion (id, valor_calificacion, id_usuario, id_hotel) FROM stdin;
    hotel          postgres    false    205   �f       k          0    41927    comentarios 
   TABLE DATA           c   COPY hotel.comentarios (id_coment, comentario, id_hotel, id_usuario, fecha_comentario) FROM stdin;
    hotel          postgres    false    207   �f       m          0    41935    hotel 
   TABLE DATA           (  COPY hotel.hotel (numhabitacion, precionoche, descripcion, imagen, nombre, idzona, idhotel, condicion, checkin, checkout, usuarioencargado, idmunicipio, imagen_secundaria, condicionesbioseguridad, imagen_secundaria2, promcalificacion, direccion, precionochedoble, precionochepremium) FROM stdin;
    hotel          postgres    false    209   �g       n          0    41941    hotel_habitacion 
   TABLE DATA           c   COPY hotel.hotel_habitacion (id, numpersona, numbano, idhotel, tipo, numcamas, precio) FROM stdin;
    hotel          postgres    false    210   `i       q          0    41951    hotelmunicipio 
   TABLE DATA           <   COPY hotel.hotelmunicipio (idmunicipio, nombre) FROM stdin;
    hotel          postgres    false    213   vj       s          0    41959 	   hotelzona 
   TABLE DATA           2   COPY hotel.hotelzona (idzona, nombre) FROM stdin;
    hotel          postgres    false    215   �j       u          0    41967    reserva 
   TABLE DATA           �   COPY hotel.reserva (id, idusuario, numpersona, fecha_llegada, fecha_salida, nombre, apellido, correo, idhotel, mediopago, calificacion, limite_comentario, id_habitacion, "precioNoche") FROM stdin;
    hotel          postgres    false    217   'k       w          0    41975    token_recuperacion 
   TABLE DATA           f   COPY login.token_recuperacion (id, user_id, tokengenerado, fecha_caducidad, fecha_inicio) FROM stdin;
    login          postgres    false    219   �l       y          0    41983    usuario 
   TABLE DATA           s   COPY login.usuario (nombre, apellido, correo, telefono, usuario, contrasena, idestado, fotoperfil, id) FROM stdin;
    login          postgres    false    221   �m       {          0    41991    acceso 
   TABLE DATA           Z   COPY seguridad.acceso (id, userid, ip, mac, session, fecha_inicio, fecha_fin) FROM stdin;
 	   seguridad          postgres    false    223   �n       }          0    41999    compra 
   TABLE DATA           �   COPY seguridad.compra (id, idusuario, numerotarjeta, nombrepropietario, direccionpropietario, codigoseguridad, cedulapropietario, fecha_compra, fecha_vencimiento) FROM stdin;
 	   seguridad          postgres    false    225   �~       �           0    0    calificacion_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('hotel.calificacion_id_seq', 1, false);
          hotel          postgres    false    206            �           0    0    comentarios_id_coment_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('hotel.comentarios_id_coment_seq', 48, true);
          hotel          postgres    false    208            �           0    0    hotel_habitacion_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('hotel.hotel_habitacion_id_seq', 101, true);
          hotel          postgres    false    211            �           0    0    hotel_idhotel_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('hotel.hotel_idhotel_seq', 48, true);
          hotel          postgres    false    212            �           0    0    hotelmunicipio_idmunicipio_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('hotel.hotelmunicipio_idmunicipio_seq', 8, true);
          hotel          postgres    false    214            �           0    0    hotelzona_idzona_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('hotel.hotelzona_idzona_seq', 5, true);
          hotel          postgres    false    216            �           0    0    reserva_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('hotel.reserva_id_seq', 71, true);
          hotel          postgres    false    218            �           0    0    token_recuperacion_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('login.token_recuperacion_id_seq', 6, true);
          login          postgres    false    220            �           0    0    usuario_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('login.usuario_id_seq', 24, true);
          login          postgres    false    222            �           0    0    acceso_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('seguridad.acceso_id_seq', 439, true);
       	   seguridad          postgres    false    224            �           0    0    compra_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('seguridad.compra_id_seq', 20, true);
       	   seguridad          postgres    false    226            �
           2606    42019    calificacion calificacion_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY hotel.calificacion
    ADD CONSTRAINT calificacion_pkey PRIMARY KEY (id);
 G   ALTER TABLE ONLY hotel.calificacion DROP CONSTRAINT calificacion_pkey;
       hotel            postgres    false    205            �
           2606    42021 &   hotel_habitacion hotel_habitacion_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY hotel.hotel_habitacion
    ADD CONSTRAINT hotel_habitacion_pkey PRIMARY KEY (id);
 O   ALTER TABLE ONLY hotel.hotel_habitacion DROP CONSTRAINT hotel_habitacion_pkey;
       hotel            postgres    false    210            �
           2606    42023    hotel hotel_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY hotel.hotel
    ADD CONSTRAINT hotel_pkey PRIMARY KEY (idhotel);
 9   ALTER TABLE ONLY hotel.hotel DROP CONSTRAINT hotel_pkey;
       hotel            postgres    false    209            �
           2606    42025 "   hotelmunicipio hotelmunicipio_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY hotel.hotelmunicipio
    ADD CONSTRAINT hotelmunicipio_pkey PRIMARY KEY (idmunicipio);
 K   ALTER TABLE ONLY hotel.hotelmunicipio DROP CONSTRAINT hotelmunicipio_pkey;
       hotel            postgres    false    213            �
           2606    42027    hotelzona hotelzona_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY hotel.hotelzona
    ADD CONSTRAINT hotelzona_pkey PRIMARY KEY (idzona);
 A   ALTER TABLE ONLY hotel.hotelzona DROP CONSTRAINT hotelzona_pkey;
       hotel            postgres    false    215            �
           2606    42029     comentarios pk_hotel_comentarios 
   CONSTRAINT     d   ALTER TABLE ONLY hotel.comentarios
    ADD CONSTRAINT pk_hotel_comentarios PRIMARY KEY (id_coment);
 I   ALTER TABLE ONLY hotel.comentarios DROP CONSTRAINT pk_hotel_comentarios;
       hotel            postgres    false    207            �
           2606    42031    reserva reserva_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY hotel.reserva
    ADD CONSTRAINT reserva_pkey PRIMARY KEY (id);
 =   ALTER TABLE ONLY hotel.reserva DROP CONSTRAINT reserva_pkey;
       hotel            postgres    false    217            �
           2606    42033 *   token_recuperacion token_recuperacion_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY login.token_recuperacion
    ADD CONSTRAINT token_recuperacion_pkey PRIMARY KEY (id);
 S   ALTER TABLE ONLY login.token_recuperacion DROP CONSTRAINT token_recuperacion_pkey;
       login            postgres    false    219            �
           2606    42035    usuario usuario_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY login.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);
 =   ALTER TABLE ONLY login.usuario DROP CONSTRAINT usuario_pkey;
       login            postgres    false    221            �
           2606    42037    compra compra_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY seguridad.compra
    ADD CONSTRAINT compra_pkey PRIMARY KEY (id);
 ?   ALTER TABLE ONLY seguridad.compra DROP CONSTRAINT compra_pkey;
    	   seguridad            postgres    false    225            �
           2606    42039    acceso pk_seguridad_acceso 
   CONSTRAINT     [   ALTER TABLE ONLY seguridad.acceso
    ADD CONSTRAINT pk_seguridad_acceso PRIMARY KEY (id);
 G   ALTER TABLE ONLY seguridad.acceso DROP CONSTRAINT pk_seguridad_acceso;
    	   seguridad            postgres    false    223            �
           2606    42040    comentarios fk_hotel_idusuario    FK CONSTRAINT     �   ALTER TABLE ONLY hotel.comentarios
    ADD CONSTRAINT fk_hotel_idusuario FOREIGN KEY (id_usuario) REFERENCES login.usuario(id) NOT VALID;
 G   ALTER TABLE ONLY hotel.comentarios DROP CONSTRAINT fk_hotel_idusuario;
       hotel          postgres    false    2788    221    207            �
           2606    42045    acceso fk_acceso_usuario    FK CONSTRAINT     z   ALTER TABLE ONLY seguridad.acceso
    ADD CONSTRAINT fk_acceso_usuario FOREIGN KEY (userid) REFERENCES login.usuario(id);
 E   ALTER TABLE ONLY seguridad.acceso DROP CONSTRAINT fk_acceso_usuario;
    	   seguridad          postgres    false    221    223    2788            i      x������ � �      k   �   x�}�;�@ ��>E.��������&@
$@�?ABRM�4J�[�(%p�:��IW��"jT��|���2�˷����u�"n�*0OgXK�R�c��.a��@?���ݨ��l�2��Jh�T���_�I[��m(/!�(��$
">U<�      m   �  x���KO�0�ח_���Ж^�u�KW���N'�]����A�3��,n�m�w�)90�h�bt�ko�]���ԘfLu����t�L�F�M������?µ5	��`�HmGRͪ�H��܎���E_�[ ;=HպҶ;=hj�ֶ�4���&MT�=`�k��,*T7j�:� �"�Ѽ*`X�-p���aw�,!����_D�<�BIe4���L"ʻ9΁�X輢X�+mg�l'/��mG���B����g�� �V)�]��s��,�sZ:`��ua,~�^'��#��>
[^��.���%�~�5�;�7�c�e�������֐�y�"!?g@E�[�I�''�:~U��7A
�eLF�ݽpu�.�AWx��)���9���������f!���+�l�I��z}��      n     x�u�Mn�@�דà����"�ش�RQ�V=g�b��18�dVy_�~~N���1lo����_R�g*��#dDnпw������$�U��֋��@����r���gJ2�<I�� �A#Ug�g՛�O�лԨ���8,k��UQo��D��N��| �u`�B�*����A��K�ٹ@�����R�i��TҢ�L����캐.����δ������ ��!#IM�G�U����������J��� sO�3}��k谙��Az�      q   \   x��;@@���UX��_-��Љ�#�����)�	�Ѕ��\�F/������m"��m/�H��#R��:�t��n���'r��N�z��Bq      s   5   x�3���/*I�2�.-�2�tN�+)��2��/�2S�L9���3S��=... m+      u   �  x����j�@�ϓ��(3��n��Jk�=T(ғ�U�1�����Aw������0�~����RP�P����c���5_��fg����/N�垔{���6��;Hb�O>ߧ�	��&�B�+D�t
��J���/�C���������k��І9����'L��:����ASIޕ���«�(oDy��*�
o��g�X�'�V{���[�N���t(�2ybG\uB/�^��k�O�ԙ�M'a�4�.�;q���C��tǭ;�����&ғ3|ߠ0zl'���;� i�OBf�(Ӝ�v�o��w���Z�$�2��:��u�Ԙ��?oװ��?�b���ǻ�޴0ҭ��ݳm����i8[���J�Ŋ��e�w���֬�ؖ���[b��D_k�w��+���GQ���a      w   �   x�]�ˍ�0�qi��"]K.�h�_��X ��y�8Cy�?.�޹�W
u�
����>���h#��"+:cBh�V�  �w�'���9T��w�*o���w�:-�L��z����b���݂4(�� �bt.�~�?G<��b�ʁk#�Q��}����^3adzJ\
RD)�D�ThLJf+�I��&�m=�*�x;��K8�Y
��7�o���m�~ ��X�      y     x�}��n�0���w)c�nM�^��'$�ět���7�ʡ�^RJEUɾ���Y�#y��'�������"�^�04��d:�l���s��s�U��gO�� _-����f�l��ʔ�*{[���;N�7�m$I|k��"M��r�xC��toA�2���=*���?q��y�|Qt�Q�BXx9�s��!ӳmFW���T�g���}��{�c� ��';����;�%c�}�����v	6�K�������6Cs��	j�*���,���+F�rfj�SJ}�ʡF      {      x��[Ɏ�:�<W}E�@ܜ���q��/��}�׏S��/��PU��\���͝L��?(��̣���G�Ť��������<n��m3�qY�LD{=[��F�E��EŃ��O}θ��ɇP����|��x\<�����#��=��O����BzDhI��H?x�I �����P�Opa=�A�����x�#�Y�'���]�O�\*���g��� (��zP�I.��p�3�ԃ)�P_��H�hB1|&�� � �x�<����T�x��.P�t �+m=����Ta,��>��'��~�AՃ��@�����"D�S�Ah���<���&_>!/�"p?Q@��с)�����r/BzŌ�Op��STQ&1���5����G��?>�7��J�i�����馴�
��%!�Ǒ�DX��?~Y*�0��?Aq;Ai_�|>��=@�d�'���T������zd���4�L����~"r�HO�܎F[=W�����z)F�O?8�$c�`z2���,����z�ֶ��4y#��oP�s����F9�����:�Q.�u��UZ�sؤ<_�6.�j\�P�)~����i�H�Q�.\�{�}��h[�2=�r���*�#��	��{\&jRuD�,Y:�2�c�`�AC���Pܸ���Y6A"��2o	��	2R�߸��4���TF�����������0o噊c��f�b�2S��	��u�қ��r=\����П7q_ET*��|�V臑6�q�(�^B�3#y����m��a�S8`�'�'s&Y]F�@QL��Hl����T��K28�@�&b��G�{Ye����ACBk2@��+4[�AR�QݐX���zRHu��;X�����{�򸈺�t��E�Z������죎�}SU�Tc�)N���2�(�:�聕��jB>a>1+�Q?I��!��Mg�>�j��'��K8����n��"�R,~��S���S��jţ�t����������tXLp��g�5-�xo|&0�c;�%`#�A ��\����y��1��(Q�� �N�F����~<엁k�y��G�~<JMo�FW�t�/_�˶�4j���b:�u5�vR���؋�����1�t�%J�O�Vz�X���l��:��T��A�A`��[-��1O隋���}*�Z�pJ�1,������a����V7pt����˻-��}���rR���7�Ǔ�{X�sBb��>��-��P�wq�R�W�U4�-�E0�e�9����Ʋ*�7�N���u�{�!?��oh��)��m�Y��/��[f �=aY�eC=Lg\�(���8�z���	,�wiG'Z/{s4t������U;�I�0)��:�{{���̳3���8�ʇv����Wٸ�� �Ok(l{W	�t��N_���Q�����V��q���׎ظҌ��R?��A�
D8b
�C5us��JW�ʎ���^�`ۻ������	~��t���WL��N���a"6^�E9�iƙqj�b��u���a�b�.�x׆��ӆE��{BS���� ���"���cx����"���U�����	�	�EG:�V5�Ȳ�����Hچ��rE�V�`v�:�V�n�X{+� gM�]����K�蠅��W9�VgQ���>���s���S^a1\3Bc��̸���)�$l�2��q�Q�,�
_���Y�ј�n�y���O_��4s�X��7����2DU����c��?�+��RI)�p�<(`�|�c<����qt��	ߊ�z���"���j���L_DX��uM��|��|c�ւX��:�DK��E,��q\P(��O_b��`B���g�T�5�Ѱ�'v�4J��j��IsT��*����gz�u�	օ3��k���Ǒ�	IE1�s�k֍��T�g��`��G�i�b����c����ڎ��.=���R�X��x`�3��
�A�!�C�z���]�u��Ԏ��^!�(�s�1OE�V;o�a4ۉH��s+�%2t�Ta;'&qѕ��C���NWcG����(�bN�SB��W��T!�t��a)v<0���b�nc@̨�ި�k<,�أh�{���x�߇`-��0���4�}h�"�>��ʐO�"^wS�'�{D�/��T��뚒
�sG:n=��i�{b�8���Bjz�d���wq��dI)yk�2~g���<��9';m�%���[I�� ��Y��d	�q~��9E�p����o\�쇰���ͻ�P�g[X5e�����4:�3{��%R@��۰+���p� ��dD� vp��X?nj:���`3�I@�)�X}�:��&�����fq�Ӫ*��c�HI���7� �u'=����KZ�qA�'�y�P�N�mnI6UE�r���Bn�Jc��c����;h_�1W%[��vb�::�x~��,%�=P�ߍ��[]�0��߶p9�x���
_p��!%5�-�oς��l�[?���UVtgT�>[ȓ�o\��1�Q��F����t���q����GѴ�E7,M�E6�9U���ߞ۸�R�V��뗾�$?�c����f�x	 (�w�������$��f�0\�sm����s|���`�c��2W:.\�o�rt9Iv1�c���L�&l�k&*|���vꘊ�5�6���ڄo� ����S,/����l�5ƣ����mg�Fg1�+�b٠���gq`ᚉ$�ܓ[�|۬Y�a��E�X���i�Q��|B[���S�B�����n����C��[1�E��sBm�}���.�}����] �`��`�C^��єg����Ն�̞R��S}��c���P4s|J�x����H���˥I? f.2]�v9�p�R5�>�[Ґ�SFs1�Ih�l`k���x�}��ܱp�}I땦�G[B���!M�q�q�u� �������₱J�C�װ�.��ᱴ��yZ�`��%g�ْX,y�u��htW7��m��Y̓�����j�Xry��l� ��"Ϫ�lcS�Y���fQ��_>�a��Fc� ��	�`[O����tgQ��Uk26}a����E�+}�M��WjL��p��'��8�[v�GZf���yTg��>,\s-]6��Y� �jzl];�y�]�Ų�*���pB5â'n\G5=�29H&aW/K2,,�}66�4�en9��u�]8�4� ����4��/���F�:B���-�5�~���&y����B*����p��Q����	�na�Q��>V�����dO���δ�a��0)��b[B,�Ք��b	1]��S�ݸ6�-\2�yűz,U��t��v6�o\�D���ņ��}�7q�u1�G9�O:�����<�aZ�<�����Q���yNi��S�櫛�q�iM���/��0��Nck�,�U:�ilXu�8��2A�雸���' �s��[��jr�G�zz �:[|s�ɯ{QBo�-"�L��
׸�U�׵&�� }�����Op����2��E�:��&���j��늛��Ơ���2��~�]�� ����� �w�os�?���i�׍ ���~�d5Zp��I�`r�ٰ�M�,q��Cy�i!���_`�ۥ؉0�0�� w��[�o�w��Z�tʰ�z�"�\��ץ���~�:XXW�)�]G��&y[vǼ������r��Z���ۛ��?D�Z<��9j黸�ѫ`�=�Q8j���Z���3(Ed�n�2����dM8�6%���5\���o.�_�Eʟ��s�k�U<����&�&�9�F�Ȕ�|_G�n�:W��>O��	�}��UzfNB�=�߮I�sļ	��鐖cVUU��V.�f~FwCe�B��"�ʱ����ڛɝ�.\w�)��tF���}��b:砜܄��ҥΦ���M�VT*x�:؝�d�MQp������Yd���/Ր>{v>�����ю�c����Hҕ��^��#t\�����v�:�EMҰ!![� ڏ�.A��{�=�� ��TO�5�7q�9�46���+�ñX�cjF�;v��qM�m�O����4�
���}�8���a5����58l}������{�ɤ~��?�ϟ    ?�jM.�      }   �  x��MnA��=��Ě�].��,l�*��@,B��� �����֫�����z�]�9b z����~��q���s�n��� {�����G���_�絾ǧO��֔��>i�D�����̡R6Nf�fT7.��{ȡAWZ��.=��xĉ�c��^c/��s��m"�ƔB���G��0�3��O(�]��I S�[�5�����q����鄐:�U��L�v���}9#nH���[�ԏ�W��x��+���f��=Qkڃ�^���C�<�ޭL���Qt��c�*�̮Iv�&����mM$ 3��6�r���"#��{�]~g��������@��1�?x��n~m*N4{�?7��c�=�d�ʮ�<��@��]\�pO����������5 ��Ԍ����1�
��G'�f���ڀ�_w $�#	������ rj�)��K5g��:�������g��)w��..�ۗ��v�`U�     