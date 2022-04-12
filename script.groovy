def Build() {
    echo 'Building...'
    echo "A env variable: ${_VAR}"
}

def Test() {
    echo 'Testing...'
}

def Deploy() {
    echo 'Deploying...'
    echo "Version: ${params.VERSION}"
}

return this