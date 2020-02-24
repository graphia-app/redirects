#! /bin/bash

declare -A REDIRECTS=(
    ['regex']='https://perldoc.perl.org/perlre.html'
)


for NAME in "${!REDIRECTS[@]}"
do
    URL="${REDIRECTS[$NAME]}"

    INDEX_HTML="<!DOCTYPE html>
        <meta charset=\"utf-8\">
        <title>Redirecting...</title>
        <meta http-equiv=\"refresh\" content=\"0; URL=${URL}\">
        <link rel=\"canonical\" href=\"${URL}\">"

    if [[ -e "${NAME}" ]]
    then
        if [[ ! -d "${NAME}" ]]
        then
            echo "${NAME} exists but it isn't a directory"
            exit 1
        fi
    fi

    mkdir -p ${NAME}
    echo ${INDEX_HTML} > "${NAME}/index.html"
done
