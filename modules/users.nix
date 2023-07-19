{ ... }:

let
  # TODO please update your username
  username = "xxx";
in
{
  nix.settings.trusted-users = [ username ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ryan = {
    home = "/Users/${username}";
    description = username;
  };
}
