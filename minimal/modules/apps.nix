{ pkgs, ...}: {

  ##########################################################################
  # 
  #  Homebrew specific configuration
  #
  #  Nixpkgs is not well supported on macOS, I met some strange bug recently.
  #  So install apps using [homebrew](https://daiderd.com/nix-darwin/manual/index.html#opt-homebrew.enable) here.
  # 
  #  NOTE: Your can find all available options in:
  #    https://daiderd.com/nix-darwin/manual/index.html
  # 
  # TODO Fell free to modify this file to fit your needs.
  #
  ##########################################################################


  # TODO To make this work, homebrew need to be installed manually, see https://brew.sh
  # 
  # The apps installed by homebrew are not managed by nix, and not reproducible!
  # But Homebrew has a much larger selection of apps than nixpkgs, especially for GUI apps!
  # And Homebrew is much more popular than nixpkgs, so it's easier to find help online.
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = false;
      # 'zap': uninstalls all formulae(and related files) not listed here.
      # cleanup = "zap";
    };

    taps = [
      "homebrew/cask"
      "homebrew/cask-fonts"
      "homebrew/services"
      "homebrew/cask-versions"
    ];

    # `brew install`
    # TODO Feel free to add your favorite apps here.
    brews = [
      # "aria2"  # download tool
    ];

    # `brew install --cask`
    # TODO Feel free to add your favorite apps here.
    casks = [
      # "google-chrome"
    ];
  };
}
