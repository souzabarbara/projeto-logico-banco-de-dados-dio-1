CREATE TABLE Cliente (
    cliente_id INT PRIMARY KEY,
    nome VARCHAR(255),
    email VARCHAR(255),
    tipo VARCHAR(2)
);

CREATE TABLE Servico (
    servico_id INT PRIMARY KEY,
    descricao TEXT,
    preco DECIMAL(10, 2)
);

CREATE TABLE ServicoRealizado (
    servico_realizado_id INT PRIMARY KEY,
    cliente_id INT,
    servico_id INT,
    data DATE,
    FOREIGN KEY (cliente_id) REFERENCES Cliente(cliente_id),
    FOREIGN KEY (servico_id) REFERENCES Servico(servico_id)
);

CREATE TABLE Produto (
    produto_id INT PRIMARY KEY,
    nome VARCHAR(255),
    descricao TEXT,
    preco DECIMAL(10, 2)
);

CREATE TABLE Estoque (
    estoque_id INT PRIMARY KEY,
    produto_id INT,
    quantidade INT,
    FOREIGN KEY (produto_id) REFERENCES Produto(produto_id)
);

CREATE TABLE Fornecedor (
    fornecedor_id INT PRIMARY KEY,
    nome VARCHAR(255)
);

CREATE TABLE ProdutoFornecedor (
    produto_id INT,
    fornecedor_id INT,
    PRIMARY KEY (produto_id, fornecedor_id),
    FOREIGN KEY (produto_id) REFERENCES Produto(produto_id),
    FOREIGN KEY (fornecedor_id) REFERENCES Fornecedor(fornecedor_id)
);

CREATE TABLE Venda (
    venda_id INT PRIMARY KEY,
    cliente_id INT,
    data DATE,
    FOREIGN KEY (cliente_id) REFERENCES Cliente(cliente_id)
);

CREATE TABLE VendaItem (
    venda_item_id INT PRIMARY KEY,
    venda_id INT,
    produto_id INT,
    quantidade INT,
    FOREIGN KEY (venda_id) REFERENCES Venda(venda_id),
    FOREIGN KEY (produto_id) REFERENCES Produto(produto_id)
);

CREATE TABLE Agendamento (
    agendamento_id INT PRIMARY KEY,
    cliente_id INT,
    servico_id INT,
    data_agendamento DATE,
    FOREIGN KEY (cliente_id) REFERENCES Cliente(cliente_id),
    FOREIGN KEY (servico_id) REFERENCES Servico(servico_id)
);
