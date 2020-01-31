import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__=="__main__":
	for linea in sys.stdin:
		mes=linea.split("-")[1]
		sys.stdout.write("{}\t1\n".format(mes))