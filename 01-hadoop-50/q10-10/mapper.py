import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":
    for line in sys.stdin:
        numero = line.split('\t')[0]
        letras = line.split('\t')[1]
        letras= letras.rstrip('\r\n')
        
        for i in range(len(letras)):
            sys.stdout.write("{}\t{}\n".format(str(letras[i]),numero.zfill(3)))        