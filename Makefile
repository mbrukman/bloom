# Copyright 2022 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

VERB = @
ifeq ($(VERBOSE),1)
  VERB =
endif

# Per the documentation [1], the sanitizer flags need to be present during both
# compilation and linking, and we need to use `clang++` rather than `ld`, for
# the link step.
#
# [1]: https://clang.llvm.org/docs/UndefinedBehaviorSanitizer.html
SANITIZERS = -fsanitize=alignment,bool,builtin,bounds,float-cast-overflow,float-divide-by-zero,null,undefined

CXX = clang++
CXXFLAGS = -pedantic -Wall -Wextra $(SANITIZERS)
LDFLAGS = $(SANITIZERS)

SRCS_CC := $(wildcard *.cc)
SRCS_H := $(wildcard *.h)
OBJS := $(patsubst %.cc, %.o, $(SRCS_CC))

%.o: %.cc $(SRCS_H) Makefile
	$(VERB) $(CXX) $(CXXFLAGS) -c $< -o $@

render: $(OBJS) Makefile
	$(VERB) $(CXX) $(LDFLAGS) $(OBJS) -o $@

clean:
	$(VERB) rm -f render *.o
