/*EX(1)*/
ALTER TABLE aeroporto ADD(
    sig_uf VARCHAR(2) NOT NULL,
    nom_pais VARCHAR(20) NOT NULL,
    vlr_fuso_horario NUMERIC(2) NOT NULL
);


/*EX(2)*/
ALTER TABLE tripulante ADD(
    vlr_salario NUMERIC(8.2) DEFAULT 1000
);

/*EX(3)*/
ALTER TABLE tripulante ADD CHECK(vlr_salario >= 1000 AND vlr_salario <= 2000);

/*EX(4)*/
CREATE TABLE IF NOT EXISTS companhia(
    cod_companhia NUMERIC(3) NOT NULL,
    nom_companhia VARCHAR(30) NOT NULL,
    sig_companhia VARCHAR(5) NOT NULL,

    CONSTRAINT pk_companhia
        PRIMARY KEY(cod_companhia)
)engine="innodb";

/*EX(5)*/
ALTER TABLE aeronave ADD(
    cod_companhia NUMERIC(3) NOT NULL
);

ALTER TABLE aeronave ADD(
    CONSTRAINT fk_aeronave_companhia
        FOREIGN KEY(cod_companhia)
    REFERENCES companhia(cod_companhia)
);

/*EX(6)
ALTER TABLE tripulante DROP vlr_salario
*/

/*EX(7)
ALTER TABLE tripulante ADD(
    vlr_salario NUMERIC(8.2) DEFAULT 1000
);*/
