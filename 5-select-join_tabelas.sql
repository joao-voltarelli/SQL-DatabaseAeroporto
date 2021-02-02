/* PRODUTO CARTESIANO

SELECT c.nomeCargo, f.nomeFuncionario FROM  cargo c, funcionario f

SELECT c.nomeCargo, f.nomeFuncionario FROM  cargo c INNER JOIN funcionario f

SELECT c.nomeCargo, f.nomeFuncionario FROM  cargo c CROSS JOIN funcionario f
*/

/* USA-SE 'ON' QUANDO SE TEM O INNER JOIN, SÓ SERVE PARA FAZER RELAÇÕES DE CHAVE */

SELECT c.nomeCargo, f.nomeFuncionario 
FROM  cargo as c INNER JOIN funcionario as f
ON c.idCargo = f.idCargo
WHERE salarioFuncionario > 2000

SELECT c.nomeCargo, f.nomeFuncionario 
FROM  cargo as c INNER JOIN funcionario as f
USING (idCargo) /*  QUANDO O NOME DA CHAVE É IGUAL NAS DUAS TABELAS PODE-SE USAR 'USING' */

/*  QUANDO O NOME DA CHAVE É IGUAL NAS DUAS TABELAS PODE-SE USAR NATURAL JOIN AO INVÉS DE INNER JOIN */

SELECT c.nomeCargo, f.nomeFuncionario 
FROM  cargo as c NATURAL JOIN funcionario as f

/* FAZ A RELAÇÃO DANDO PRIORIDADE PARA A TABELA DA ESQUERDA */

SELECT c.nomeCargo, f.nomeFuncionario 
FROM  cargo as c NATURAL LEFT JOIN funcionario as f /* NOMES IGUAIS PODE-SE USAR NATURAL */
ON c.idCargo = f.idCargo

/* PRATICA 5 */

SELECT a.num_prefixo, c.nom_companhia
FROM aeronave AS a NATURAL JOIN companhia AS c


SELECT v.num_voo, v.vlr_distancia, v.vlr_preco
FROM voo AS v INNER JOIN aeroporto AS a
WHERE v.cod_aeroporto_origem = a.cod_aeroporto AND a.nom_cidade = 'BELO HORIZONTE'


SELECT v.num_voo, v.vlr_distancia, v.vlr_preco, a.nom_aeroporto
FROM voo AS v INNER JOIN aeroporto AS a
ON v.cod_aeroporto_destino = a.cod_aeroporto 
WHERE a.nom_cidade = 'BELO HORIZONTE'


SELECT t.nom_tripulante, c.nom_cargo
FROM tripulante AS t INNER JOIN cargo AS c INNER JOIN base b
ON t.cod_cargo = c.cod_cargo AND t.cod_base = b.cod_base 
WHERE ind_base = 'D'


SELECT a1.nom_aeroporto AS Origem, a2.nom_aeroporto AS Destino 
FROM aeroporto AS a1 INNER JOIN aeroporto AS a2 INNER JOIN voo AS v
ON a1.cod_aeroporto = v.cod_aeroporto_origem  AND a2.cod_aeroporto = v.cod_aeroporto_destino
WHERE vlr_distancia < 500


SELECT v.num_voo, a1.nom_aeroporto AS Origem, a2.nom_aeroporto AS Destino
FROM aeroporto a1 INNER JOIN aeroporto a2 INNER JOIN voo v
ON a1.cod_aeroporto = v.cod_aeroporto_origem AND a2.cod_aeroporto = v.cod_aeroporto_destino
WHERE a1.nom_pais = 'BRASIL'


SELECT a.nom_aeroporto, a.nom_pais
from voo v inner join aeroporto a inner join programacao p
on a.cod_aeroporto=v.cod_aeroporto_destino and v.num_voo = p.num_voo
where p.dat_voo between '2006-01-01'AND '2006-12-31'


SELECT count(e.num_escala) AS QuantidadeEscalas
FROM escala e INNER JOIN aeroporto a
ON a.cod_aeroporto = e.cod_aeroporto
WHERE a.nom_cidade = 'SAO PAULO' AND e.dat_voo BETWEEN '2004-01-01' AND '2006-12-31'


SELECT count(v.num_voo) AS QuantidadeVoos
FROM voo v INNER JOIN programacao p INNER JOIN escala e INNER JOIN aeroporto a
ON v.cod_aeroporto_origem = a.cod_aeroporto AND v.num_voo = p.num_voo AND e.cod_aeroporto = a.cod_aeroporto
WHERE a.nom_pais = 'BRASIL' AND p.dat_voo LIKE '2004-%-%' AND e.hor_prevista_chegada BETWEEN '13:00:00' AND '16:00:00'


SELECT t.nom_tripulante, a.num_prefixo, e.num_escala, v.num_voo, e.dat_voo, e.hor_prevista_chegada, e.hor_prevista_saida
FROM tripulante t INNER JOIN aeronave a INNER JOIN escala e INNER JOIN voo v INNER JOIN programacao p INNER JOIN equipe_voo eq
ON v.num_voo = e.num_voo AND v.num_voo = p.num_voo AND p.num_prefixo = a.num_prefixo AND e.dat_voo = p.dat_voo AND t.cod_tripulante = eq.cod_tripulante AND eq.num_voo = v.num_voo AND p.dat_voo = eq.dat_voo
WHERE e.dat_voo LIKE '2004-%-%' AND e.hor_prevista_chegada BETWEEN '15:00:00' AND '18:00:00'


SELECT COUNT(v.num_voo) AS QntdeVoos
FROM voo v INNER JOIN aeroporto a
ON v.cod_aeroporto_destino = a.cod_aeroporto
WHERE a.nom_pais = 'PORTUGAL'


SELECT a.nom_aeroporto
FROM aeroporto a INNER JOIN voo v INNER JOIN tripulante t INNER JOIN cargo c INNER JOIN equipe_voo e
ON a.cod_aeroporto = v.cod_aeroporto_destino AND c.cod_cargo = t.cod_cargo AND v.num_voo = e.num_voo AND e.cod_tripulante = t.cod_tripulante
WHERE t.cod_cargo = 2 AND t.nom_tripulante LIKE '%ALMEIDA'


SELECT t.nom_tripulante, e.dat_voo
FROM tripulante t INNER JOIN equipe_voo e
ON t.cod_tripulante = e.cod_tripulante
WHERE e.dat_voo LIKE '2004-%-%'

SELECT t.nom_tripulante, e.dat_voo
FROM tripulante t NATURAL LEFT JOIN (SELECT t.cod_tripulante, ev.dat_voo FROM tripulante t NATURAL JOIN equipe_voo ev WHERE ev.dat_voo LIKE '2004-%-%') AS e