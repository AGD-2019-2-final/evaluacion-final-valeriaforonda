import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == '__main__':

    curkey = None
    i = 0

    for line in sys.stdin:

        key, val = line.split("\t")
        val=float(val)

        if i == 0:
            maximo = val
            minimo = val
            i = 1

        if key == curkey:
            minimo=min(minimo,val)
            maximo=max(maximo,val)
            
        else:
            if curkey is not None:
                sys.stdout.write("{}\t{}\t{}\n".format(curkey, maximo,minimo))
            else:
            	minimo=min(minimo,val)
            	maximo=max(maximo,val)

            curkey = key
            minimo = val
            maximo = val
            

    sys.stdout.write("{}\t{}\t{}\n".format(curkey, maximo,minimo))