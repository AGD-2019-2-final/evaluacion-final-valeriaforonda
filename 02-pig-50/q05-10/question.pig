-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute Calcule la cantidad de registros en que 
-- aparece cada letra minúscula en la columna 2.
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

querytmp= FOREACH db GENERATE FLATTEN(bolsa) as letra;
dump querytmp;


query= group querytmp by letra;
dump query;

conteo = FOREACH query GENERATE group, COUNT(querytmp);
dump conteo;

store conteo into 'output' using PigStorage('\t');