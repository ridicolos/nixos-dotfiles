{
  config,
  pkgs,
  lib,
  ...
}:

{
  options.modules.plasma.enable = lib.mkEnableOption "enables plasma-module";

  config = lib.mkIf config.modules.plasma.enable {

    services = {
      desktopManager.plasma6.enable = true;
      displayManager.sddm.enable = true;
      displayManager.sddm.wayland.enable = true;
    };

    programs.firefox = {
      preferences = {
        "widget.use-xdg-desktop-portal.file-picker" = 1;
      };
    };

    environment.plasma6.excludePackages = with pkgs.kdePackages; [
      aurorae
      konsole
      elisa
      kate
      ktexteditor
      khelpcenter
    ];

    environment.systemPackages = with pkgs; [
      kdePackages.sddm-kcm
      kdePackages.partitionmanager
      vlc
      wayland-utils
      wl-clipboard
    ];
    home-manager.users.dennis = {
      programs.plasma = {
        enable = true;
        session = {
          general.askForConfirmationOnLogout = false;
          sessionRestore.restoreOpenApplicationsOnLogin = "startWithEmptySession";
        };
        kwin = {
          virtualDesktops = {
            number = 4;
            rows = 2;
          };
        };
        shortcuts = {
          "KDE Keyboard Layout Switcher"."Switch keyboard layout to German (US)" = [ ];
          "KDE Keyboard Layout Switcher"."Switch to Last-Used Keyboard Layout" = [ ];
          "KDE Keyboard Layout Switcher"."Switch to Next Keyboard Layout" = [ ];
          kaccess."Toggle Screen Reader On and Off" = [ ];
          kmix.decrease_microphone_volume = "Microphone Volume Down";
          kmix.decrease_volume = "Volume Down";
          kmix.decrease_volume_small = "Shift+Volume Down";
          kmix.increase_microphone_volume = "Microphone Volume Up";
          kmix.increase_volume = "Volume Up";
          kmix.increase_volume_small = "Shift+Volume Up";
          kmix.mic_mute = [
            "Microphone Mute"
            "Meta+Volume Mute"
          ];
          kmix.mute = "Volume Mute";
          ksmserver."Halt Without Confirmation" = [ ];
          ksmserver."Lock Session" = [
            "Screensaver"
            "Meta+Esc"
          ];
          ksmserver."Log Out" = "Ctrl+Alt+Del";
          ksmserver."Log Out Without Confirmation" = [ ];
          ksmserver.LogOut = [ ];
          ksmserver.Reboot = [ ];
          ksmserver."Reboot Without Confirmation" = [ ];
          ksmserver."Shut Down" = [ ];
          kwin."Activate Window Demanding Attention" = [ ];
          kwin.ClearLastMouseMark = "Meta+Shift+F12";
          kwin.ClearMouseMarks = "Meta+Shift+F11";
          kwin."Cycle Overview" = [ ];
          kwin."Cycle Overview Opposite" = [ ];
          kwin."Decrease Opacity" = [ ];
          kwin."Edit Tiles" = "Meta+T";
          kwin.Expose = [ ];
          kwin.ExposeAll = [ ];
          kwin.ExposeClass = [ ];
          kwin.ExposeClassCurrentDesktop = [ ];
          kwin."Grid View" = [ ];
          kwin."Increase Opacity" = [ ];
          kwin."Kill Window" = [ ];
          kwin."Move Tablet to Next Output" = [ ];
          kwin.MoveMouseToCenter = [ ];
          kwin.MoveMouseToFocus = [ ];
          kwin.MoveZoomDown = [ ];
          kwin.MoveZoomLeft = [ ];
          kwin.MoveZoomRight = [ ];
          kwin.MoveZoomUp = [ ];
          kwin.Overview = [ ];
          kwin."Setup Window Shortcut" = [ ];
          kwin."Show Desktop" = [ ];
          kwin."Switch One Desktop Down" = [ ];
          kwin."Switch One Desktop Up" = [ ];
          kwin."Switch One Desktop to the Left" = [ ];
          kwin."Switch One Desktop to the Right" = [ ];
          kwin."Switch Window Down" = [ ];
          kwin."Switch Window Left" = [ ];
          kwin."Switch Window Right" = [ ];
          kwin."Switch Window Up" = [ ];
          kwin."Switch to Desktop 1" = "Meta+1";
          kwin."Switch to Desktop 10" = [ ];
          kwin."Switch to Desktop 11" = [ ];
          kwin."Switch to Desktop 12" = [ ];
          kwin."Switch to Desktop 13" = [ ];
          kwin."Switch to Desktop 14" = [ ];
          kwin."Switch to Desktop 15" = [ ];
          kwin."Switch to Desktop 16" = [ ];
          kwin."Switch to Desktop 17" = [ ];
          kwin."Switch to Desktop 18" = [ ];
          kwin."Switch to Desktop 19" = [ ];
          kwin."Switch to Desktop 2" = "Meta+2";
          kwin."Switch to Desktop 20" = [ ];
          kwin."Switch to Desktop 3" = "Meta+3";
          kwin."Switch to Desktop 4" = "Meta+4";
          kwin."Switch to Desktop 5" = "Meta+5";
          kwin."Switch to Desktop 6" = "Meta+6";
          kwin."Switch to Desktop 7" = "Meta+7";
          kwin."Switch to Desktop 8" = "Meta+8";
          kwin."Switch to Desktop 9" = "Meta+9";
          kwin."Switch to Next Desktop" = [ ];
          kwin."Switch to Next Screen" = [ ];
          kwin."Switch to Previous Desktop" = [ ];
          kwin."Switch to Previous Screen" = [ ];
          kwin."Switch to Screen 0" = [ ];
          kwin."Switch to Screen 1" = [ ];
          kwin."Switch to Screen 2" = [ ];
          kwin."Switch to Screen 3" = [ ];
          kwin."Switch to Screen 4" = [ ];
          kwin."Switch to Screen 5" = [ ];
          kwin."Switch to Screen 6" = [ ];
          kwin."Switch to Screen 7" = [ ];
          kwin."Switch to Screen Above" = [ ];
          kwin."Switch to Screen Below" = [ ];
          kwin."Switch to Screen to the Left" = [ ];
          kwin."Switch to Screen to the Right" = [ ];
          kwin."Toggle Night Color" = [ ];
          kwin."Toggle Window Raise/Lower" = [ ];
          kwin.ToggleMouseClick = [ ];
          kwin."Walk Through Windows" = "Alt+Tab";
          kwin."Walk Through Windows (Reverse)" = "Alt+Shift+Tab";
          kwin."Walk Through Windows Alternative" = [ ];
          kwin."Walk Through Windows Alternative (Reverse)" = [ ];
          kwin."Walk Through Windows of Current Application" = "Meta+Tab";
          kwin."Walk Through Windows of Current Application (Reverse)" = "Meta+Shift+Tab";
          kwin."Walk Through Windows of Current Application Alternative" = [ ];
          kwin."Walk Through Windows of Current Application Alternative (Reverse)" = [ ];
          kwin."Window Above Other Windows" = "Meta+S";
          kwin."Window Below Other Windows" = [ ];
          kwin."Window Close" = "Meta+Shift+Q";
          kwin."Window Custom Quick Tile Bottom" = [ ];
          kwin."Window Custom Quick Tile Left" = [ ];
          kwin."Window Custom Quick Tile Right" = [ ];
          kwin."Window Custom Quick Tile Top" = [ ];
          kwin."Window Fullscreen" = "Meta+F";
          kwin."Window Grow Horizontal" = [ ];
          kwin."Window Grow Vertical" = [ ];
          kwin."Window Lower" = [ ];
          kwin."Window Maximize" = "Meta+Shift+Return";
          kwin."Window Maximize Horizontal" = [ ];
          kwin."Window Maximize Vertical" = [ ];
          kwin."Window Minimize" = [ ];
          kwin."Window Move" = [ ];
          kwin."Window Move Center" = [ ];
          kwin."Window No Border" = [ ];
          kwin."Window On All Desktops" = "Meta+Z";
          kwin."Window One Desktop Down" = [ ];
          kwin."Window One Desktop Up" = [ ];
          kwin."Window One Desktop to the Left" = [ ];
          kwin."Window One Desktop to the Right" = [ ];
          kwin."Window One Screen Down" = [ ];
          kwin."Window One Screen Up" = [ ];
          kwin."Window One Screen to the Left" = "Meta+<";
          kwin."Window One Screen to the Right" = "Meta+>";
          kwin."Window Operations Menu" = [ ];
          kwin."Window Pack Down" = [ ];
          kwin."Window Pack Left" = [ ];
          kwin."Window Pack Right" = [ ];
          kwin."Window Pack Up" = [ ];
          kwin."Window Quick Tile Bottom" = "Meta+Shift+Down";
          kwin."Window Quick Tile Bottom Left" = [ ];
          kwin."Window Quick Tile Bottom Right" = [ ];
          kwin."Window Quick Tile Left" = "Meta+Shift+Left";
          kwin."Window Quick Tile Right" = "Meta+Shift+Right";
          kwin."Window Quick Tile Top" = "Meta+Shift+Up";
          kwin."Window Quick Tile Top Left" = [ ];
          kwin."Window Quick Tile Top Right" = [ ];
          kwin."Window Raise" = [ ];
          kwin."Window Resize" = [ ];
          kwin."Window Shade" = [ ];
          kwin."Window Shrink Horizontal" = [ ];
          kwin."Window Shrink Vertical" = [ ];
          kwin."Window to Desktop 1" = "Meta+!";
          kwin."Window to Desktop 10" = [ ];
          kwin."Window to Desktop 11" = [ ];
          kwin."Window to Desktop 12" = [ ];
          kwin."Window to Desktop 13" = [ ];
          kwin."Window to Desktop 14" = [ ];
          kwin."Window to Desktop 15" = [ ];
          kwin."Window to Desktop 16" = [ ];
          kwin."Window to Desktop 17" = [ ];
          kwin."Window to Desktop 18" = [ ];
          kwin."Window to Desktop 19" = [ ];
          kwin."Window to Desktop 2" = "Meta+@";
          kwin."Window to Desktop 20" = [ ];
          kwin."Window to Desktop 3" = "Meta+#";
          kwin."Window to Desktop 4" = "Meta+$";
          kwin."Window to Desktop 5" = "Meta+%";
          kwin."Window to Desktop 6" = "Meta+^";
          kwin."Window to Desktop 7" = "Meta+&";
          kwin."Window to Desktop 8" = "Meta+*";
          kwin."Window to Desktop 9" = "Meta+(";
          kwin."Window to Next Desktop" = [ ];
          kwin."Window to Next Screen" = "Meta+Shift+M";
          kwin."Window to Previous Desktop" = [ ];
          kwin."Window to Previous Screen" = "Meta+Shift+N";
          kwin."Window to Screen 0" = [ ];
          kwin."Window to Screen 1" = [ ];
          kwin."Window to Screen 2" = [ ];
          kwin."Window to Screen 3" = [ ];
          kwin."Window to Screen 4" = [ ];
          kwin."Window to Screen 5" = [ ];
          kwin."Window to Screen 6" = [ ];
          kwin."Window to Screen 7" = [ ];
          kwin.disableInputCapture = [ ];
          kwin.view_actual_size = "Meta+0";
          kwin.view_zoom_in = [
            "Meta++"
            "Meta+="
          ];
          kwin.view_zoom_out = "Meta+-";
          mediacontrol.mediavolumedown = [ ];
          mediacontrol.mediavolumeup = [ ];
          mediacontrol.nextmedia = "Media Next";
          mediacontrol.pausemedia = "Media Pause";
          mediacontrol.playmedia = [ ];
          mediacontrol.playpausemedia = "Media Play";
          mediacontrol.previousmedia = "Media Previous";
          mediacontrol.stopmedia = "Media Stop";
          org_kde_powerdevil."Decrease Keyboard Brightness" = "Keyboard Brightness Down";
          org_kde_powerdevil."Decrease Screen Brightness" = "Monitor Brightness Down";
          org_kde_powerdevil."Decrease Screen Brightness Small" = "Shift+Monitor Brightness Down";
          org_kde_powerdevil.Hibernate = "Hibernate";
          org_kde_powerdevil."Increase Keyboard Brightness" = "Keyboard Brightness Up";
          org_kde_powerdevil."Increase Screen Brightness" = "Monitor Brightness Up";
          org_kde_powerdevil."Increase Screen Brightness Small" = "Shift+Monitor Brightness Up";
          org_kde_powerdevil.PowerDown = "Power Down";
          org_kde_powerdevil.PowerOff = "Power Off";
          org_kde_powerdevil.Sleep = "Sleep";
          org_kde_powerdevil."Toggle Keyboard Backlight" = "Keyboard Light On/Off";
          org_kde_powerdevil."Turn Off Screen" = [ ];
          org_kde_powerdevil.powerProfile = [
            "Battery"
            "Meta+B"
            "Favorites"
          ];
          plasmashell."Slideshow Wallpaper Next Image" = [ ];
          plasmashell."activate application launcher" = "Meta";
          plasmashell."activate task manager entry 1" = [ ];
          plasmashell."activate task manager entry 10" = [ ];
          plasmashell."activate task manager entry 2" = [ ];
          plasmashell."activate task manager entry 3" = [ ];
          plasmashell."activate task manager entry 4" = [ ];
          plasmashell."activate task manager entry 5" = [ ];
          plasmashell."activate task manager entry 6" = [ ];
          plasmashell."activate task manager entry 7" = [ ];
          plasmashell."activate task manager entry 8" = [ ];
          plasmashell."activate task manager entry 9" = [ ];
          plasmashell.clear-history = [ ];
          plasmashell.clipboard_action = [ ];
          plasmashell.cycle-panels = [ ];
          plasmashell.cycleNextAction = [ ];
          plasmashell.cyclePrevAction = [ ];
          plasmashell.edit_clipboard = [ ];
          plasmashell."manage activities" = [ ];
          plasmashell."next activity" = "Meta+A";
          plasmashell."previous activity" = [ ];
          plasmashell.repeat_action = [ ];
          plasmashell."show dashboard" = [ ];
          plasmashell.show-barcode = [ ];
          plasmashell.show-on-mouse-pos = "Meta+Shift+V";
          plasmashell."stop current activity" = [ ];
          plasmashell."switch to next activity" = [ ];
          plasmashell."switch to previous activity" = [ ];
          plasmashell."toggle do not disturb" = [ ];
          "services/Alacritty.desktop"._launch = "Meta+Return";
          "services/org.kde.konsole.desktop"._launch = [ ];
          "services/org.kde.krunner.desktop".RunClipboard = [ ];
          "services/org.kde.krunner.desktop"._launch = "Meta+D";
          "services/org.kde.plasma-systemmonitor.desktop"._launch = [ ];
          "services/org.kde.plasma.emojier.desktop"._launch = "Meta+Shift+E";
          "services/org.kde.spectacle.desktop".RecordRegion = "Meta+Shift+R";
          wacomtablet."Map to fullscreen" = "Meta+Ctrl+F";
          wacomtablet."Map to screen 1" = "Meta+Ctrl+1";
          wacomtablet."Map to screen 2" = "Meta+Ctrl+2";
          wacomtablet."Next Profile" = "Meta+Ctrl+N";
          wacomtablet."Previous Profile" = "Meta+Ctrl+P";
          wacomtablet."Toggle screen map selection" = "Meta+Ctrl+M";
          wacomtablet."Toggle stylus mode" = "Meta+Ctrl+S";
          wacomtablet."Toggle touch tool" = "Meta+Ctrl+T";
          yakuake.toggle-window-state = [ ];
        };
        configFile = {
          baloofilerc."Basic Settings".Indexing-Enabled = false;
          baloofilerc.General.dbVersion = 2;
          baloofilerc.General."exclude filters" =
            "*~,*.part,*.o,*.la,*.lo,*.loT,*.moc,moc_*.cpp,qrc_*.cpp,ui_*.h,cmake_install.cmake,CMakeCache.txt,CTestTestfile.cmake,libtool,config.status,confdefs.h,autom4te,conftest,confstat,Makefile.am,*.gcode,.ninja_deps,.ninja_log,build.ninja,*.csproj,*.m4,*.rej,*.gmo,*.pc,*.omf,*.aux,*.tmp,*.po,*.vm*,*.nvram,*.rcore,*.swp,*.swap,lzo,litmain.sh,*.orig,.histfile.*,.xsession-errors*,*.map,*.so,*.a,*.db,*.qrc,*.ini,*.init,*.img,*.vdi,*.vbox*,vbox.log,*.qcow2,*.vmdk,*.vhd,*.vhdx,*.sql,*.sql.gz,*.ytdl,*.tfstate*,*.class,*.pyc,*.pyo,*.elc,*.qmlc,*.jsc,*.fastq,*.fq,*.gb,*.fasta,*.fna,*.gbff,*.faa,po,CVS,.svn,.git,_darcs,.bzr,.hg,CMakeFiles,CMakeTmp,CMakeTmpQmake,.moc,.obj,.pch,.uic,.npm,.yarn,.yarn-cache,__pycache__,node_modules,node_packages,nbproject,.terraform,.venv,venv,core-dumps,lost+found";
          baloofilerc.General."exclude filters version" = 9;
          dolphinrc.DetailsMode.PreviewSize = 32;
          dolphinrc.General.EditableUrl = true;
          dolphinrc.General.FilterBar = true;
          dolphinrc.General.RememberOpenedTabs = false;
          dolphinrc.General.ShowFullPath = true;
          dolphinrc.General.ShowFullPathInTitlebar = true;
          dolphinrc.General.ShowStatusBar = "FullWidth";
          dolphinrc.General.ViewPropsTimestamp = "2025,6,3,12,31,21.852";
          dolphinrc."KFileDialog Settings"."Places Icons Auto-resize" = false;
          dolphinrc."KFileDialog Settings"."Places Icons Static Size" = 22;
          dolphinrc.PreviewSettings.Plugins = "ffmpegthumbnailer,appimagethumbnail,audiothumbnail,blenderthumbnail,comicbookthumbnail,cursorthumbnail,djvuthumbnail,ebookthumbnail,exrthumbnail,directorythumbnail,fontthumbnail,heif,imagethumbnail,glycin-image-rs,jpegthumbnail,kraorathumbnail,windowsexethumbnail,windowsimagethumbnail,mobithumbnail,opendocumentthumbnail,gsthumbnail,rawthumbnail,glycin-svg,svgthumbnail,ffmpegthumbs,gsf-office";
          kactivitymanagerdrc.activities."31551634-b85d-4314-acea-0315f04daf55" = "Default";
          kactivitymanagerdrc.main.currentActivity = "31551634-b85d-4314-acea-0315f04daf55";
          kcminputrc."Libinput/1133/50503/Logitech USB Receiver".PointerAcceleration = 1.000;
          kcminputrc."Libinput/1133/50503/Logitech USB Receiver".PointerAccelerationProfile = 1;
          kcminputrc."Libinput/1267/12693/ELAN0676:00 04F3:3195 Mouse".NaturalScroll = false;
          kcminputrc."Libinput/1267/12693/ELAN0676:00 04F3:3195 Touchpad".NaturalScroll = true;
          kcminputrc."Libinput/2/10/TPPS\\/2 Elan TrackPoint".NaturalScroll = true;
          kcminputrc."Libinput/2/10/TPPS\\/2 Elan TrackPoint".PointerAcceleration = 0.200;
          kcminputrc."Libinput/2/10/TPPS\\/2 Elan TrackPoint".ScrollFactor = 0.75;
          kcminputrc."Libinput/5426/183/Razer Razer DeathAdder V3 Pro".PointerAcceleration = 1.000;
          kcminputrc."Libinput/5426/183/Razer Razer DeathAdder V3 Pro".PointerAccelerationProfile = 1;
          kcminputrc."Libinput/6127/24748/Lenovo Lenovo 300 Wireless Compact Mouse".PointerAcceleration =
            1.000;
          kcminputrc."Libinput/6127/24748/Lenovo Lenovo 300 Wireless Compact Mouse".PointerAccelerationProfile =
            1;
          kcminputrc.Mouse.cursorTheme = "breeze_cursors";
          kded5rc.Module-browserintegrationreminder.autoload = false;
          kded5rc.Module-device_automounter.autoload = false;
          kdeglobals.General.TerminalApplication = "alacritty";
          kdeglobals.General.TerminalService = "Alacritty.desktop";
          kdeglobals.General.UseSystemBell = true;
          kdeglobals."KFileDialog Settings"."Allow Expansion" = false;
          kdeglobals."KFileDialog Settings"."Automatically select filename extension" = true;
          kdeglobals."KFileDialog Settings"."Breadcrumb Navigation" = true;
          kdeglobals."KFileDialog Settings"."Decoration position" = 2;
          kdeglobals."KFileDialog Settings"."Show Full Path" = false;
          kdeglobals."KFileDialog Settings"."Show Inline Previews" = true;
          kdeglobals."KFileDialog Settings"."Show Preview" = false;
          kdeglobals."KFileDialog Settings"."Show Speedbar" = true;
          kdeglobals."KFileDialog Settings"."Show hidden files" = false;
          kdeglobals."KFileDialog Settings"."Sort by" = "Name";
          kdeglobals."KFileDialog Settings"."Sort directories first" = true;
          kdeglobals."KFileDialog Settings"."Sort hidden files last" = false;
          kdeglobals."KFileDialog Settings"."Sort reversed" = false;
          kdeglobals."KFileDialog Settings"."Speedbar Width" = 140;
          kdeglobals."KFileDialog Settings"."View Style" = "DetailTree";
          kdeglobals.Shortcuts.ShowMenubar = "; Ctrl+M";
          kdeglobals.Sounds.Theme = "freedesktop";
          kdeglobals.WM.activeBackground = "39,44,49";
          kdeglobals.WM.activeBlend = "252,252,252";
          kdeglobals.WM.activeForeground = "252,252,252";
          kdeglobals.WM.inactiveBackground = "32,36,40";
          kdeglobals.WM.inactiveBlend = "161,169,177";
          kdeglobals.WM.inactiveForeground = "161,169,177";
          kiorc.Confirmations.ConfirmDelete = true;
          kiorc.Confirmations.ConfirmEmptyTrash = true;
          kiorc.Confirmations.ConfirmTrash = false;
          kiorc."Executable scripts".behaviourOnLaunch = "alwaysAsk";
          klaunchrc.BusyCursorSettings.Bouncing = false;
          klaunchrc.FeedbackStyle.BusyCursor = false;
          klaunchrc.FeedbackStyle.TaskbarButton = false;
          klipperrc.General.IgnoreImages = false;
          klipperrc.General.MaxClipItems = 2048;
          krunnerrc.Plugins.baloosearchEnabled = false;
          krunnerrc.Plugins.browserhistoryEnabled = false;
          krunnerrc.Plugins.browsertabsEnabled = false;
          krunnerrc.Plugins.krunner_appstreamEnabled = false;
          krunnerrc.Plugins.krunner_bookmarksrunnerEnabled = false;
          krunnerrc.Plugins.krunner_katesessionsEnabled = false;
          krunnerrc.Plugins.krunner_konsoleprofilesEnabled = false;
          krunnerrc.Plugins.krunner_plasma-desktopEnabled = false;
          krunnerrc.Plugins.krunner_recentdocumentsEnabled = false;
          krunnerrc.Plugins.krunner_sessionsEnabled = false;
          krunnerrc.Plugins.krunner_webshortcutsEnabled = false;
          krunnerrc.Plugins."org.kde.activities2Enabled" = false;
          krunnerrc.Plugins.windowsEnabled = false;
          krunnerrc."Plugins/Favorites".plugins =
            "krunner_services,krunner_powerdevil,krunner_systemsettings";
          kscreenlockerrc.Daemon.Autolock = false;
          kscreenlockerrc.Daemon.Timeout = 0;
          kservicemenurc.Show.compressfileitemaction = true;
          kservicemenurc.Show.extractfileitemaction = true;
          kservicemenurc.Show.filelight = true;
          kservicemenurc.Show.forgetfileitemaction = true;
          kservicemenurc.Show.installFont = true;
          kservicemenurc.Show.kactivitymanagerd_fileitem_linking_plugin = true;
          kservicemenurc.Show.kdeconnectfileitemaction = true;
          kservicemenurc.Show.kio-admin = true;
          kservicemenurc.Show.makefileactions = true;
          kservicemenurc.Show.mountisoaction = true;
          kservicemenurc.Show.movetonewfolderitemaction = true;
          kservicemenurc.Show.nextclouddolphinactionplugin = true;
          kservicemenurc.Show.plasmavaultfileitemaction = true;
          kservicemenurc.Show.runInKonsole = true;
          kservicemenurc.Show.setfoldericonitemaction = true;
          kservicemenurc.Show.sharefileitemaction = true;
          kservicemenurc.Show.slideshowfileitemaction = true;
          kservicemenurc.Show.tagsfileitemaction = true;
          kservicemenurc.Show.wallpaperfileitemaction = true;
          ksmserverrc.General.loginMode = "emptySession";
          ktrashrc."\\/home\\/dennis\\/.local\\/share\\/Trash".Days = 7;
          ktrashrc."\\/home\\/dennis\\/.local\\/share\\/Trash".LimitReachedAction = 0;
          ktrashrc."\\/home\\/dennis\\/.local\\/share\\/Trash".Percent = 10;
          ktrashrc."\\/home\\/dennis\\/.local\\/share\\/Trash".UseSizeLimit = true;
          ktrashrc."\\/home\\/dennis\\/.local\\/share\\/Trash".UseTimeLimit = false;
          kwalletrc.Wallet."Close When Idle" = false;
          kwalletrc.Wallet."Close on Screensaver" = false;
          kwalletrc.Wallet."Default Wallet" = "kdewallet";
          kwalletrc.Wallet.Enabled = true;
          kwalletrc.Wallet."First Use" = false;
          kwalletrc.Wallet."Idle Timeout" = 10;
          kwalletrc.Wallet."Launch Manager" = false;
          kwalletrc.Wallet."Leave Manager Open" = false;
          kwalletrc.Wallet."Leave Open" = true;
          kwalletrc.Wallet."Prompt on Open" = false;
          kwalletrc.Wallet."Use One Wallet" = true;
          kwalletrc."org.freedesktop.secrets".apiEnabled = true;
          kwinrc.Effect-overview.BorderActivate = 9;
          kwinrc.Plugins.blurEnabled = true;
          kwinrc.Plugins.shakecursorEnabled = false;
          kwinrc.TabBox.LayoutName = "sidebar";
          kwinrc.TabBoxAlternative.LayoutName = "compact";
          kwinrc.Tiling."[Tiling][232dd94f-3cdb-4773-8e18-1127d95c6b46][]" = "";
          kwinrc.Tiling.padding = 4;
          kwinrulesrc."7886fe71-cfdd-4bb1-a8f7-a8d0c8127863".Description = "Application settings for Threema";
          kwinrulesrc."7886fe71-cfdd-4bb1-a8f7-a8d0c8127863".desktopfile = "ch.threema.threema-desktop";
          kwinrulesrc.General.count = 3;
          kxkbrc.Layout.LayoutList = "de";
          kxkbrc.Layout.Options = "caps:ctrl_modifier";
          kxkbrc.Layout.ResetOldOptions = true;
          kxkbrc.Layout.Use = true;
          kxkbrc.Layout.VariantList = "us";
          plasma-localerc.Formats.LANG = "en_US.UTF-8";
          plasma-localerc.Formats.LC_ADDRESS = "de_DE.UTF-8";
          plasma-localerc.Formats.LC_MEASUREMENT = "de_DE.UTF-8";
          plasma-localerc.Formats.LC_MONETARY = "de_DE.UTF-8";
          plasma-localerc.Formats.LC_NAME = "de_DE.UTF-8";
          plasma-localerc.Formats.LC_NUMERIC = "en_US.UTF-8";
          plasma-localerc.Formats.LC_PAPER = "de_DE.UTF-8";
          plasma-localerc.Formats.LC_TELEPHONE = "de_DE.UTF-8";
          plasma-localerc.Formats.LC_TIME = "de_DE.UTF-8";
          plasma-localerc.Translations.LANGUAGE = "en_US";
          plasmanotifyrc."Applications/com.nextcloud.desktopclient.nextcloud".Seen = true;
          plasmanotifyrc."Applications/firefox".Seen = true;
          plasmanotifyrc."Applications/info.mumble.Mumble".Seen = true;
          plasmarc.Wallpapers.usersWallpapers = "";
          spectaclerc.Annotations.annotationToolType = 5;
          spectaclerc.GuiConfig.includePointer = true;
          spectaclerc.ImageSave.imageFilenameTemplate = "<yyyy><MM><dd>_<HH><mm><ss>";
          spectaclerc.ImageSave.imageSaveLocation = "file:///home/dennis/screenshots";
          spectaclerc.ImageSave.translatedScreenshotsFolder = "Screenshots";
          spectaclerc.VideoSave.preferredVideoFormat = 2;
          spectaclerc.VideoSave.translatedScreencastsFolder = "Screencasts";
          spectaclerc.VideoSave.videoSaveLocation = "file:///home/dennis/screenshots/recordings";
        };
      };
    };
  };
}
