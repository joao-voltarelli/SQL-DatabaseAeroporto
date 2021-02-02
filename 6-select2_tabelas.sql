/*EX 1*/
SELECT * FROM voo v WHERE v.cod_aeroporto_destino IN
(SELECT a1.cod_aeroporto FROM aeroporto a1 WHERE a1.nom_pais != "BRASIL") AND v.cod_aeroporto_origem IN
(SELECT a.cod_aeroporto FROM aeroporto a WHERE a.nom_pais = "BRASIL")


/*EX 2*/
SELECT a.nom_pais FROM aeroporto a, aeroporto a1 WHERE 
a.nom_pais = a1.nom_pais AND a.vlr_fuso_horario != a1.vlr_fuso_horario


/*EX 3*/
SELECT * FROM aeroporto a WHERE
(SELECT COUNT(*) FROM voo v where v.cod_aeroporto_origem = a.cod_aeroporto) >
(SELECT COUNT(*) FROM voo v where v.cod_aeroporto_destino = a.cod_aeroporto)


/*EX 4*/
SELECT c.nom_companhia, COUNT(p.num_voo) AS NumeroDeVoos
FROM aeronave a INNER JOIN companhia c INNER JOIN programacao p
ON p.num_prefixo = a.num_prefixo AND a.cod_companhia = c.cod_companhia
GROUP BY c.nom_companhia
ORDER BY NumeroDeVoos DESC


/*EX 5*/
SELECT a.nom_aeroporto FROM aeroporto a WHERE a.cod_aeroporto NOT IN
(SELECT e.cod_aeroporto FROM escala e)


/*EX 6*/
SELECT c.nom_companhia, COUNT(p.num_voo) AS NumeroDeVoos
FROM aeronave a INNER JOIN companhia c INNER JOIN programacao p
ON p.num_prefixo = a.num_prefixo AND a.cod_companhia = c.cod_companhia
GROUP BY c.nom_companhia