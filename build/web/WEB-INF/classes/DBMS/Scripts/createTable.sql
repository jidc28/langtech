DROP TABLE CARRERA CASCADE;
DROP TABLE COORDINACION CASCADE;
DROP TABLE DECANATO CASCADE;
DROP TABLE NUCLEOUNIV CASCADE;
DROP TABLE PROFESOR CASCADE;
DROP TABLE USUARIO CASCADE;
DROP TABLE DACE CASCADE;
DROP TABLE CCT CASCADE;
DROP TABLE COOP CASCADE;
DROP TABLE PROY CASCADE;
DROP TABLE SINAI CASCADE;
DROP TABLE DEPARTAMENTO CASCADE;

CREATE TABLE CARRERA (
    CODIGO VARCHAR(10) NOT NULL,
    NOMBRE VARCHAR(50) NOT NULL,
    ESTADO VARCHAR(10) DEFAULT 'VISIBLE' NOT NULL,
    
    CONSTRAINT PK_CARRERA PRIMARY KEY (CODIGO)
);

CREATE TABLE COORDINACION (
    CODIGO VARCHAR(10) NOT NULL,
    NOMBRE VARCHAR(50) NOT NULL,
    ESTADO VARCHAR(10) DEFAULT 'VISIBLE' NOT NULL,
    
    CONSTRAINT PK_COORDINACION PRIMARY KEY (CODIGO)
);

CREATE TABLE DECANATO (
    CODIGO VARCHAR(10) NOT NULL,
    NOMBRE VARCHAR(50) NOT NULL,
    ESTADO VARCHAR(10) DEFAULT 'VISIBLE' NOT NULL,
    
    CONSTRAINT PK_DECANATO PRIMARY KEY (CODIGO)
);

CREATE TABLE NUCLEOUNIV (
    CODIGO VARCHAR(10) NOT NULL,
    NOMBRE VARCHAR(50) NOT NULL,
    ESTADO VARCHAR(10) DEFAULT 'VISIBLE' NOT NULL,
    
    CONSTRAINT PK_NUCLEOUNIV PRIMARY KEY (CODIGO)
);

CREATE TABLE PROFESOR (
    USBID VARCHAR(15) NOT NULL,
    NOMBRE VARCHAR(30) NOT NULL,
    APELLIDO VARCHAR(30) NOT NULL,
    CEDULA VARCHAR(9) NOT NULL,
    GENERO VARCHAR(9) NOT NULL,
    EMAIL VARCHAR(50) ,
    NIVEL VARCHAR(15) ,
    JUBILADO VARCHAR(2) ,
    LAPSO_CONTRACTUAL VARCHAR(2) ,
    
    
    CONSTRAINT PK_PROFESOR PRIMARY KEY (USBID)
);

CREATE TABLE USUARIO(
    USBID VARCHAR(15) NOT NULL,
    TIPOUSUARIO VARCHAR(20) DEFAULT 'profesor' NOT NULL,
    CONTRASENA VARCHAR(30) NOT NULL,
    DEPARTAMENTO VARCHAR(100) NOT NULL,
    
    CONSTRAINT PK_USUARIO PRIMARY KEY (USBID)
);

CREATE TABLE DACE (
    USBID VARCHAR(15) NOT NULL,
    CODIGO VARCHAR(6) NOT NULL,
    NOMBRE VARCHAR(25) NOT NULL,
    TRIMESTRE VARCHAR(10) NOT NULL,
    ANO NUMERIC(4) NOT NULL,
    UNO NUMERIC(3) DEFAULT 0 NOT NULL,
    DOS NUMERIC(3) DEFAULT 0 NOT NULL,
    TRES NUMERIC(3) DEFAULT 0 NOT NULL,
    CUATRO NUMERIC(3) DEFAULT 0 NOT NULL,
    CINCO NUMERIC(3) DEFAULT 0 NOT NULL,
    RETIRADOS NUMERIC(3) DEFAULT 0 NOT NULL,
    
    CONSTRAINT PK_DACE PRIMARY KEY (USBID,CODIGO,TRIMESTRE,ANO)
);

CREATE TABLE CCT(
    USBID VARCHAR(15) NOT NULL,
    IDENT VARCHAR(10) NOT NULL,
    TITULO VARCHAR(50) NOT NULL,
    FECHA_INIC DATE NOT NULL,
    FECHA_FIN DATE NOT NULL,
    CARRERA VARCHAR(50) NOT NULL,
    TIPO VARCHAR(15) NOT NULL,
    
    CONSTRAINT PK_CCT PRIMARY KEY (IDENT)
);

CREATE TABLE COOP(
    IDENT VARCHAR(10) NOT NULL,
    USBID VARCHAR(15) NOT NULL,
    NOMBRE VARCHAR(20) NOT NULL,
    APELLIDO VARCHAR(20) NOT NULL,
    DURACION NUMERIC(3) NOT NULL,
    
    CONSTRAINT PK_COOP PRIMARY KEY (IDENT)
);

CREATE TABLE PROY (
    IDENT VARCHAR(10) NOT NULL,
    USBID VARCHAR(15) NOT NULL,
    NOMBRE VARCHAR(20) NOT NULL,
    APELLIDO VARCHAR(20) NOT NULL,
    
    CONSTRAINT PK_PROY PRIMARY KEY (IDENT,NOMBRE,APELLIDO)
);

CREATE TABLE SINAI (
    USBID VARCHAR(15) NOT NULL,
    NOMBRE VARCHAR(40) NOT NULL,
    FECHA_INIC DATE NOT NULL,
    FECHA_FIN DATE NOT NULL,
    
    CONSTRAINT PK_SINAI PRIMARY KEY (USBID,NOMBRE)
);

CREATE TABLE DEPARTAMENTO (
    CODIGO VARCHAR(10) NOT NULL,
    NOMBRE VARCHAR(100) NOT NULL,
    ESTADO VARCHAR(10) DEFAULT 'VISIBLE' NOT NULL,
    
    CONSTRAINT PK_DEPARTAMENTO PRIMARY KEY (CODIGO)
);

ALTER TABLE PROFESOR ADD CONSTRAINT FK_profesor_usuario
    FOREIGN KEY (USBID) REFERENCES USUARIO (USBID);
    
ALTER TABLE DACE ADD CONSTRAINT FK_dace_profesor
    FOREIGN KEY (USBID) REFERENCES PROFESOR (USBID);
    
ALTER TABLE CCT ADD CONSTRAINT FK_cct_profesor
    FOREIGN KEY (USBID) REFERENCES PROFESOR (USBID);
    
ALTER TABLE COOP ADD CONSTRAINT FK_coop_cct
    FOREIGN KEY (IDENT) REFERENCES CCT (IDENT);
    
ALTER TABLE PROY ADD CONSTRAINT FK_proy_cct
    FOREIGN KEY (IDENT) REFERENCES CCT (IDENT);
    
ALTER TABLE SINAI ADD CONSTRAINT FK_sinai_profesor
    FOREIGN KEY (USBID) REFERENCES PROFESOR (USBID);