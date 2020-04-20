#! /bin/bash

declare -A REDIRECTS=(
    ['coef_variation']='https://en.wikipedia.org/wiki/Coefficient_of_variation'
    ['contraction']='https://en.wikipedia.org/wiki/Edge_contraction'
    ['correlation_coef']='https://en.wikipedia.org/wiki/Correlation_coefficient'
    ['eccentricity']='https://en.wikipedia.org/wiki/Eccentricity_(graph_theory)'
    ['help']='https://graphia.app/userguide.html'
    ['knn']='https://en.wikipedia.org/wiki/K-nearest_neighbors_algorithm'
    ['louvain']='https://en.wikipedia.org/wiki/Louvain_modularity'
    ['mcl']='https://micans.org/mcl/'
    ['pagerank']='https://en.wikipedia.org/wiki/PageRank'
    ['pearson']='https://en.wikipedia.org/wiki/Pearson_correlation_coefficient'
    ['regex']='https://perldoc.perl.org/perlre.html'
    ['register']='https://kajeka.com/graphia-download'
    ['spanning_tree']='https://en.wikipedia.org/wiki/Spanning_tree'
    ['spearman']='https://en.wikipedia.org/wiki/Spearman%27s_rank_correlation_coefficient'
    ['stddev']='https://en.wikipedia.org/wiki/Standard_deviation'
    ['variance']='https://en.wikipedia.org/wiki/Variance'
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
