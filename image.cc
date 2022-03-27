// Copyright 2022 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#include "image.h"

#include <ostream>

void Image::OutputAsPpm(std::ostream& os) {
  os << "P3\n" << width_ <<  ' ' << height_ << "\n255\n";

  for (int h = height_ - 1; h >= 0; --h) {
    for (int w = 0; w < width_; ++w) {
      float r = double(w) / (width_ - 1);
      float g = double(h) / (height_ - 1);
      float b = 0.25;

      int ir = static_cast<int>(255.999 * r);
      int ig = static_cast<int>(255.999 * g);
      int ib = static_cast<int>(255.999 * b);

      os << ir << ' ' << ig << ' ' << ib << '\n';
    }
  }
}
