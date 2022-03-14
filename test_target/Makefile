all:
	xcc -g -O0 -o bin/gdb_test.xe gdb_test.c PHOENIX.xn
	cd bin && xobjdump -s gdb_test.xe
	xcc -g -O0 -o bin_xc/gdb_test.xe gdb_test.xc PHOENIX.xn	
	cd bin_xc && xobjdump -s gdb_test.xe
