create schema Integracao;

use Integracao;

create table cliente(
cpf varchar(11) not null primary key,
    primeiro_nome varchar(15) not null,
    sobrenome varchar(25),
    idade int not null
);

CREATE TABLE produto(

id INT AUTO_INCREMENT PRIMARY KEY,

nome VARCHAR(100) NOT NULL,

categoria VARCHAR(100) NOT NULL,

preco DECIMAL(10,2) NOT NULL,

quantidade INT NOT NULL

);

select * from cliente;