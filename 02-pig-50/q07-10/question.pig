-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` genere una tabla que contenga la primera columna,
-- la cantidad de elementos en la columna 2 y la cantidad de elementos en la 
-- columna 3 separados por coma. La tabla debe estar ordenada por las 
-- columnas 1, 2 y 3.
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

db = LOAD 'data.tsv' USING PigStorage('\t') 
    AS (letra:CHARARRAY, 
        bolsa:bag{(a:CHARARRAY)},
        mapa:map[]);
--DUMP db;

rank_db = rank db;

tabla_cruce = foreach rank_db generate $0,$1;

db_bolsa= FOREACH rank_db GENERATE rank_db, letra, FLATTEN(bolsa) as f_bolsa;
-- dump db_bolsa;

agrupa_bolsa = group db_bolsa by rank_db;
-- dump agrupa_bolsa;

conteo_bolsa = FOREACH agrupa_bolsa GENERATE group,  COUNT(db_bolsa);
-- dump conteo_bolsa;


----------------------------------------------------
db_mapa= FOREACH rank_db GENERATE rank_db, letra, FLATTEN(mapa) as f_mapa;
-- dump db_mapa;

agrupa_mapa = group db_mapa by rank_db;
-- dump agrupa_mapa;

conteo_mapa = FOREACH agrupa_mapa GENERATE group,  COUNT(db_mapa);
-- dump conteo_mapa;

join_1 = JOIN conteo_bolsa by $0 , conteo_mapa by $0;

join_2 = JOIN join_1 by $0 , tabla_cruce by $0;

tabla_tmp = foreach join_2 generate $5,$1,$3;

tabla_final = order tabla_tmp by $0, $1 ,$2;

store tabla_final into 'output' using PigStorage(',');