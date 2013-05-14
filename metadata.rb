name             "dotfiles"
maintainer       "Christian Nicolai"
maintainer_email "cn@mycrobase.de"
license          "Apache 2.0"
description      "This cookbook clones a git repository per specified user and afterwards calls a configuration script."
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "1.3.0"

depends "git"

supports "debian"
