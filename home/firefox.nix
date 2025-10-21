{ pkgs, inputs, system, ... }:
let
  firefoxExtensions = inputs.firefox-addons.packages."${system}";
in
{
  programs.firefox = {
    enable = true;
    languagePacks = [ "fr" "en-GB" ];
    policies = {
      DontCheckDefaultBrowser = true;
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      DisableFirefoxScreenshots = true;
      DisplayBookmarksToolbar = "newtab"; # alternatives: "always" or "never"
      SearchBar = "unified";

      Homepage.StartPage = "previous-session";

      UserMessaging = {
        UrlbarInterventions = false;
        SkipOnboarding = true;
      };

      FirefoxSuggest = {
        WebSuggestions = false;
        SponsoredSuggestions = false;
        ImproveSuggest = false;
      };

      EnableTrackingProtection = {
        Value = true;
        Cryptomining = true;
        Fingerprinting = true;
      };

      FirefoxHome = {
        Search = true;
        TopSites = true;
        SponsoredTopSites = false;
        Highlights = false;
        Pocket = false;
        SponsoredPocket = false;
        Snippets = false;
      };
    };

    profiles.perso = {
      id = 0;
      isDefault = true;
      name = "Personal";

      search.default = "ddg";
      search.engines = {

        nix-packages = {
          name = "Nix Packages";
          urls = [{
            template = "https://search.nixos.org/packages";
            params = [
              { name = "type"; value = "packages"; }
              { name = "query"; value = "{searchTerms}"; }
            ];
          }];
          icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
          definedAliases = [ "@np" ];
        };
        bing.metaData.hidden = true;
        google.metaData.hidden = true;
        ebay.metaData.hidden = true;
      };

      settings = {
        "browser.search.region" = "FR";
        "browser.search.isUS" = false;
        "distribution.searchplugins.defaultLocale" = "fr-FR";
        "general.useragent.locale" = "fr-FR";

        "browser.newtabpage.activity-stream.showSponsored" = false;
        "browser.newtabpage.activity-stream.showSponsoredCheckboxes" = false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
        "browser.newtabpage.activity-stream.system.showSponsored" = false;
        "browser.newtabpage.activity-stream.system.showSponsoredCheckboxes" = false;
      };

      extensions.packages = with firefoxExtensions; [
        proton-pass
        raindropio
        sponsorblock
      ];
    };
  };
}
