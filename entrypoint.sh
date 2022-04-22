#!/bin/sh -l

if [[ "$1" == "before-destroy" ]]; then
    printf "\033[0;36m================================================================================================================> Condition 1: Before destroy step \033[0m\n"

    printf "\033[0;32m============> Git checkout: New branch tf_destroy_$2_$5 \033[0m\n"
    git checkout -b "tf_destroy_$2_$5"
    git config --local user.email "action@github.com"
    git config --local user.name "GitHub Action"
    echo "$2/$3/$4/$5" >> destroy_path.txt

    printf "\033[0;32m============> Git push: Branch tf_destroy_$ENVIRONMENT_$RESOURCE \033[0m\n"
    git add -A .
    git commit -m "Destroy resource $5 in $2"
    git push --set-upstream origin "tf_destroy_$2_$5"


    printf "\033[0;32m============> Open PR: tf_destroy_$2_$5 -> develop \033[0m\n"
    gh pr create --head release --base develop -t "[ Terraform destroy ]: Automatic PR opened by GitHub Actions"


elif [[ "$1" == "after-destroy" ]]; then

fi