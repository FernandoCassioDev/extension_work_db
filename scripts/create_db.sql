-- Tabela Pacientes
CREATE DATABASE db_clinica;
USE db_clinica;

CREATE TABLE pacientes (
    id_paciente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE NOT NULL,
    endereço VARCHAR(255),
    telefone VARCHAR(20),
    email VARCHAR(100),
    cpf VARCHAR(11) UNIQUE NOT NULL
);

-- Tabela Médicos
CREATE TABLE medicos (
    id_medico INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    especialidade VARCHAR(50),
    crm VARCHAR(20) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100)
);

-- Tabela Consultas
CREATE TABLE consultas (
    id_consulta INT PRIMARY KEY AUTO_INCREMENT,
    data_consulta DATE NOT NULL,
    hora_consulta TIME NOT NULL,
    status ENUM('Agendado', 'Concluído', 'Cancelado') NOT NULL,
    id_paciente INT,
    id_medico INT,
    FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente),
    FOREIGN KEY (id_medico) REFERENCES medicos(id_medico)
);

-- Tabela Usuários
CREATE TABLE usuarios (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nome_usuario VARCHAR(50) NOT NULL UNIQUE,
    senha VARCHAR(100) NOT NULL,
    tipo_usuario ENUM('administrador', 'medico', 'recepcionista') NOT NULL,
    id_medico INT,
    FOREIGN KEY (id_medico) REFERENCES medicos(id_medico)
);

-- Tabela Relatórios
CREATE TABLE relatorios (
    id_relatorio INT PRIMARY KEY AUTO_INCREMENT,
    data_geracao DATE NOT NULL,
    tipo_relatorio VARCHAR(50) NOT NULL,
    conteudo TEXT,
    id_usuario INT,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

-- Inserindo registros na tabela Pacientes
INSERT INTO pacientes (nome, data_nascimento, endereço, telefone, email, cpf)
VALUES 
('Ana Silva', '1990-05-15', 'Rua das Flores, 123', '(11) 98765-4321', 'ana.silva@email.com', '12345678901'),
('Carlos Santos', '1985-08-23', 'Avenida Paulista, 1500', '(11) 91234-5678', 'carlos.santos@email.com', '23456789012');

-- Inserindo registros na tabela Médicos
INSERT INTO medicos (nome, especialidade, crm, telefone, email)
VALUES 
('Dr. João Oliveira', 'Cardiologia', '123456-SP', '(11) 99876-5432', 'joao.oliveira@clinica.com'),
('Dra. Maria Costa', 'Dermatologia', '654321-SP', '(11) 97654-3210', 'maria.costa@clinica.com');

-- Inserindo registros na tabela Consultas
INSERT INTO consultas (data_consulta, hora_consulta, status, id_paciente, id_medico)
VALUES 
('2024-08-10', '09:00:00', 'Agendado', 1, 1),
('2024-08-11', '14:30:00', 'Concluído', 2, 2);

-- Inserindo registros na tabela Usuários
INSERT INTO usuarios (nome_usuario, senha, tipo_usuario, id_medico)
VALUES 
('admin', 'admin123', 'Administrador', NULL),
('drjoao', 'joao123', 'Médico', 1),
('draluiza', 'luiza123', 'Médico', 2),
('recepcao', 'recepcao123', 'Recepcionista', NULL);

-- Inserindo registros na tabela Relatórios
INSERT INTO relatorios (data_geracao, tipo_relatorio, conteudo, id_usuario)
VALUES 
('2024-08-12', 'Consultas Agendadas', 'Relatório de consultas agendadas para a semana', 1),
('2024-08-12', 'Consultas Concluídas', 'Relatório de consultas concluídas na última semana', 2);


