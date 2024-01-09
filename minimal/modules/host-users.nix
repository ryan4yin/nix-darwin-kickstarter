
{ ... }:

#############################################################
#
#  Host & Users configuration
#
#############################################################

let
  # TODO change this to your hostname & username
  hostname = "your-hostname";
  username = "xxx";
in
{
  networking.hostName = hostname;
  networking.computerName = hostname;
  system.defaults.smb.NetBIOSName = hostname;

  users.users."${username}"= {
    home = "/Users/${username}";
    description = username;
  };

  nix.settings.trusted-users = [ username ];
}
