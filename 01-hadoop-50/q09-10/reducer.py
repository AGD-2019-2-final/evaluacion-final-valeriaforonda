import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == '__main__':

    curkey = None
    n=0

    for line in sys.stdin:
    	if n<6:
	        texto,key,fecha,val = line.split("\t")
	        val = int(val)
	        sys.stdout.write("{}\t{}\t{}\n".format(key, fecha,val))
	        n+=1