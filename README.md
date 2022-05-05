# jtbx.github.io
My GitHub pages site.

[jtbx.github.io](https://jtbx.github.io)

## Package repositories

### mksh

This contains one package; mksh from the AUR.

It is used for obtaining and updating the mksh package.

The package is updated on the first day of each month, that is, New Zealand date, one day before the monthly Arch Linux release.

To add the repository, add this to /etc/pacman.conf:

    [mksh]
    SigLevel = Optional TrustedOnly
    Server = https://jtbx.github.io/$repo/$arch
