SELECT nom_pais FROM aeroporto;

SELECT cod_companhia, nom_companhia FROM companhia;

SELECT nom_tripulante FROM tripulante WHERE vlr_salario > 1200.00;

SELECT nom_aeroporto, nom_cidade FROM aeroporto;

SELECT nom_tripulante FROM tripulante WHERE nom_tripulante LIKE '%A%' AND dat_admissao LIKE '1978-%-%';

SELECT min(dat_admissao) FROM tripulante;

SELECT max(dat_admissao) FROM tripulante;

SELECT max(vlr_salario) FROM tripulante;

SELECT min(vlr_salario) FROM tripulante;

SELECT avg(vlr_salario) FROM tripulante;

SELECT sum(vlr_salario) FROM tripulante;

SELECT nom_tripulante FROM tripulante WHERE vlr_salario * 1.5 <= 2000;

SELECT num_voo FROM voo WHERE cod_aeroporto_origem = 'PLU' OR cod_aeroporto_destino = 'PLU';

SELECT nom_tripulante  FROM tripulante WHERE vlr_salario < 1500 ORDER BY nom_tripulante ASC;

SELECT nom_tripulante  FROM tripulante WHERE vlr_salario > 1500 ORDER BY nom_tripulante DESC; 

SELECT dat_voo, hor_prevista_chegada, hor_prevista_saida FROM escala WHERE dat_voo LIKE '2006-02-%';

SELECT num_prefixo FROM programacao WHERE dat_voo LIKE '2006-%-%'; 

SELECT nom_aeroporto FROM aeroporto WHERE nom_aeroporto LIKE 'C%H';