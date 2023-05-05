# IP Readme

  Welcome to C910! Some key directories are shown below.
```
|--C910_RTL_FACTORY/
  |--gen_rtl/     ## Verilog source code of C910
  |--setup/       ## Script to set the environment variables
|--smart_run/     ## RTL simulation environment
  |--impl/        ## SDC file, scripts and file lists for implementation
  |--logical/     ## SoC demo and test bench to run the simulation
  |--setup/       ## GNU tool chain setting
  |--tests/       ## Test driver and test cases
  |--work/        ## Working directory for builds
  |--Makefile     ## Makefile for building and running sim targets
|--doc/           ## The user and integration manual of C910
```


## Usage

  Step1: Get Started

```
$ cd C910_RTL_FACTORY
$ source setup/setup.csh
$ cd ../smart_run
$ make help
To gain more information about how to use smart testbench.
```

  Step2: Download and install C/C++ Compiler

```
You can download the GNU tool chain compiled by T-HEAD from the url below:
https://occ.t-head.cn/community/download?id=3948120165480468480

$ cd ./smart_run
GNU tool chain (specific riscv version) must be installed and specified before
compiling *.c/*.v tests of the smart environment. Please refer to the following
setup file about how to specify it:
    ./smart_run/setup/example_setup.csh
```


## Notes

```
The testbench supports Verilator(version is better newer than 4.215),iverilog, vcs and irun to run simulation and you can use Gtkwave or verdi
to open the waveform under ./smart_run/work/ directory.

You can get the debugger, IDE and SDK from the url:https://occ.t-head.cn/community/download?id=575997419775328256
```


## Discussion
    If you are interested in participating in discussions or improving the "openXuantie" cores, you can scan the DingDing QR code below to join the discussion group.
<img src="https://github.com/T-head-Semi/opene902/blob/main/doc/QR_code_openXuantie.png" />


/*Copyright 2019-2021 T-Head Semiconductor Co., Ltd.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

 http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

*/
