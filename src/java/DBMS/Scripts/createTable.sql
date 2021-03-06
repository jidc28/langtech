DROP TABLE COORDINACION CASCADE;
DROP TABLE DECANATO CASCADE;
DROP TABLE PROFESOR CASCADE;
DROP TABLE USUARIO CASCADE;
DROP TABLE DEPARTAMENTO CASCADE;
DROP TABLE MATERIA CASCADE;
DROP TABLE RENDIMIENTO CASCADE;
DROP TABLE directorios CASCADE;
DROP TABLE archivos CASCADE;
DROP TABLE dicta CASCADE;
DROP TABLE oferta CASCADE;
DROP TABLE pertenece CASCADE;
DROP TABLE se_adscribe CASCADE;
DROP TABLE maneja CASCADE;
DROP TABLE evaluar CASCADE;
DROP TABLE evaluado CASCADE;
DROP TABLE solicita_apertura CASCADE;
DROP TABLE informacion_profesor_coordinacion CASCADE;
DROP TABLE evaluacion CASCADE;

CREATE TABLE COORDINACION (
    CODIGO VARCHAR(10) NOT NULL,
    NOMBRE VARCHAR(100) NOT NULL UNIQUE,
    
    CONSTRAINT PK_COORDINACION PRIMARY KEY (CODIGO)
);

CREATE TABLE DECANATO (
    CODIGO VARCHAR(10) NOT NULL,
    NOMBRE VARCHAR(100) NOT NULL UNIQUE,
    
    CONSTRAINT PK_DECANATO PRIMARY KEY (CODIGO)
);

CREATE TABLE PROFESOR (
    USBID VARCHAR(15) NOT NULL,
    NOMBRE VARCHAR(30) NOT NULL,
    APELLIDO VARCHAR(30) NOT NULL,
    CEDULA VARCHAR(9) NOT NULL,
    GENERO VARCHAR(9) NOT NULL,
    EMAIL VARCHAR(50) ,
    EMAIL_PERSONAL VARCHAR(50),
    NIVEL VARCHAR(20) ,
    JUBILADO VARCHAR(1) DEFAULT 'N',
    LAPSO_CONTRACTUAL_INICIO VARCHAR(10) ,
    LAPSO_CONTRACTUAL_FIN VARCHAR(10) ,
    
    CONSTRAINT PK_PROFESOR PRIMARY KEY (USBID),
    CONSTRAINT UNIQUENESS_CEDULA UNIQUE (CEDULA)
);

CREATE TABLE USUARIO(
    USBID VARCHAR(15) NOT NULL,
    TIPOUSUARIO VARCHAR(20) DEFAULT 'profesor' NOT NULL,
    CONTRASENA VARCHAR(30) NOT NULL,

    CONSTRAINT PK_USUARIO PRIMARY KEY (USBID)
);

CREATE TABLE DEPARTAMENTO (
    CODIGO VARCHAR(10) NOT NULL,
    NOMBRE VARCHAR(100) NOT NULL UNIQUE,
    CONDICION VARCHAR(11) DEFAULT 'activo' NOT NULL,

    CONSTRAINT PK_DEPARTAMENTO PRIMARY KEY (CODIGO)
);

CREATE TABLE MATERIA (
    CODIGO VARCHAR(10) NOT NULL,
    NOMBRE VARCHAR(100) NOT NULL UNIQUE,
    CREDITOS VARCHAR(2) NOT NULL,
    SOLICITUD VARCHAR(2) DEFAULT 'no' NOT NULL,
    
    CONSTRAINT PK_MATERIA PRIMARY KEY (CODIGO)
);

CREATE TABLE RENDIMIENTO (
    USBID_PROFESOR VARCHAR(15) REFERENCES PROFESOR (USBID) ON DELETE CASCADE ON UPDATE CASCADE,
    CODIGO_MATERIA VARCHAR(10) REFERENCES MATERIA (CODIGO) ON DELETE CASCADE ON UPDATE CASCADE,
    TRIMESTRE VARCHAR(2) NOT NULL,
    ANO NUMERIC(4,0) NOT NULL,
    TOTAL_ESTUDIANTES NUMERIC(3,0) NOT NULL,
    NOTA_PROM NUMERIC(5,2) NOT NULL,
    NOTA1 NUMERIC(3,0) NOT NULL,
    NOTA2 NUMERIC(3,0) NOT NULL,
    NOTA3 NUMERIC(3,0) NOT NULL,
    NOTA4 NUMERIC(3,0) NOT NULL,
    NOTA5 NUMERIC(3,0) NOT NULL,
    RETIRADOS NUMERIC(3,0) NOT NULL,
    EVALUADO VARCHAR(2) DEFAULT 'no',
    ANO_EVALUACION NUMERIC(4,0),
    TRIMESTRE_EVALUACION VARCHAR(2),

    CONSTRAINT PK_RENDIMIENTO PRIMARY KEY (USBID_PROFESOR,CODIGO_MATERIA,TRIMESTRE,ANO)    
);

CREATE TABLE directorios (
    USBID_PROFESOR VARCHAR(15) REFERENCES PROFESOR(USBID) ON DELETE CASCADE ON UPDATE CASCADE,
    PATH VARCHAR(200) NOT NULL,

    CONSTRAINT PK_directorios PRIMARY KEY (USBID_PROFESOR)
);

CREATE TABLE archivos (
    USBID_PROFESOR VARCHAR(15) REFERENCES PROFESOR(USBID) ON DELETE CASCADE ON UPDATE CASCADE,
    TRIMESTRE VARCHAR(2) NOT NULL,
    ANO NUMERIC(4,0) NOT NULL,
    NOMBRE VARCHAR(200) NOT NULL,
    DESCRIPCION VARCHAR(500),

    CONSTRAINT PK_archivos PRIMARY KEY (USBID_PROFESOR,TRIMESTRE,ANO,NOMBRE)
);

CREATE TABLE dicta (
    USBID_PROFESOR VARCHAR(15) REFERENCES PROFESOR (USBID) ON DELETE CASCADE ON UPDATE CASCADE,
    CODIGO_MATERIA VARCHAR(10) REFERENCES MATERIA (CODIGO) ON DELETE CASCADE ON UPDATE CASCADE,
    PERIODO        VARCHAR(2),
    PLANILLA_LLENA VARCHAR(1) DEFAULT 'N' NOT NULL,

    CONSTRAINT PK_dicta PRIMARY KEY (USBID_PROFESOR,CODIGO_MATERIA,PERIODO)
);

CREATE TABLE se_adscribe (
    CODIGO_COORDINACION VARCHAR(10) REFERENCES COORDINACION (CODIGO) ON DELETE CASCADE ON UPDATE CASCADE,
    CODIGO_DECANATO VARCHAR(10) REFERENCES DECANATO (CODIGO) ON DELETE CASCADE ON UPDATE CASCADE,

    CONSTRAINT PK_seadscribe PRIMARY KEY (CODIGO_COORDINACION,CODIGO_DECANATO)
);

CREATE TABLE oferta (
    CODIGO_MATERIA VARCHAR(10) REFERENCES MATERIA (CODIGO) ON DELETE CASCADE ON UPDATE CASCADE,
    CODIGO_DEPARTAMENTO VARCHAR(10) NOT NULL REFERENCES DEPARTAMENTO (CODIGO) ON DELETE CASCADE ON UPDATE CASCADE,

    CONSTRAINT PK_oferta PRIMARY KEY (CODIGO_MATERIA,CODIGO_DEPARTAMENTO)
);

CREATE TABLE solicita_apertura (
    CODIGO_MATERIA VARCHAR(10) REFERENCES MATERIA (CODIGO) ON DELETE CASCADE ON UPDATE CASCADE,
    CODIGO_COORDINACION VARCHAR(10) REFERENCES COORDINACION (CODIGO) ON DELETE CASCADE ON UPDATE CASCADE,
    CODIGO_DEPARTAMENTO VARCHAR(10) REFERENCES DEPARTAMENTO (CODIGO) ON DELETE CASCADE ON UPDATE CASCADE,
    MENSAJE VARCHAR(200) NOT NULL,

    CONSTRAINT PK_colicita_apertura PRIMARY KEY (CODIGO_MATERIA,CODIGO_COORDINACION)
); 

CREATE TABLE pertenece ( 
    USBID_PROFESOR VARCHAR(10) REFERENCES PROFESOR (USBID) ON DELETE CASCADE ON UPDATE CASCADE,
    CODIGO_DEPARTAMENTO VARCHAR (10) REFERENCES DEPARTAMENTO (CODIGO) ON DELETE CASCADE ON UPDATE CASCADE,
    EVALUADO VARCHAR(1) DEFAULT 'N',

    CONSTRAINT PK_pertenece PRIMARY KEY (USBID_PROFESOR,CODIGO_DEPARTAMENTO)
);

CREATE TABLE maneja (
    CODIGO_COORDINACION VARCHAR(10) REFERENCES COORDINACION (CODIGO) ON DELETE CASCADE ON UPDATE CASCADE,
    CODIGO_MATERIA VARCHAR(10) REFERENCES MATERIA (CODIGO) ON DELETE CASCADE ON UPDATE CASCADE,

    CONSTRAINT PK_maneja PRIMARY KEY (CODIGO_COORDINACION,CODIGO_MATERIA)
);

CREATE TABLE evaluar (
    CODIGO_COORDINACION VARCHAR(10) REFERENCES COORDINACION (CODIGO) ON DELETE CASCADE ON UPDATE CASCADE,
    USBID_PROFESOR VARCHAR(10) REFERENCES PROFESOR (USBID) ON DELETE CASCADE ON UPDATE CASCADE,
    CODIGO_MATERIA VARCHAR(10) REFERENCES MATERIA (CODIGO) ON DELETE CASCADE ON UPDATE CASCADE,
    CODIGO_DEPARTAMENTO VARCHAR(10) REFERENCES DEPARTAMENTO (CODIGO) ON DELETE CASCADE ON UPDATE CASCADE,

    CONSTRAINT PK_evaluar PRIMARY KEY (CODIGO_COORDINACION,USBID_PROFESOR,CODIGO_MATERIA,CODIGO_DEPARTAMENTO)
);

CREATE TABLE evaluacion (
    CODIGO_COORDINACION VARCHAR(10) REFERENCES COORDINACION (CODIGO) ON DELETE CASCADE ON UPDATE CASCADE,
    USBID_PROFESOR VARCHAR(10) REFERENCES PROFESOR (USBID) ON DELETE CASCADE ON UPDATE CASCADE,
    RECOMENDADO_COORDINACION VARCHAR(2) DEFAULT 'no',
    OBSERVACIONES_COORDINACION VARCHAR(500),
    REVISADO_DEPARTAMENTO VARCHAR(2) DEFAULT 'no',
    REVISADO_DECANATO VARCHAR(2) DEFAULT 'no',

    CONSTRAINT PK_evaluacion_coordinacion PRIMARY KEY (CODIGO_COORDINACION,USBID_PROFESOR)
);

CREATE TABLE evaluado (
    CODIGO_COORDINACION VARCHAR(10) REFERENCES COORDINACION (CODIGO) ON DELETE CASCADE ON UPDATE CASCADE,
    USBID_PROFESOR VARCHAR(10) REFERENCES PROFESOR (USBID) ON DELETE CASCADE ON UPDATE CASCADE,
    ANO NUMERIC(4,0),
    TRIMESTRE VARCHAR(2),
    RECOMENDADO VARCHAR(2),
    OBSERVACIONES VARCHAR(500),

    CONSTRAINT PK_evaluado PRIMARY KEY (CODIGO_COORDINACION,USBID_PROFESOR,ANO,TRIMESTRE)
);

CREATE TABLE informacion_profesor_coordinacion (
    CODIGO_COORDINACION VARCHAR(10) REFERENCES COORDINACION (CODIGO) ON DELETE CASCADE ON UPDATE CASCADE,
    USBID_PROFESOR VARCHAR(10) REFERENCES PROFESOR (USBID) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSEJO_ASESOR VARCHAR(2) DEFAULT 'no',
    TESIS_TUTORIA NUMERIC(3,0),
    TESIS_JURADO NUMERIC(3,0),
    PASANTIA_CORTA NUMERIC(3,0),
    PASANTIA_LARGA_TUTOR NUMERIC(3,0),
    PASANTIA_LARGA_JURADO NUMERIC(3,0),

    CONSTRAINT PK_informacion_profesor_coordinacion PRIMARY KEY (CODIGO_COORDINACION,USBID_PROFESOR)
);

ALTER TABLE PROFESOR ADD CONSTRAINT FK_profesor_usuario
    FOREIGN KEY (USBID) REFERENCES USUARIO (USBID) ON DELETE CASCADE ON UPDATE CASCADE;