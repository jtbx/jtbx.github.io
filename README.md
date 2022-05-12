# jtbx.github.io
My GitHub pages site.

[jtbx.github.io](https://jtbx.github.io)

## Package repositories

All packages here are updated on the first day of each month, that is, New Zealand date, one day before the monthly Arch Linux release.

### jtbx-aur

This contains packages I use from the AUR.

To add the repository, add this to /etc/pacman.conf:

    [jtbx-aur]
    SigLevel = Optional TrustedOnly
    Server = https://jtbx.github.io/$repo/$arch

Packages:

* librewolf

* schildichat-desktop

* nsxiv

* lf

* nerd-fonts-jetbrains-mono

More will likely be added in the future.

### mksh

This contains one package; mksh from the AUR.

It is used for obtaining and updating the mksh package.

To add the repository, add this to /etc/pacman.conf:

    [mksh]
    SigLevel = Optional TrustedOnly
    Server = https://jtbx.github.io/$repo/$arch
