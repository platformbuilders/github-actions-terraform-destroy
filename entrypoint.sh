#!/bin/sh -l

if [[ "$1" == "before-destroy" ]]; then
    printf "\033[0;36m================================================================================================================> Condition 1: Before destroy step \033[0m\n"

    printf "\033[0;32m============> Git checkout: New branch tf-destroy/$2-$5 \033[0m\n"
    git checkout -b "tf-destroy/$2-$5"
    git config --local user.email "action@github.com"
    git config --local user.name "GitHub Action"
    cd $2/$3/$4/$5
    echo "$2/$3/$4/$5" >> destroy_path.txt

    printf "\033[0;32m============> Publish .env file \033[0m\n"
    echo "GITOPS_BRANCH=homolog" >> $GITHUB_ENV
    echo "ENVIRONMENT=$2" >> destroy_env_vars.env
    echo "REGION=$3" >> destroy_env_vars.env
    echo "SERVICE=$4" >> destroy_env_vars.env
    echo "RESOURCE=$5" >> destroy_env_vars.env

    printf "\033[0;32m============> Git push: Branch tf-destroy/$2-$5 \033[0m\n"
    git add -A .
    git commit -m "Destroy resource $5 in $2"
    git push --set-upstream origin "tf-destroy/$2-$5"

    printf "\033[0;32m============> Open PR: tf-destroy/$2-$5 -> develop \033[0m\n"
    export GITHUB_TOKEN=$6
    gh pr create --head tf-destroy/$2-$5 --base develop -t "[ Terraform destroy ]: Automatic PR opened by GitHub Actions" --body "[ Terraform destroy ]: Automatic PR opened by GitHub Actions"

elif [[ "$1" == "after-destroy" ]]; then
    echo "nothing..."
fi