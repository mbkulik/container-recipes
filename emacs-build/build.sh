#!/usr/bin/env bash

set -eu -o pipefail
shopt -s failglob

#clone repo
git clone https://github.com/mbkulik/emacs-pgtk-nativecomp.git

#change to repo
pushd /root/emacs-pgtk-nativecomp > /dev/null

#downloads src
spectool -g --source 0  --directory /root/rpmbuild/SOURCES emacs.spec

#copy source files from repo to SOURCES
cp {*.el,*.patch,*.desktop,*.sh,*.xml,*.service,*.gpg} /root/rpmbuild/SOURCES/

#build packages
rpmbuild -ba emacs.spec

popd > /dev/null
