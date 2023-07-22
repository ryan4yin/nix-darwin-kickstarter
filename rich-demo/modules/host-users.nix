
{ ... } @ args:

#############################################################
#
#  Host & Users configuration
#
#############################################################

let
  # TODO change this to your hostname
  name = "hostname";
  username = "xxx";
in
{
  networking.hostName = name;
  networking.computerName = name;
  system.defaults.smb.NetBIOSName = name;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."${username}" = {
    home = "/Users/${username}";
    description = username;
  };

  nix.settings.trusted-users = [ username ];
}
