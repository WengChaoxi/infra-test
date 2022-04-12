def gv

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
        
        stage("Init") {
            steps {
                script {
                    gv = load "script.groovy"
                }
            }
        }

        stage("Build") {
            steps {
                script {
                    gv.Build()
                }
            }
        }

        stage("Test") {
            when {
                expression {
                    BRANCH_NAME == 'wengchaoxi-jenkins-test' && params.executeTests
                }
            }
            steps {
                script {
                    gv.Test()
                }
            }
        }

        stage("Deploy") {
            steps {
                script {
                    gv.Test()
                }
            }
        }
    }

    post {
        always {
            sh 'echo post: always'
        }
        success {
            sh 'echo post: success'
        }
        failure {
            sh 'echo post: failure'
        }
    }
}