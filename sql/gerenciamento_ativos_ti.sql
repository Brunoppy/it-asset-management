CREATE DATABASE Gerenciamento_Ativos_TI;
USE Gerenciamento_Ativos_TI;

-- Tabela para armazenar categorias de ativos (ex: Hardware, Software, Licença)
CREATE TABLE categorias_ativos (
    categoria_id INT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(100) NOT NULL UNIQUE
);

-- Tabela para gerenciar ativos de TI
CREATE TABLE ativos_ti (
    ativo_id INT AUTO_INCREMENT PRIMARY KEY,
    nome_ativo VARCHAR(255) NOT NULL,
    categoria_id INT,
    numero_serie VARCHAR(100) UNIQUE,
    data_compra DATE,
    validade_garantia DATE,
    atribuido_a INT NULL,
    status ENUM('Ativo', 'Em Manutenção', 'Aposentado') NOT NULL DEFAULT 'Ativo',
    FOREIGN KEY (categoria_id) REFERENCES categorias_ativos(categoria_id),
    FOREIGN KEY (atribuido_a) REFERENCES funcionarios(funcionario_id)
);

-- Tabela para rastrear licenças de software
CREATE TABLE licencas_software (
    licenca_id INT AUTO_INCREMENT PRIMARY KEY,
    nome_software VARCHAR(255) NOT NULL,
    chave_licenca VARCHAR(255) UNIQUE NOT NULL,
    data_expiracao DATE,
    atribuido_a INT NULL,
    FOREIGN KEY (atribuido_a) REFERENCES funcionarios(funcionario_id)
);

-- Tabela para registros de manutenção dos ativos
CREATE TABLE manutencao_ativos (
    manutencao_id INT AUTO_INCREMENT PRIMARY KEY,
    ativo_id INT NOT NULL,
    data_manutencao DATE NOT NULL,
    detalhes_manutencao TEXT,
    nome_tecnico VARCHAR(255),
    FOREIGN KEY (ativo_id) REFERENCES ativos_ti(ativo_id)
);
