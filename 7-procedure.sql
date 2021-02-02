/*EX 1*/
DELIMITER $$

CREATE PROCEDURE adicionaColuna()
BEGIN
    ALTER TABLE tripulante ADD vlr_bonus NUMERIC(8.2) NOT NULL;
END;

/*EX 2*/

DELIMITER $$

CREATE PROCEDURE valorBonus()
BEGIN
    DECLARE sai int default 0;
    DECLARE cod_tr_var char(5);
    DECLARE vlr_sal_var float;
    DECLARE vlr_bonus_var float;
    DECLARE c CURSOR FOR
        SELECT cod_tripulante, vlr_salario FROM tripulante;
    DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET sai = 1;
    OPEN c;
    laco_leitura : LOOP
        FETCH c INTO cod_tr_var, vlr_sal_var;
        IF sai THEN LEAVE laco_leitura; END IF;
        IF vlr_sal_var < 1000 THEN SET vlr_bonus_var = vlr_sal_var * 0.1; END IF;
        IF vlr_sal_var >= 1000 AND vlr_sal_var <= 1500 THEN SET vlr_bonus_var = vlr_sal_var * 0.15; END IF;
        IF vlr_sal_var > 1500 THEN SET vlr_bonus_var = vlr_sal_var * 0.20; END IF;
        IF vlr_sal_var IS NULL THEN SET vlr_bonus_var = 0; END IF;

        UPDATE tripulante SET vlr_bonus = vlr_bonus_var WHERE cod_tripulante = cod_tr_var;
        
    END LOOP;
    CLOSE c;
END;


/*EX 2*/

delimiter $$
create procedure CalculaPremiacao()
begin

	declare cod_tripulante_aux varchar(5);
	declare vlr_salario_aux decimal(8,2);
	declare sai int default 0;
	declare premiacao varchar(50) default '';
	declare quantidade int;
	declare cont int default 0;
	
	declare c cursor for 
		select cod_tripulante, vlr_salario from tripulante;

	declare continue handler for sqlstate '02000' set sai=1;
	
	ALTER TABLE tripulante ADD ind_premiacao VARCHAR(50) NOT NULL;

	open c;
	
	looping: loop
		fetch c into cod_tripulante_aux, vlr_salario_aux;
				
		if sai then
			leave looping;
		end if;

		set quantidade = vlr_salario_aux/100;
		
		while cont < quantidade do
			set premiacao = concat(premiacao,'*');
			set cont = cont + 1;
		end while;
	
		update tripulante set ind_premiacao = premiacao where cod_tripulante = cod_tripulante_aux;
        set cont = 0;
	end loop;

end$$