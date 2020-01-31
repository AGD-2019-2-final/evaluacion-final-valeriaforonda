import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__=="__main__":
	for linea in sys.stdin:
		letra=linea.split(',')[0]
		valor=linea.split(',')[1] 
		valor=int(valor)
		sys.stdout.write("{}\t{}\t{}\n".format(valor,letra,valor))