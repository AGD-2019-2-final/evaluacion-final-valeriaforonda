-- Pregunta
-- ===========================================================================
-- 
-- Obtenga los cinco (5) valores más pequeños de la 3ra columna.
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

db = LOAD 'data.tsv' USING PigStorage('\t') 
    AS (key:CHARARRAY, 
        date:CHARARRAY,
        cantidad:INT);
DUMP db;

query = ORDER db BY cantidad;
DUMP query;
query2 = FOREACH  query GENERATE cantidad ; 
DUMP query2;

query3 = LIMIT query2 5;
DUMP query3;

STORE query3 INTO 'output' using PigStorage('\t');