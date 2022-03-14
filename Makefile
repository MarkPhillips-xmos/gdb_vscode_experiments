GDBSRC=binutils-gdb
GDBEXECNAME=xgdb

XELIBS="-ldl"


build: xgdb-build/obj xgdb-build/inst  export/$(HOST)/$(CONFIG)/bin
	( cd xgdb-build/obj ; ../../$(GDBSRC)/configure --disable-werror --prefix=$(CWD)/xgdb-build/inst --target=xcore-elf $(CONFIG_OPTS) \
          --with-bugurl=http://www.xmos.com/support \
          --with-pkgversion=XGDB --disable-tui \
          --disable-gas --disable-ld --disable-gold \
          --enable-gdbserver \
          --with-included-gettext ) \
          > xgdb_configure.out 2>&1
	( cd xgdb-build/obj ; LOADLIBES=$(XELIBS) make > xgdb_make.out 2>&1 )

xgdb-build/obj xgdb-build/inst  export/$(HOST)/$(CONFIG)/bin:
	mkdir -p $@
