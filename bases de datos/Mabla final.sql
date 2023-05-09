create database mabla;
use mabla;

create table Usuario(
Nombre varchar(30) not null,
Apellido varchar(30),
Teléfono int not null,
Correo varchar(50),
Alias varchar(50) not null,
Contraseña varchar(100) not null,
img_Perfil blob,
primary key(Alias)
);

create table Temas(
id int not null auto_increment,
Categoría varchar(100) not null,
primary key(id)
);

create table Vocabulario(
id int not null auto_increment primary key,
SubTema varchar(70),
Palabra varchar(70) not null,
Senia blob,
idTema int,
foreign key(idTema) references Temas(id)
);

-- drop table Vocabulario;

create table Quizes1(
id int not null auto_increment primary key,
pregunta varchar(100),
resAcertada blob,
resErronea1 blob,
resErronea2 blob,
resErronea3 blob,
resErronea4 blob,
deTipo int,
foreign key(deTipo) references Temas(id)
);
create table Quizes2(
id int not null auto_increment primary key,
pregunta blob,
resAcertada varchar(70),
resErronea1 varchar(70),
resErronea2 varchar(70),
resErronea3 varchar(70),
resErronea4 varchar(70),
deTipo int,
foreign key(deTipo) references Temas(id)
);

