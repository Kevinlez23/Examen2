create database Examen
go

use Examen
go 


EXEC sp_help 'Equipos';


create table Equipos 
(
	Equipoid int identity primary key,
	tipoEquipo varchar(100) not null,
	Modelo varchar(50) not null,
	Usuarioid int foreign key references Usuarios(id)
	)

	insert into Equipos values ('laptop'), ('escritorio')
	select * from Equipos


	---- procedimientos almacenados
create procedure ingresarEquipo
@tipoEquipo varchar(100),
@Modelo varchar(50),
@Usuarioid int
 as
	begin
		insert into Equipos values (@tipoEquipo, @Modelo, @Usuarioid) 
	end

create procedure borrarEquipo
@Equipoid int

 as
	begin
	delete Equipos where Equipoid= @Equipoid
	end


create procedure consultaEquipo

 as
	begin
	select * from Equipos
	end

create procedure ModificarEquipo
 @Equipoid int,
 @tipoEquipo varchar(100),
 @Modelo varchar(50),
 @Usuarioid int
 
 as
	begin
	update Equipos set tipoEquipo =@tipoEquipo, Modelo =@Modelo, Usuarioid =@Usuarioid where Equipoid = @Equipoid
	end




create table Usuarios
( 
	id int identity primary key,
	Nombre varchar(100) not null,
	correoElectronico varchar(100),
	Telefono varchar(100)
)

insert into Usuarios (Nombre, correoElectronico, Telefono) values ('Marc', '1235@gmail.com','456454')
insert into Usuarios (Nombre, correoElectronico, Telefono) values ('jaun', '1235@gmail.com','456454')
select * from Usuarios

--- procedimientos almacenados
---ingresar
create procedure ingresarUsuario
@Nombre varchar(100),
@correoElectronico varchar(100),
@Telefono varchar(100)
 as
	begin
		insert into Usuarios values (@Nombre, @correoElectronico, @Telefono) 
	end

exec ingresarUsuario ''

---borrar

create procedure borrarUsuario
@id int

 as
	begin
	delete Usuarios where id= @id
	end

---consulta

create procedure consultaUsuario

 as
	begin
	select * from Usuarios
	end

	--- Modificar

create procedure ModificarUsuario
 @id int,
 @Nombre varchar(100),
 @correoElectronico varchar(100),
 @Telefono varchar(100)
 
 as
	begin
	update Usuarios set Nombre =@Nombre, correoElectronico =@correoElectronico, Telefono =@Telefono where id = @id
	end

	
	create table Reparaciones
(
	Reparacionid int identity primary key,
	Equipoid int foreign key references Equipos(Equipoid),
	Estado varchar(100) not null,
	Fechasolicitud date,
	
	)

	create table DetallesReparacion
(
	Detalleid int identity primary key,
	Reparacionid int foreign key references Reparaciones(Reparacionid),
	Descripcion varchar(100) not null,
	FechaInicio date,
	FechaFin date
	
	)

	create table Asignaciones
(
	Asignacionid int identity primary key,
	Reparacionid int foreign key references Reparaciones(Reparacionid),
	Tecnicoid int foreign key references Tecnicos(Tecnicoid),
	FechaAsignacion date,
	
	)

	create table Tecnicos
(
	Tecnicoid int identity primary key,
	Nombre varchar(100) not null,
	Especialidad varchar(100)
	
	)

create procedure ingresarTecnico
@Nombre varchar(100),
@Especialidad varchar(100)

 as
	begin
		insert into Tecnicos values (@Nombre, @Especialidad) 
	end

create procedure borrarTecnico
@Tecnicoid int

 as
	begin
	delete Tecnicos where Tecnicoid= @Tecnicoid
	end

create procedure consultaTecnico
 as
	begin
	select * from Tecnicos
	end

create procedure ModificarTecnico
 @Tecnicoid int,
 @Nombre varchar(100),
 @Especialidad varchar(100)
 
 as
	begin
	update Tecnicos set Nombre =@Nombre, Especialidad =@Especialidad where Tecnicoid = @Tecnicoid
	end