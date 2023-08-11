#
# html/css/js configuration
#

#{ pkgs }: {
#  deps = [
#    pkgs.nodePackages.vscode-langservers-extracted
#    pkgs.nodePackages.typescript-language-server  
#  ];
#}

# test-line
# test-line 2

#
# python configuration
#

{ pkgs }: {
  deps = [
    pkgs.python39Packages.pip
    pkgs.nodePackages.vscode-langservers-extracted # html/css/js
    pkgs.nodePackages.typescript-language-server # html/css/js 
    pkgs.python310Full
    pkgs.replitPackages.prybar-python310
    pkgs.replitPackages.stderred
  ];
  env = {
    PYTHON_LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath [
      # Needed for pandas / numpy
      pkgs.stdenv.cc.cc.lib
      pkgs.zlib
      # Needed for pygame
      pkgs.glib
      # Needed for matplotlib
      pkgs.xorg.libX11
    ];
    PYTHONHOME = "${pkgs.python310Full}";
    PYTHONBIN = "${pkgs.python310Full}/bin/python3.10";
    LANG = "en_US.UTF-8";
    STDERREDBIN = "${pkgs.replitPackages.stderred}/bin/stderred";
    PRYBAR_PYTHON_BIN = "${pkgs.replitPackages.prybar-python310}/bin/prybar-python310";
  };
}
 