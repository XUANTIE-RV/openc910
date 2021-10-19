#/*Copyright 2019-2021 T-Head Semiconductor Co., Ltd.
#
#Licensed under the Apache License, Version 2.0 (the "License");
#you may not use this file except in compliance with the License.
#You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
#Unless required by applicable law or agreed to in writing, software
#distributed under the License is distributed on an "AS IS" BASIS,
#WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#See the License for the specific language governing permissions and
#limitations under the License.
#*/

tool-chain-chk:
ifndef TOOL_EXTENSION
	$(warning \
        $(newline)   The environment varialble $$TOOL_EXTENSION must be set to specify the GNU \
        $(newline)   toolchains to compile .c/.s smart test cases. \
        $(newline)   $$TOOL_EXTENSION must be set as shown in ./setup/example_setup.csh, and the \
        $(newline)   suggested steps are:  \
        $(newline)       1. vim ./setup/example_setup.csh \
        $(newline)       2. Modify the example_setup.csh with the real toolchain path according \
        $(newline)          to your environment. \
        $(newline)       3. source ./setup/example_setup.csh )
else
	@echo "  Toolchain path: ${TOOL_EXTENSION}"
endif

