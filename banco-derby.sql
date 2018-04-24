DROP TABLE categorias;
DROP TABLE clientes;
DROP TABLE pagamentos;
DROP TABLE pagamentos_boleto;
DROP TABLE pagamentos_cartao_credito;
DROP TABLE pedidos;
DROP TABLE pedidos_itens;
DROP TABLE produtos;

CREATE TABLE categorias
(
	id INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY
        (START WITH 1, INCREMENT BY 1),   
	descricao VARCHAR(50),
	ativo BOOLEAN
) 
;

CREATE TABLE clientes
(
	id INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY
        (START WITH 1, INCREMENT BY 1),
	nome VARCHAR(100),
	telefone VARCHAR(20),
	email VARCHAR(50),
	senha VARCHAR(20),
	endereco_rua VARCHAR(100),
  	endereco_numero VARCHAR(15),
	endereco_bairro VARCHAR(50),
  	endereco_cep VARCHAR(10),
  	endereco_cidade VARCHAR(50),
  	endereco_estado CHAR(2),
	ativo BOOLEAN
	 
)
;
CREATE TABLE pagamentos
(
	id INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY
        (START WITH 1, INCREMENT BY 1),
	data_pagamento TIMESTAMP,
	valor DOUBLE
	 
) 
;
CREATE TABLE pagamentos_boleto
(
	id INTEGER NOT NULL,
	id_banco INTEGER,
	cedente VARCHAR(50),
	sacado VARCHAR(50),
	codigo_barras VARCHAR(50),
	data_vencimento TIMESTAMP
	 
) 
;
CREATE TABLE pagamentos_cartao_credito
(
	id INTEGER NOT NULL,
	id_bandeira_cartao_credito INTEGER,
	nome_titular VARCHAR(50),
	numero_cartao VARCHAR(50),
	numero_confirmacao INTEGER,
	data_validade_cartao TIMESTAMP
	 
) 
;
CREATE TABLE pedidos
(
	numero INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY
        (START WITH 1, INCREMENT BY 1),
	data TIMESTAMP,
	cliente_IP VARCHAR(50),
	cliente_browser VARCHAR(50),
	id_cliente INTEGER,
	id_pagamento INTEGER,
	status VARCHAR(20)
) 
;
CREATE TABLE pedidos_itens
(
	id INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY
        (START WITH 1, INCREMENT BY 1),
	numero_pedido INTEGER,
	quantidade INTEGER,
	desconto INTEGER,
	id_produto INTEGER
	 
) 
;
CREATE TABLE produtos
(
	id INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY
        (START WITH 1, INCREMENT BY 1),
	nome VARCHAR(255),
	preco DOUBLE,
	marca VARCHAR(50),
	id_categoria INTEGER,
	ativo BOOLEAN,
	tipo_produto CHAR(1),
	taxa_entrega DOUBLE,
	nome_arquivo VARCHAR(50),
	tamanho_arquivo INTEGER
	 
) 
;
insert into clientes  (ativo,email,endereco_bairro,endereco_cep,endereco_cidade,endereco_estado,endereco_numero,endereco_rua,nome,senha,telefone)
values (true,'kirk@enterprise.com','Via Lactea','12345-678','Terra','SP','1701','USS Enterprise','James T Kirk','8765','(11) 1234-5678');

insert into clientes  (ativo,email,endereco_bairro,endereco_cep,endereco_cidade,endereco_estado,endereco_numero,endereco_rua,nome,senha,telefone)
values (true,'scott@enterprise.com','Via Lactea','12345-678','Terra','SP','1701','USS Enterprise','Scott','5678','(11) 8765-4321');

insert into clientes (ativo,email,endereco_bairro,endereco_cep,endereco_cidade,endereco_estado,endereco_numero,endereco_rua,nome,senha,telefone)
values (true,'uhura@enterprise.com','Via Lactea','12345-678','Terra','SP','1701','USS Enterprise','Uhura','1234','(11) 5678-1234');

insert into clientes  (ativo,email,endereco_bairro,endereco_cep,endereco_cidade,endereco_estado,endereco_numero,endereco_rua,nome,senha,telefone)
values (true,'McCoy@enterprise.com','Via Lactea','12345-678','Terra','SP','1701','USS Enterprise','McCoy','4321','(11) 8765-4321');

insert into categorias (descricao,ativo) values ('DVD',true);
insert into categorias (descricao,ativo) values ('Livro',true);
insert into categorias (descricao,ativo) values ('Eletronico',true);
insert into categorias (descricao,ativo) values ('Administracao',true);

insert into produtos (ativo,marca,nome,preco,id_categoria,tipo_produto,taxa_entrega) values (true,'Microsoft','Arc Mouse Wireless', 250.0, 1, 'M', 5.0);
insert into produtos (ativo,marca,nome,preco,id_categoria,tipo_produto,taxa_entrega) values (true,'Apple','iPhone 3GC', 1200.0, 2, 'M', 25.0);
insert into produtos (ativo,marca,nome,preco,id_categoria,tipo_produto,taxa_entrega) values (true,'iBooks','Core Java 5', 120.0, 3, 'M', 3.0);

insert into produtos (ativo,marca,nome,preco,id_categoria,tipo_produto,nome_arquivo,tamanho_arquivo) values (true,'Oracle JDK','JDK 5', 120.0, 1, 'D', 'teste.exe', 1024);
insert into produtos (ativo,marca,nome,preco,id_categoria,tipo_produto,nome_arquivo,tamanho_arquivo) values (true,'Logman','Logman Dictionary', 730.0, 2, 'D', 'dictionary.exe', 2048);
insert into produtos (ativo,marca,nome,preco,id_categoria,tipo_produto,nome_arquivo,tamanho_arquivo) values (true,'iBooks','Core Java 5', 500.0, 3, 'D', 'livro.pdf', 4096);
