homebrew-virt-manager
=====================

A set of [homebrew][homebrew] formulae to install [`virt-manager`][virt-manager] and [`virt-viewer`][virt-viewer] on Mac OSX.
Forked from jeffreywildman.

## Usage

    brew tap roeme/homebrew-virt-manager
    brew install virt-manager virt-viewer
    virt-manager -c test:///default

## FAQs

### My issue has been closed?

This fork is for my personal use and shared here for others to waste less time in getting the software up and running.
That being said, I don't have the resources available for general user support. While I gladly accept PR's that solve
problems that I encounter personally or are reproduced trivially within the confines of my setup, I cannot do this
for anything else (upstream issues, for example). If you encounter an issue that is not dependent on your setup,
it's likely that I have so as well or will soon. Then, the issue will be fixed.

### Homebrew complains about osinfo-db

Your google-fu is weak: That's an known issue, they've been migrated to homebrew-core. 
Uninstall osinfo-db & osinfo-db-tools, and either reinstall virt-manager or switch to one of the many 
forks of this formula.


[homebrew]: http://brew.sh/
[virt-manager]: https://virt-manager.org/
[virt-viewer]: https://virt-manager.org/