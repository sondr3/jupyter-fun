with import <nixpkgs> {};
with pkgs.python37Packages;

let
  pythonPackages = python-packages: with python-packages; [
    ipython
    jupyterlab
    matplotlib
    numpy
    pandas
    scipy
    seaborn
    requests
    folium
  ];
  python3WithPackages = pkgs.python37.withPackages pythonPackages;
in
stdenv.mkDerivation {
  name = "jupyter-fun";
  buildInputs = [
    python3WithPackages
  ];
}
