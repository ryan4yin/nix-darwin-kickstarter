{ ... }:

{
  # TODO please update your host name
  nix.settings.trusted-users = ["ryan"];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ryan = {
    # TODO please update your user information
    home = "/Users/ryan";
    description = "ryan";
  };
}
