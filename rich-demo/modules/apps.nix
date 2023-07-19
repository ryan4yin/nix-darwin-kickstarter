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


  # Homebrew Mirror in China
  # Feel free to remove this if you are not in China.
  environment.variables = {
    HOMEBREW_API_DOMAIN = "https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles/api";
    HOMEBREW_BOTTLE_DOMAIN = "https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles";
    HOMEBREW_BREW_GIT_REMOTE = "https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git";
    HOMEBREW_CORE_GIT_REMOTE = "https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git";
    HOMEBREW_PIP_INDEX_URL = "https://pypi.tuna.tsinghua.edu.cn/simple";
  };

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
      cleanup = "zap";
    };

    # Applications to install from Mac App Store using mas.
    # You need to install all these Apps manually first so that your apple account have records for them.
    # otherwise Apple Store will refuse to install them.
    # For details, see https://github.com/mas-cli/mas 
    masApps = {
      # TODO Feel free to add your favorite apps here.

      # Xcode = 497799835;
      # Wechat = 836500024;
      # NeteaseCloudMusic = 944848654;
      # QQ = 451108668;
      # WeCom = 1189898970;  # Wechat for Work
      # TecentMetting = 1484048379;
      # QQMusic = 595615424;
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
      # "wget"  # download tool
      # "curl"  # no not install curl via nixpkgs, it's not working well on macOS!
      # "aria2"  # download tool
      # "httpie"  # http client
    ];

    # `brew install --cask`
    # TODO Feel free to add your favorite apps here.
    casks = [
      # "firefox"
      # "google-chrome"
      # "visual-studio-code"

      # IM & audio & remote desktop & meeting
      # "telegram"
      # "discord"

      # "anki"
      # "clashx"    # proxy tool
      # "iina"      # video player
      # "openinterminal-lite"  # open current folder in terminal
      # "syncthing"  # file sync
      # "raycast"   # (HotKey: alt/option + space)search, caculate and run scripts(with many plugins)
      # "iglance"   # beautiful system monitor
      # "eudic"     # 欧路词典

      # # Development
      # "insomnia"  # REST client
      # "wireshark"  # network analyzer
    ];
  };
}
