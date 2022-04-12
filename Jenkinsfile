pipeline {
    agent any
    environment {
        _VAR = 'this is a env variable'
    }

    parameters {
        choice(name: 'VERSION', choices: ['1.0.0', '2.0.0'], description: 'version description')
        booleanParam(name: 'executeTests', defaultValue: true, description: 'exec test description')
    }

    stages {
        
        stage("Build") {
            steps {
                echo 'Building...'
                echo "A env variable ${_VAR}"
            }
        }

        stage("Test") {
            when {
                expression {
                    BRANCH_NAME == 'wengchaoxi-jenkins-test' && params.executeTests
                }
            }
            steps {
                echo 'Testing...'
            }
        }

        stage("Deploy") {
            steps {
                echo 'Deploying...'
            }
        }
    }

    post {
        always {
            echo 'echo post: always'
        }
        success {
            echo 'echo post: success'
        }
        failure {
            echo 'echo post: failure'
        }
    }
}