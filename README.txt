#
# gdb and gdbserver have been built for "xcore"
# gdbserver is hooked up to drive xsim (only tile 0)
#
# This provides a fraework to add the basic "new CPU" functionallity 
# as done for other CPUs to enable gdb to support xcore.
#

Fast re-build gdbserver

% cd ~/development/gdb-11-XMOS/xgdb-build/obj/gdbserver
% make GDBSERVER_LIBS=-ldl

Fast re-build gdb
% cd ~/development/gdb-11-XMOS/xgdb-build/obj/gdb
% make


Run gdbserver
% cd ~/development/gdb-11-XMOS/xgdb-build/obj/gdbserver
% LD_LIBRARY_PATH=~/development/XMOS/XTC/15.1.4/lib ./gdbserver --remote-debug --event-loop-debug :12345 --multi

Run gdb
% cd ~/development/gdb-11-XMOS/xgdb-build/obj/gdb
% ./gdb -ex "target extended-remote :12345"  ~/development/gdb-11-XMOS/test_target/bin/image_n0c0.elf

or

% cd ~/development/XMOS/XTC/15.1.4
% . SetEnv
% ./gdb -ex "target extended-remote :12345"  ~/development/gdb-11-XMOS/test_target/bin/gdb_test.xe

or




./gdb -ex "set debug symbol-lookup 1" -ex "set debug dwarf-line 1" -ex "set debug dwarf-read 1"  -ex "target extended-remote :12345" -ex load -ex c  ~/development/gdb-11-XMOS/test_target/bin/image_n0c0.elf

./gdb -ex "break lookup_symbol_in_objfile_symtabs" --args ./gdb -ex "set debug symbol-lookup 3" -ex "set debug dwarf-line 3" -ex "set debug dwarf-read 3"  -ex "target extended-remote :12345" -ex load -ex "hbreak *0x80188" -ex c  ~/development/gdb-11-XMOS/test_target/bin/image_n0c0.elf

./gdb -ex "set pagination off" -ex "set debug symbol-lookup 3" -ex "set debug dwarf-line 3" -ex "set debug dwarf-read 3" -ex "set debug symfile 3" -ex "set debug symtab-lookup 3" -ex "set debug symtab-create 3" -ex "target extended-remote :12345" -ex load -ex "hbreak *0x80188" -ex c  -ex "info address main" ~/development/gdb-11-XMOS/test_target/bin/image_n0c0.elf


./gdb -ex "set pagination off" -ex "set debug symbol-lookup 3" -ex "set debug dwarf-line 3" -ex "set debug dwarf-read 3" -ex "set debug symfile 3" -ex "set debug symtab-lookup 3" -ex "set debug symtab-create 3" -ex "b main" -ex run -ex "info address main" ../../../x86_test/a.out

