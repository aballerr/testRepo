# https://docs.aws.amazon.com/cli/latest/reference/lambda/update-function-code.html

read -p "Deploy to Prod? (Y or N): " response
 
if [ $response = "Y" ]; then
    #Add function names here
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

    echo "\nFinished deploying lambdas... \n "
    rm lambdas.zip
else
    echo "Exiting..."
fi










