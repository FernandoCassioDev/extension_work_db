-- Selecionar todos os médicos cadastrados na clínica
SELECT * FROM medicos;

-- Selecionar todos os pacientes cadastrados na clínica
SELECT * FROM pacientes;

-- Consultar todas as consultas agendadas, mostrando os detalhes da consulta, o nome do médico e o nome do paciente
SELECT c.id_consulta, c.data_consulta, c.hora_consulta, c.status,
       m.nome AS nome_medico, p.nome AS nome_paciente
FROM consultas c
JOIN medicos m ON c.id_medico = m.id_medico
JOIN pacientes p ON c.id_paciente = p.id_paciente;

-- Consultar todas as consultas de um determinado médico (por exemplo, com id_medico = 1)
SELECT c.id_consulta, c.data_consulta, c.hora_consulta, c.status,
       m.nome AS nome_medico, p.nome AS nome_paciente
FROM consultas c
JOIN medicos m ON c.id_medico = m.id_medico
JOIN pacientes p ON c.id_paciente = p.id_paciente
WHERE c.id_medico = 1;

-- Consultar todos os relatórios gerados por um determinado usuário (por exemplo, com id_usuario = 1)
SELECT r.id_relatorio, r.data_geracao, r.tipo_relatorio, r.conteudo,
       u.nome_usuario
FROM relatorios r
JOIN usuarios u ON r.id_usuario = u.id_usuario
WHERE r.id_usuario = 1;

-- Consultar todas as consultas realizadas por um determinado paciente (por exemplo, com id_paciente = 1)
SELECT c.id_consulta, c.data_consulta, c.hora_consulta, c.status,
       m.nome AS nome_medico, p.nome AS nome_paciente
FROM consultas c
JOIN medicos m ON c.id_medico = m.id_medico
JOIN pacientes p ON c.id_paciente = p.id_paciente
WHERE c.id_paciente = 1;

-- Contar o número total de consultas realizadas por cada médico
SELECT m.nome AS nome_medico, COUNT(c.id_consulta) AS total_consultas
FROM medicos m
LEFT JOIN consultas c ON m.id_medico = c.id_medico
GROUP BY m.nome;

-- Listar os usuários do sistema e associar com os médicos (se aplicável)
SELECT u.id_usuario, u.nome_usuario, u.tipo_usuario, m.nome AS nome_medico
FROM usuarios u
LEFT JOIN medicos m ON u.id_medico = m.id_medico;

-- Consultar o número total de consultas realizadas por cada paciente
SELECT p.nome AS nome_paciente, COUNT(c.id_consulta) AS total_consultas
FROM pacientes p
LEFT JOIN consultas c ON p.id_paciente = c.id_paciente
GROUP BY p.nome;

-- Consultar o status das consultas e quantas consultas estão em cada status
SELECT status, COUNT(*) AS total
FROM consultas
GROUP BY status;
