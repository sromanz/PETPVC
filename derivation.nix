/*
  PETPVC package for the Nix package manager.

  Development
  -----------

  To drop into a shell with dependencies available:

    nix-shell

  You can then build in this development environment:

    mkdir build && cd build
    cmake ..
    make

  Building and Installing
  -----------------------

  From the root directory of the project, run:

    nix-build

  This will build to ./result, with binaries in ./result/bin.

  You can install to your path using

    nix-env -i ./result

  Licensing
  ---------

  This file is distributed as part of PETPVC.

  Author: Ashley Gillman

  Copyright 2018 Commonwealth Scientific and Industrial Research
                 Organisation's Australian eHealth Research Centre

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

{ stdenv
, fetchFromGitHub
, cmake
, itk
}:

stdenv.mkDerivation {
  name = "PETPVC";

  # src = fetchFromGitHub {
  #   owner = "UCL";
  #   repo = "PETPVC";
  #   rev = "0000000";  # Can place a specific revision here
  #   # After you first get an error, place the actual sha256 reported below
  #   sha256 = "0000000000000000000000000000000000000000000000000000";
  # };
  src = builtins.fetchGit { url = ./.; };  # respect .gitignore

  enableParallelBuilding = true;

  buildInputs = [ cmake itk ];
  #cmakeBuildType = "Debug";

  meta = with stdenv.lib; {
    description = "Partial Volume Correction in PET";
    homepage = https://github.com/UCL/PETPVC;
    license = licenses.asl20;  # Apache 2.0
  };
}
