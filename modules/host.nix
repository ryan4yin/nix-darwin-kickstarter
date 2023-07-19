
{ ... } @ args:

#############################################################
#
#  Host configuration
#
#############################################################

let
  # TODO change this to your hostname
  name = "hostname";
in
{
  networking.hostName = name;
  networking.computerName = name;
  system.defaults.smb.NetBIOSName = name;
}
