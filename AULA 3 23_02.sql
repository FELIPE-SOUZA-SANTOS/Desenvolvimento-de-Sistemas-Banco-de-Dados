#PROBLEMA 1
SELECT NOME, DE_FERIAS, BAIRRO FROM tabela_de_vendedores WHERE NOME ='Cláudia Morais' AND BAIRRO = 'Jardins';
-- Cláuda Morais está de ferias. --

#PROBLEMA 2
SELECT * FROM tabela_de_vendedores WHERE PERCENTUAL_COMISSAO > 0.10 AND DE_FERIAS = 1;
-- A pessoa que possui comissão maior que 0.10 é Roberta Martins, e está de férias -- 

#PROBLEMA 3 
SELECT * FROM notas_fiscais WHERE MATRICULA = '00237' OR DATA_VENDA = '2015-01-12';
-- O dado CPF é uma chave primaria da tabela clientes e uma chave estrangeira na tabela de notas fiscais,Uma pessoa pode realizar varias compras com 1 CPF, Mas as notas fiscais não podem se repetir --

#PROBLEMA 4 
SELECT codigo_do_produto, quantidade FROM itens_notas_fiscais WHERE quantidade >= 99 AND preco >= 44.50;
SELECT * FROM tabela_de_produtos WHERE CODIGO_DO_PRODUTO = '1022450';
-- o item que representa o maior valor de vendas é Açai --

#PROBLEMA 5 
SELECT * FROM itens_notas_fiscais WHERE numero = 102 AND CODIGO_DO_PRODUTO = '1101035';
SELECT * FROM notas_fiscais where NUMERO = 102; 
SELECT * FROM tabela_de_clientes where cpf = 8502682733;
SELECT * FROM notas_fiscais WHERE numero ='102';
SELECT * FROM tabela_de_vendedores WHERE MATRICULA = '00236';
SELECT * FROM tabela_de_produtos WHERE CODIGO_DO_PRODUTO = '1101035';

-- o nome do cliente é Valdeci da Silva, A vendedora responsável é Cláudia Morais e o produto é Linha Refrescante - 1 Litro - Morango/Limão --