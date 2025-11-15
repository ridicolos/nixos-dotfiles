{ ... }:
{
  programs.thunderbird = {
    enable = true;
    policies = {
      Preferences = {
        "mail.openpgp.allow_external_gnupg" = true;
        "mail.openpgp.fetch_pubkeys_from_gnupg" = true;
      };
      ExtensionSettings = {
        "*".installation_mode = "blocked";
        "uBlock0@raymondhill.net" = {
          install_url = "https://addons.mozilla.org/thunderbird/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
        };
      };
    };
  };
}
