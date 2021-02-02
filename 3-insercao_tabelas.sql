/*EX 1*/

INSERT INTO base(cod_base, nom_base, ind_base) VALUES (1, 'ALCANTARA', 'D'), (2, 'SANTOS', 'D'), (3, 'SAO SEBASTIAO', 'M'), (4, 'SAO JOSE', 'M');

INSERT INTO cargo(cod_cargo, nom_cargo) VALUES (1, 'PILOTO'), (2, 'COMISSARIO');

INSERT INTO tripulante(cod_tripulante, cod_cargo, cod_base, nom_tripulante, dat_admissao, vlr_salario) VALUES
('AA001', 1, 1, 'JOAO PEDRO DA SILVA', '1979-10-01', 1500),
('AA002', 1, 2, 'PEDRO UBIRAJARA', '1978-12-05', 2500),
('AA003', 2, 3, 'RICARDO ALMEIDA', '1995-07-15', 3000),
('AA004', 2, 3, 'PAULO HENRIQUE', '1991-01-15', 4000),
('AA005', 2, 2, 'MARIA LUIZA', '2000-06-01', 1800);

ALTER TABLE tipo_aeronave CHANGE dsc_tipo_aeronave dsc_tipo_aeronave VARCHAR(30);

INSERT INTO tipo_aeronave(cod_tipo_aeronave, dsc_tipo_aeronave) VALUES
('AB4000', 'AIR BUS 4000'),
('AB6000', 'AIR BUS 6000'),
('BG7377', 'BOEING 737-700'),
('BG7373', 'BOEING 737-300');

ALTER TABLE aeronave DROP FOREIGN KEY fk_aeronave_companhia;

ALTER TABLE companhia CHANGE cod_companhia cod_companhia VARCHAR(5);

ALTER TABLE aeronave CHANGE cod_companhia cod_companhia VARCHAR(5);

ALTER TABLE aeronave ADD(
    CONSTRAINT fk_aeronave_companhia
        FOREIGN KEY(cod_companhia)
    REFERENCES companhia(cod_companhia)
);

INSERT INTO companhia(cod_companhia, nom_companhia, sig_companhia) VALUES
('G1', 'X GOL', 'GOL'),
('V1', 'Y VAR', 'VARIG'),
('T1', 'Z TAM', 'TAM');

INSERT INTO aeronave(num_prefixo, cod_tipo_aeronave, cod_base, dat_aquisicao, cod_companhia) VALUES
('00001', 'AB4000', 4, '2001-01-15', 'V1'),
('00002', 'AB6000', 4, '2001-01-20', 'T1'),
('00003', 'BG7377', 3, '2003-01-25', 'G1'),
('00004', 'BG7373', 3, '2006-01-23', 'V1');

INSERT INTO aeroporto(cod_aeroporto, nom_aeroporto, nom_cidade, sig_uf, nom_pais, vlr_fuso_horario) VALUES
('PLU', 'PAMPULHA', 'BELO HORIZONTE', 'XX', 'BRASIL', 9),
('CNF', 'TANCREDO NEVES', 'BELO HORIZONTE', 'XX', 'BRASIL', 9),
('VRC', 'VIRACOPOS', 'CAMPINAS', 'XX', 'BRASIL', 9),
('CGH', 'CONGONHAS', 'SAO PAULO', 'XX', 'BRASIL', 9),
('SSA', 'LUIS ANTONIO CARLOS', 'SALVADOR', 'XX', 'BRASIL', 9),
('PRE', 'SALGADO FILHO', 'PORTO ALEGRE', 'XX', 'BRASIL', 9),
('GRU', 'FRANCO MONTORO', 'GUARULHOS', 'XX', 'BRASIL', 9);

INSERT INTO voo(num_voo, cod_aeroporto_origem, cod_aeroporto_destino, vlr_distancia, vlr_preco) VALUES
(1, 'PLU', 'PRE', 800, 350),
(2, 'VRC', 'SSA', 1200, 450),
(3, 'CGH', 'VRC', 250, 150),
(4, 'SSA', 'CGH', 1100, 400),
(5, 'PRE', 'PLU', 1600, 500),
(6, 'PRE', 'SSA', 2400, 650),
(7, 'SSA', 'VRC', 1200, 450),
(8, 'VRC', 'CGH', 250, 150),
(9, 'CGH', 'SSA', 1100, 400),
(10, 'PLU', 'VRC', 400, 200);

INSERT INTO programacao(num_voo, dat_voo, num_prefixo) VALUES
(4, '2004-01-02', '00001'),
(4, '2005-02-22', '00001'),
(4, '2006-02-01', '00001'),
(2, '2004-01-03', '00002'),
(5, '2007-01-03', '00004');

INSERT INTO equipe_voo(num_voo, dat_voo, cod_tripulante) VALUES
(2, '2004-01-03', 'AA001'),
(4, '2006-02-01', 'AA001'),
(2, '2004-01-03', 'AA002'),
(4, '2004-01-02', 'AA002'),
(4, '2005-02-22', 'AA002'),
(2, '2004-01-03', 'AA003'),
(4, '2005-02-22', 'AA003'),
(4, '2006-02-01', 'AA003'),
(4, '2004-01-02', 'AA004');

INSERT INTO escala(num_escala, num_voo, dat_voo, cod_aeroporto, hor_prevista_chegada, hor_prevista_saida) VALUES
(1, 2, '2004-01-03', 'CGH', '13:00:00', '14:00:00'),
(1, 4, '2006-02-01', 'CGH', '17:00:00', '18:00:00'),
(2, 2, '2004-01-03', 'PLU', '15:00:00', '15:30:00'),
(2, 4, '2006-02-01', 'CNF', '19:00:00', '19:30:00'),
(3, 4, '2006-02-01', 'PRE', '15:00:00', '16:00:00');

/*EX 2*/

INSERT INTO tripulante(cod_tripulante, cod_cargo, cod_base, nom_tripulante, dat_admissao, vlr_salario) VALUES
('MS667', 1, 3, 'JOAO DA SILVA', '1979-10-01', 1500),
('OR003', 2, 3, 'MARIA DA CRUZ', '1978-12-05', 1600),
('AP128', 1, 3, 'PEDRO SANTOS', '1995-07-15', 1700),
('AS459', 2, 3, 'JOSE MARIA', '1991-08-20', 1800);

/*EX 3*/

UPDATE aeroporto SET nom_pais = 'BRASIL', vlr_fuso_horario = 0;

/*EX 4*/

ALTER TABLE tripulante CHANGE vlr_salario vlr_salario NUMERIC(8,2);

UPDATE tripulante SET vlr_salario = 1200.50 WHERE cod_tripulante = 'MS667';
UPDATE tripulante SET vlr_salario = 1000.00 WHERE cod_tripulante = 'OR003';
UPDATE tripulante SET vlr_salario = 1456.00 WHERE cod_tripulante = 'AP128';
UPDATE tripulante SET vlr_salario = 1250.00 WHERE cod_tripulante = 'AS459';

/*EX 5*/

ALTER TABLE programacao DROP FOREIGN KEY fk_programacao_aeronave;

ALTER TABLE aeronave CHANGE num_prefixo num_prefixo INTEGER NOT NULL;

ALTER TABLE programacao CHANGE num_prefixo num_prefixo INTEGER NOT NULL;

ALTER TABLE programacao ADD(
    CONSTRAINT fk_programacao_aeronave
        FOREIGN KEY(num_prefixo)
    REFERENCES aeronave(num_prefixo)
);

UPDATE aeronave SET cod_companhia = 'V1' WHERE num_prefixo = 1;
UPDATE aeronave SET cod_companhia = 'G1' WHERE num_prefixo = 2;
UPDATE aeronave SET cod_companhia = 'T1' WHERE num_prefixo = 3;
UPDATE aeronave SET cod_companhia = 'V1' WHERE num_prefixo = 4;

/*EX 7*/

INSERT INTO aeroporto(cod_aeroporto, nom_aeroporto, nom_cidade, sig_uf, nom_pais, vlr_fuso_horario) VALUES
('LON', 'AI LONDRES', 'LONDRES', 'NA', 'INGLATERRA', 3),
('PAR' , 'AI FRANCA', 'PARIS', 'NA', 'FRANCA', 5),
('LIS', 'AI PORTUGAL', 'LISBOA', 'NA', 'PORTUGAL', 4),
('ROM', 'AI ITALIA', 'ROMA', 'NA', 'ITALIA', 2);

/*EX 8*/

INSERT INTO voo(num_voo, cod_aeroporto_origem, cod_aeroporto_destino, vlr_distancia, vlr_preco) VALUES
(11, 'GRU', 'LIS', 3400, 1400),
(12, 'GRU', 'PAR', 3600, 1600),
(13, 'LIS', 'GRU', 3400, 1400),
(14, 'ROM', 'CNF', 3800, 1700);

/*EX 9*/

DELETE FROM tripulante WHERE vlr_salario = 1550 && vlr_salario = 1750;

/*EX 10*/

UPDATE tripulante SET vlr_salario = vlr_salario * 1.2;