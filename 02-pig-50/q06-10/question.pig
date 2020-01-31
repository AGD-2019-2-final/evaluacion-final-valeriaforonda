-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` Calcule la cantidad de registros por clave de la 
-- columna 3. En otras palabras, cuántos registros hay que tengan la clave 
-- `aaa`?
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
-- DUMP db;

dbtmp= FOREACH db GENERATE FLATTEN(mapa) as clave;
-- dump dbtmp;


query= group dbtmp by clave;
-- dump query;

conteo = FOREACH query GENERATE group, COUNT(dbtmp);
-- dump conteo;

store conteo into 'output' using PigStorage(',');