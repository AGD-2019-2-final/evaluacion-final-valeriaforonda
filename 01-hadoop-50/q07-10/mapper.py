import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__=="__main__":
	for linea in sys.stdin:
		letra=linea.split("   ")[0]
		fecha=linea.split("   ")[1]
		valor=int(linea.split("   ")[2])
		valor=str(valor)
		valor=valor.zfill(3)
		concat=letra+valor
		sys.stdout.write("{}\t{}\t{}\t{}\n".format(concat,letra,fecha,valor))