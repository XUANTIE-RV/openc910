# Starter Pack

# Build xuantie T-Head toolchain
```
~# sudo apt-get -y install git make curl perl buildah iverilog
~# git clone https://github.com/juampe/toolchain.git
~# cd toolchain
~# make build-xuantie
# The toolchain built is in the repo directory
~# sudo tar -C / -xvjf repo/toolchain-gcc-elf-newlib-xtheadc-riscv64-11.2.0.tbz2
~# /opt/toolchain/riscv64/bin/riscv64-unknown-elf-gcc --version
riscv64-unknown-elf-gcc (GCC) 10.2.0
```

# Build git verilator (optional for make runcase CASE=hello_world SIM=verilator)
```
~# cd
~# git clone https://github.com/verilator/verilator
~# sudo apt-get -y install git perl python3 make autoconf g++ flex bison ccache libgoogle-perftools-dev numactl perl-doc libfl2  libfl-dev zlib1g zlib1g-dev
~# cd verilator
~# git checkout master
~# autoconf
~# ./configure
~# make
~# make test
~# make install
~# verilator --version
Verilator 4.215 devel rev v4.214-28-g185e5d8f
```

# Make a runcase with iverilog
```
~# cd
~# git clone https://github.com/T-head-Semi/openc910.git
~# cd openc910/smart_run
~# export CODE_BASE_PATH=~/openc910/C910_RTL_FACTORY
~# export TOOL_EXTENSION=/opt/toolchain/riscv64/bin
~# mkdir -p work
~# make runcase CASE=hello_world 
make[1]: Entering directory '/root/openc910/smart_run'
make[1]: Leaving directory '/root/openc910/smart_run'
  [THead-smart] Compiling smart now ...
  [THead-smart] SIM = iverilog
  Toolchain path: /opt/toolchain/riscv64/bin
/bin/sh: 1: Syntax error: Bad fd number
make[2]: *** [setup/smart_cfg.mk:98: hello_world_build] Error 2
make[1]: *** [Makefile:175: buildcase] Error 2
make: *** [Makefile:196: runcase] Error 2
```
# Fix shell (bash) where it fails (smart_cfg.mk:98)
```
~# sed -i setup/smart_cfg.mk -e 's/>&/>/'
~# make runcase CASE=hello_world
make[1]: Entering directory '/root/openc910/smart_run'
make[1]: Leaving directory '/root/openc910/smart_run'
  [THead-smart] Compiling smart now ... 
  [THead-smart] SIM = iverilog
  Toolchain path: /opt/toolchain/riscv64/bin
cd ./work && vvp xuantie_core.vvp 
intc.c: In function 'ck_intc_init':
intc.c:19:34: warning: initialization of 'int *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   19 | #define APB_BASE                 0x10000000
      |                                  ^~~~~~~~~~
intc.c:25:14: note: in expansion of macro 'APB_BASE'
   25 |  int *picr = APB_BASE;
      |              ^~~~~~~~
intc.c:20:34: warning: initialization of 'int *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   20 | #define INTC_BASE                0x10010000
      |                                  ^~~~~~~~~~
intc.c:29:22: note: in expansion of macro 'INTC_BASE'
   29 |         int *piser = INTC_BASE + 0x10;
      |                      ^~~~~~~~~
vtimer.c: In function 'sim_end':
vtimer.c:31:12: warning: assignment to 'int *' from 'unsigned int' makes pointer from integer without a cast [-Wint-conversion]
   31 |   END_ADDR = 0xA001FF48;
      |            ^
vtimer.c:34:13: warning: unsigned conversion from 'long int' to 'unsigned int' changes value from '18324075042' to '1144205858' [-Woverflow]
   34 |   END_DATA= 0x444333222;
      |             ^~~~~~~~~~~
        ********* Init Program *********
        ********* Wipe memory to 0 *********
        ********* Read program *********
WARNING: ../logical/tb/tb.v:136: $readmemh: Standard inconsistency, following 1364-2005.
WARNING: ../logical/tb/tb.v:137: $readmemh: Standard inconsistency, following 1364-2005.
        ********* Load program to memory *********

Hello Friend!
Welcome to T-HEAD World!

a is 1!
b is 2!
c is 0!
!!! PASS !!!after ASM c is changed to 3!
**********************************************
*    simulation finished successfully        *
**********************************************

```

