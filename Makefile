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

VERBOSE =
VERB = @
ifeq ($(VERBOSE),1)
  VERB =
endif

CXX = clang++
CXXFLAGS = -pedantic -Wall -Wextra

SRCS_CC := $(wildcard *.cc)
SRCS_H := $(wildcard *.h)

render: $(SRCS_CC) $(SRCS_H) Makefile
	$(VERB) $(CXX) $(CXXFLAGS) $(SRCS_CC) -o $@

clean:
	$(VERB) rm -f render
