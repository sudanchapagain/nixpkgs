{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  cython,
  poetry-core,
  pytestCheckHook,
  pytest-cov-stub,
  setuptools,
  pythonOlder,
}:

buildPythonPackage rec {
  pname = "kasa-crypt";
  version = "0.6.3";
  pyproject = true;

  disabled = pythonOlder "3.7";

  src = fetchFromGitHub {
    owner = "bdraco";
    repo = "kasa-crypt";
    tag = "v${version}";
    hash = "sha256-PQycv0JHXKIEzuKVnXoyuU/BfKG19r3eDE4rYDiYYaY=";
  };

  build-system = [
    cython
    poetry-core
    setuptools
  ];

  nativeCheckInputs = [
    pytestCheckHook
    pytest-cov-stub
  ];

  pythonImportsCheck = [ "kasa_crypt" ];

  meta = with lib; {
    description = "Fast kasa crypt";
    homepage = "https://github.com/bdraco/kasa-crypt";
    changelog = "https://github.com/bdraco/kasa-crypt/blob/${src.tag}/CHANGELOG.md";
    license = licenses.asl20;
    maintainers = with maintainers; [ fab ];
  };
}
