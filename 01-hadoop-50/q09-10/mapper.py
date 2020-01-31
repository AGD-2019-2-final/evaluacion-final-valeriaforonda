import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__=="__main__":
	for linea in sys.stdin:
		letra=linea.split("   ")[0]
		fecha=linea.split("   ")[1]
		valor=linea.split("   ")[2]

		valor=int(valor)
		valor=str(valor)
		valor=valor.zfill(3)
		sys.stdout.write("{}\t{}\t{}\t{}\n".format(valor,letra,fecha,int(valor)))