#Package: *
#Pin: origin dev.example.com
#Pin-Priority: 1000
#
#Package: *
#Pin: origin ubuntu-cloud.archive.canonical.com
#Pin-Priority: 900
#
#Package: *
#Pin: origin packages.example.com
#Pin-Priority: 800

apt:
  repo:
    1000: "origin dev.example.com"
    900: "origin ubuntu-cloud.archive.canonical.com"
    800: "origin packages.example.com"

