#!/bin/bash
find . -name '*.mo' -delete
mkdir -p unicorecmsmnmcameroon/locale

pot-create -o unicorecmsmnmcameroon/locale/unicorecmsmnmcameroon.pot unicorecmsmnmcameroon/

declare -a arr=("eng_GB")

for lang in "${arr[@]}"
do
    mkdir -p "unicorecmsmnmcameroon/locale/""$lang""/LC_MESSAGES"

    if [ ! -f "unicorecmsmnmcameroon/locale/""$lang""/LC_MESSAGES/unicorecmsmnmcameroon.po" ]; then
        msginit -l $lang -i unicorecmsmnmcameroon/locale/unicorecmsmnmcameroon.pot -o unicorecmsmnmcameroon/locale/$lang/LC_MESSAGES/unicorecmsmnmcameroon.po
    fi

    msgmerge --update unicorecmsmnmcameroon/locale/$lang/LC_MESSAGES/unicorecmsmnmcameroon.po unicorecmsmnmcameroon/locale/unicorecmsmnmcameroon.pot
    msgfmt unicorecmsmnmcameroon/locale/$lang/LC_MESSAGES/*.po -o unicorecmsmnmcameroon/locale/$lang/LC_MESSAGES/unicorecmsmnmcameroon.mo
done
