CREATE DATABASE DataMart_Lubriexpress;

-- Tabla de Hechos (Servicios)
CREATE TABLE Servicios (
    Servicio_ID INT PRIMARY KEY,
    Vehiculo_ID INT,
    Fecha DATE,
    Costo DECIMAL(10, 2),
    FOREIGN KEY (Vehiculo_ID) REFERENCES Dim_Vehiculo(Vehiculo_ID)
);

-- Tablas de Dimensiones

CREATE TABLE Dim_Cliente (
    Cliente_ID INT PRIMARY KEY,
    Nombre VARCHAR(50),
    Direccion VARCHAR(100)
);

CREATE TABLE Dim_Vehiculo (
    Vehiculo_ID INT PRIMARY KEY,
    Vehiculo VARCHAR(50),
    Anio DATE,
    Cliente_ID INT,
    FOREIGN KEY (Cliente_ID) REFERENCES Dim_Cliente(Cliente_ID)
);

CREATE TABLE Dim_Accesorio (
    Accesorio_ID INT PRIMARY KEY,
    Nombre_Accesorio VARCHAR(50),
    Precio DECIMAL(10, 2)
);

CREATE TABLE Dim_Ventas (
 Vehiculo_ID INT NOT NULL,
 Cantidad INT,
 Total DECIMAL (10, 2),
 Accesorio_ID INT,
 FOREIGN KEY (Accesorio_ID) REFERENCES Dim_Accesorio(Accesorio_ID),
 FOREIGN KEY (Vehiculo_ID) REFERENCES Dim_Vehiculo(Vehiculo_ID)
 );



----- Cambios realizados para que funcione el VS ---

  ALTER TABLE Dim_Cliente ALTER COLUMN Cliente_ID INT NOT NULL;
   ALTER TABLE Dim_Accesorio ALTER COLUMN Accesorio_ID INT NOT NULL;
   ALTER TABLE Dim_Vehiculo ALTER COLUMN Cliente_ID INT NOT NULL;


 SELECT* FROM Dim_Ventas;
  SELECT* FROM Dim_Vehiculo;
