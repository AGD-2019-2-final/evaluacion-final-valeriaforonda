-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute la cantidad de registros por letra de la 
-- columna 2 y clave de al columna 3; esto es, por ejemplo, la cantidad de 
-- registros en tienen la letra `b` en la columna 2 y la clave `jjj` en la 
-- columna 3 es:
-- 
--   ((b,jjj), 216)
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
DUMP db;

db_flat = foreach db generate FLATTEN($1),FLATTEN($2);

db_sel= foreach db_flat generate $0,$1;

db_grupo = GROUP db_sel BY ($0,$1);

db_conteo = FOREACH db_grupo GENERATE group , COUNT(db_sel) AS conteo;

db_ordenados = order db_conteo BY $0,$1;

store db_ordenados into 'output' using PigStorage('\t');