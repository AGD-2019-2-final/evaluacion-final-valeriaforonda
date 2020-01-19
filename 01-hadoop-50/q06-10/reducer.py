import sys
#
#  >>> Escriba el codigo del reducer a partir de este punto <<<
#
if __name__ == '__main__':

    curkey = None
    totalmax = 0
    totalmin = 2000

    ##
    ## cada linea de texto recibida es una
    ## entrada clave \tabulador valor
    ##
    for line in sys.stdin:

        key, val = line.split("\t")

        if key == curkey:
            ##
            ## No se ha cambiado de clave. Aca se
            ## acumulan los valores para la misma clave.
            ##
            if val > totalmax:
                totalmax = val

            if val < totalmin:
                totalmin = val
            
        else:
            ##
            ## Se cambio de clave. Se reinicia el
            ## acumulador.
            ##
            if curkey is not None:
                ##
                ## una vez se han reducido todos los elementos
                ## con la misma clave se imprime el resultado en
                ## el flujo de salida
                ##
                sys.stdout.write("{}\t{}\t{}\n".format(curkey, totalmax, totalmin))

            curkey = key
            totalmax = val
            totalmin = val

    sys.stdout.write("{}\t{}\t{}\n".format(curkey, totalmax, totalmin))

