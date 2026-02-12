CREATE DATABASE escola;
USE escola;
CREATE TABLE estudantes(
id_estudante INT PRIMARY KEY  AUTO_INCREMENT NOT NULL,
data_nascimento DATE NOT NULL,
localidade VARCHAR(10) NOT NULL,
veiculo_proprio BIT NOT NULL,
profissao VARCHAR(100) 
);

INSERT INTO estudantes (data_nascimento, localidade, veiculo_proprio, profissao)
VALUES ('2006-10-10', 'Leste', 0, 'Analista de suporte'),
('2006-09-06', 'Sul', 1, 'Produção'),
('1993-05-01','Oeste', 0, 'Estoquista'),
('1998-01-30','Oeste', 1, 'Estudante'), 
('2003-12-13','Oeste', 0, 'Auxiliar Financeiro'),
('2000-05-19','Oeste', 0, 'Assistente de TI'),
('1976-03-05','Oeste', 0, 'Estudante'),
('1977-05-16','Norte', 0, 'Organização'),
('2002-08-30','Oeste', 0, 'Estudante'),
('2006-08-20','Oeste', 0, 'Estudante'), 
('2006-07-10','Norte', 1, 'Estudante');

SELECT * FROM estudantes;

SELECT data_nascimento
FROM estudantes
WHERE data_nascimento <= 18;

SELECT data_nascimento
FROM estudantes
WHERE data_nascimento >= 18;

SELECT *
FROM estudantes
WHERE veiculo_proprio = '1';

SELECT DISTINCT localidade
FROM estudantes;

SELECT *
FROM estudantes
WHERE profissao = 'Assistente de TI';

SELECT *
FROM estudantes 
WHERE profissao = 'Estudante'
AND veiculo_proprio = '1';


       
