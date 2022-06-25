# https://docs.aws.amazon.com/cli/latest/reference/lambda/update-function-code.html

    declare -a arr=("tser-fun" "tser-fun2")
    zip lambdas.zip lambda-functions/*

    echo "\nDeploying lambdas... \n"

    for i in "${arr[@]}"
    do
        aws lambda update-function-code \
        --function-name  $i \
        --zip-file fileb://lambdas.zip \
        --region us-east-1 
    done
