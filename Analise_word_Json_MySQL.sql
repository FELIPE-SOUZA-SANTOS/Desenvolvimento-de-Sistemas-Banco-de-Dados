# Aula 25/03/26 - Introdução MySQL e Json
-- Exemplos de Json 
create schema exemplos_json;
use exemplos_json;

create table palavra(
json_palavra varchar(350));

insert into palavra values(
'{
  "nome": "Felipe",
  "sobrenome": "Souza",
  "idade":"21",
  "ID":"001"
}'
);

select * from palavra;

create table palavra2(
json_palavra2 json
);

 insert into palavra2 values(
'{
  "nome": "Felipe",
  "sobrenome": "Souza",
  "idade":"21",
  "ID":"001"
}'
);

select * from palavra2;

drop schema exemplos_json;

-- Fim de Exemplos
# Aula 25/03/26 - Introdução MySQL e Json
use wolrd_x;

select * from countryinfo;

select * from countryinfo where _id = 'BRA';

select json_keys(doc) from countryinfo where _id = 'BRA';

select json_keys(doc,"$.geography") from countryinfo where _id = 'BRA';

select json_extract(doc,"$.government") from countryinfo where _id = 'BRA';

select json_extract(doc,"$.IndepYear") from countryinfo where _id = 'BRA';

select json_extract(doc,"$.geography.Continent") as CONTINENTE from countryinfo where _id = 'BRA';

select json_extract(doc,"$.geography.Continent") as CONTINENTE,
json_extract (doc,"$.demographics.Population") as POPULACAO
 from countryinfo where _id = 'BRA';
 
 /* Qustão 1 - Exibam uma tabela com a população total e a média de expectativa de vida de cada continente 
 para os países que são monarquias. Agrupe e ordene os dados*/
 
 SELECT 
    json_extract(doc, "$.geography.Continent") AS continente,
    SUM(json_extract(doc, "$.demographics.Population")) AS populacao_total,
    AVG(json_extract(doc, "$.demographics.LifeExpectancy")) AS media_expectativa_vida
FROM countryinfo
WHERE json_extract(doc, "$.government.GovernmentForm") LIKE "%Monarchy%"
GROUP BY continente
ORDER BY populacao_total DESC;
 
 
 /* Questão 2 - Demonstre o uso de 3 funções JSON, disponivel na documentação, utillizando diferentes chaves
 e valores do banco de dados world_x*/
 
SELECT json_keys(doc) AS chaves
FROM countryinfo
WHERE _id = 'BRA';

-- JSON_KEYS mostra as chaves do JSON.

SELECT 
    json_extract(doc, "$.Name") AS nome_pais,
    json_extract(doc, "$.demographics.Population") AS populacao
FROM countryinfo
WHERE _id = 'BRA';

-- JSON_EXTRACT pega valores específicos.

SELECT 
    _id,
    json_contains(doc, '"South America"', "$.geography.Continent") AS eh_america_sul
FROM countryinfo;

-- JSON_CONTAINS verifica se um valor existe.


