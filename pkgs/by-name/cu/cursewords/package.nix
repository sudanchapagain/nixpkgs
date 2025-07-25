{
  lib,
  python3Packages,
  fetchFromGitHub,
}:
python3Packages.buildPythonApplication rec {
  pname = "cursewords";
  version = "1.1";
  format = "pyproject";

  src = fetchFromGitHub {
    owner = "thisisparker";
    repo = "cursewords";
    rev = "v${version}";
    hash = "sha256-Ssr15kSdWmyMFFG5uCregrpGQ3rI2cMXqY9+/a3gs84=";
  };

  build-system = [
    python3Packages.setuptools
  ];

  doCheck = false; # no tests

  pythonRelaxDeps = [
    "blessed"
  ];

  dependencies = [
    python3Packages.blessed
  ];

  meta = with lib; {
    homepage = "https://github.com/thisisparker/cursewords";
    description = "Graphical command line program for solving crossword puzzles in the terminal";
    mainProgram = "cursewords";
    license = licenses.agpl3Only;
    maintainers = [ ];
    platforms = platforms.all;
  };
}
