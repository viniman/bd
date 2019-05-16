CREATE TABLE Fabricante (
	CGC varchar(20) NOT NULL PRIMARY KEY,
	nome varchar(100) NOT NULL,
	endereco varchar(150) NOT NULL
);

CREATE TABLE Produto (
	numero varchar(6) NOT NULL PRIMARY KEY,
	nomeComercial varchar(100) NOT NULL,
	tipoEmbalagem varchar(30) NOT NULL,
	quantidade integer DEFAULT 0 NOT NULL,
	precoUnitario numeric(10,2) DEFAULT 0.00 NOT NULL,
	CGC varchar(20) NOT NULL REFERENCES Fabricante(CGC)
);

CREATE TABLE Medicamento (
	numero varchar(6) NOT NULL PRIMARY KEY REFERENCES Produto(numero),
	tarja varchar(20) NOT NULL,
	formula varchar(500) NOT NULL
);

CREATE TABLE Perfumaria (
	numero varchar(6) NOT NULL PRIMARY KEY REFERENCES Produto(numero),
	tipo varchar(50) NOT NULL
);

CREATE TABLE Venda (
	numeroNota varchar(30) NOT NULL PRIMARY KEY,
	data date NOT NULL,
	nomeCliente varchar(150) NOT NULL,
	cidadeCliente varchar(30) DEFAULT "Juiz de Fora" NOT NULL
);

CREATE TABLE PerfumariaVenda (
	numeroProd varchar(6) NOT NULL REFERENCES Perfumaria(numero),
	numeroNota varchar(30) NOT NULL REFERENCES Venda(NumeroNota),
	quantidade integer DEFAULT 0 NOT NULL,
	imposto numeric(10,2),
	PRIMARY KEY(CGC, NumeroNota)
);

CREATE TABLE ReceitaMedica (
	CRM varchar(20) NOT NULL,
	numero varchar(6) NOT NULL,
	data date NOT NULL,
	nomeMedico varchar(150) NOT NULL,
	PRIMARY KEY(CRM, numero)
);

CREATE TABLE MedicamentoReceitaVenda (
	numeroMedicamento varchar(6) NOT NULL REFERENCES Produto(numero),
	numeroNota varchar(30) NOT NULL REFERENCES Venda(NumeroNota),
	CRM varchar(20) NOT NULL REFERENCES ReceitaMedica(CRM),
	numeroRM varchar(6) NOT NULL REFERENCES ReceitaMedica(numero),
	quantidade integer DEFAULT 0 NOT NULL,
	imposto numeric(10,2),
	PRIMARY KEY(numeroMedicamento, numeroNota)
);