def build() {
    echo 'Building...'
    echo "A env variable: ${_VAR}"
}

def test() {
    echo 'Testing...'
}

def deploy() {
    echo 'Deploying...'
    echo "Version: ${params.VERSION}"
}

return this